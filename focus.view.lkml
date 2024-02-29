explore: focus {
  join: gc_Credits {
    sql:  LEFT JOIN UNNEST(${focus.gc_credits}) as gc_Credits ;;
    relationship: one_to_many
  }
  join: ServiceCategory {
    sql: LEFT JOIN UNNEST(${focus.service_category}) as ServiceCategory ;;
    relationship: one_to_many
  }
  join: tags {
    sql: LEFT JOIN UNNEST(${focus.tags}) as tags ;;
    relationship: one_to_many
  }
}

view: focus {
  derived_table: {
    datagroup_trigger: daily_datagroup
    sql:
    WITH
    usage_export AS (
    SELECT
     *,
     (
     SELECT
       AS STRUCT type,
       id,
       full_name
     FROM
       UNNEST(credits)
     WHERE
       type IN UNNEST(["COMMITTED_USAGE_DISCOUNT", "COMMITTED_USAGE_DISCOUNT_DOLLAR_BASE"])
     LIMIT
       1) AS cud,
     ARRAY( ( (
         SELECT
           AS STRUCT key AS key,
           value AS value,
           "label" AS type,
           FALSE AS inherited,
           "n/a" AS namespace
         FROM
           UNNEST(labels))
       UNION ALL (
         SELECT
           AS STRUCT key AS key,
           value AS value,
           "system_label" AS type,
           FALSE AS inherited,
           "n/a" AS namespace
         FROM
           UNNEST(system_labels))
       UNION ALL (
         SELECT
           AS STRUCT key AS key,
           value AS value,
           "project_label" AS type,
           TRUE AS inherited,
           "n/a" AS namespace
         FROM
           UNNEST(project.labels))
       UNION ALL (
         SELECT
           AS STRUCT key AS key,
           value AS value,
           "tag" AS type,
           inherited AS inherited,
           namespace AS namespace
         FROM
           UNNEST(tags) ) )) AS focus_tags,
    FROM
    `@{BILLING_TABLE}`), --updated table alias
    prices AS (
    SELECT
     *,
     flattened_prices
    FROM
     `@{PRICING_TABLE}`, -- updated pricing alias
     UNNEST(list_price.tiered_rates) AS flattened_prices
    WHERE DATE(export_time) = '2023-05-01')
    -- replace with a date after you enabled pricing export to use pricing data as of this date
    SELECT
    usage_export.location.zone AS AvailabilityZone,
    usage_export.billing_account_id AS BillingAccountId,
    usage_export.currency AS BillingCurrency,
    DATETIME(PARSE_DATE("%Y%m", invoice.month)) AS BillingPeriodStart,
    DATETIME(DATE_SUB(DATE_ADD(PARSE_DATE("%Y%m", invoice.month), INTERVAL 1 MONTH), INTERVAL 1 DAY)) AS BillingPeriodEnd,
    usage_export.sku.description AS ChargeDescription,
    usage_export.usage_start_time AS ChargePeriodStart,
    usage_export.usage_end_time AS ChargePeriodEnd,
    CASE usage_export.cud.type
     WHEN "COMMITTED_USAGE_DISCOUNT_DOLLAR_BASE" THEN "Spend"
     WHEN "COMMITTED_USAGE_DISCOUNT" THEN "Usage"
     END
     AS CommitmentDiscountCategory,
    usage_export.cud.id AS CommitmentDiscountId,
    usage_export.cud.full_name AS CommitmentDiscountName,
    usage_export.cud.type AS CommitmentDiscountType,
    CAST(usage_export.cost_at_list AS numeric) AS ListCost,
    prices.flattened_prices.account_currency_amount AS ListUnitPrice,
    usage_export.price.pricing_unit_quantity AS PricingQuantity,
    usage_export.price.unit AS PricingUnit,
    usage_export.seller_name AS ProviderName,
    usage_export.transaction_type AS PublisherName,
    usage_export.location.region AS Region,
    usage_export.resource.global_name AS ResourceId,
    usage_export.resource.name AS ResourceName,
    prices.product_taxonomy AS ServiceCategory,
    usage_export.service.description AS ServiceName,
    usage_export.sku.id AS SkuId,
    CONCAT("SKU ID:", usage_export.sku.id, ", Price Tier Start Amount: ", price.tier_start_amount) AS SkuPriceId,
    usage_export.focus_tags AS Tags,
    CAST(usage_export.usage.amount AS numeric) AS UsageAmount,
    usage_export.usage.unit AS UsageUnit,
    CAST(usage_export.cost AS NUMERIC) AS gc_Cost,
    ARRAY((
     SELECT
       AS STRUCT name AS Name,
       CAST(amount AS numeric) AS Amount,
       full_name AS FullName,
       id AS Id,
       type AS Type
     FROM
       UNNEST(usage_export.credits))) AS gc_Credits,
    usage_export.cost_type AS gc_CostType
    FROM
    usage_export
    LEFT JOIN
    prices
    ON
    usage_export.sku.id = prices.sku.id
    AND usage_export.price.tier_start_amount = prices.flattened_prices.start_usage_amount;;
  }

  dimension: availability_zone {
    type: string
    sql: ${TABLE}.AvailabilityZone ;;
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.BillingAccountId ;;
  }

  dimension: billing_currency {
    type: string
    sql: ${TABLE}.BillingCurrency ;;
  }

  dimension_group: billing_period_start {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.BillingPeriodStart;;
  }

  dimension_group: billing_period_end {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.BillingPeriodEnd;;
  }

  dimension: charge_description {
    type: string
    sql: ${TABLE}.ChargeDescription ;;
  }

  dimension_group: charge_period_start {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ChargePeriodStart ;;
  }

  dimension_group: charge_period_end {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ChargePeriodEnd ;;
  }

  dimension: commitment_discount_category {
    type: string
    group_label: "CUDs"
    sql: ${TABLE}.CommitmentDiscountCategory ;;
  }

  dimension: commitment_discount_id {
    type: string
    group_label: "CUDs"
    sql: ${TABLE}.CommitmentDiscountId ;;
  }

  dimension: commitment_discount_name {
    type: string
    group_label: "CUDs"
    sql: ${TABLE}.CommitmentDiscountName ;;
  }

  dimension: commitment_discount_type {
    type: string
    group_label: "CUDs"
    sql: ${TABLE}.CommitmentDiscountType ;;
  }

  dimension: list_cost {
    type: number
    hidden: yes
    sql: ${TABLE}.ListCost ;;
  }

  dimension: list_unit_price {
    type: string
    sql: ${TABLE}.ListUnitPrice ;;
  }

  dimension: pricing_quantity {
    type: string
    sql: ${TABLE}.PricingQuantity ;;
  }

  dimension: pricing_unit {
    type: string
    sql: ${TABLE}.PricingUnit ;;
  }

  dimension: provider_name {
    type: string
    sql: ${TABLE}.ProviderName ;;
  }

  dimension: publisher_name {
    type: string
    sql: ${TABLE}.PublisherName ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: resource_id {
    type: string
    sql: ${TABLE}.ResourceId ;;
  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}.ResourceName ;;
  }

  dimension: service_category {
    type: string
    hidden: yes
    sql: ${TABLE}.ServiceCategory ;;
  }

  dimension: service_name {
    type: string
    sql: ${TABLE}.ServiceName ;;
  }

  dimension: sku_id {
    type: string
    sql: ${TABLE}.SkuId ;;
  }

  dimension: sku_price_id {
    type: string
    sql: ${TABLE}.SkuPriceId ;;
  }

  dimension: tags {
    type: string
    hidden: yes
    sql: ${TABLE}.Tags ;;
  }

  dimension: usage_amount {
    type: string
    hidden: yes
    sql: ${TABLE}.UsageAmount ;;
  }

  dimension: usage_unit {
    type: string
    sql: ${TABLE}.UsageUnit ;;
  }

  dimension: gc_cost {
    type: number
    group_label: "Google Cloud Fields"
    label: "Google Cloud Cost"
    hidden: yes
    sql: ${TABLE}.gc_Cost ;;
  }

  dimension: gc_credits {
    type: string
    hidden: yes
    sql: ${TABLE}.gc_Credits ;;
  }

  dimension: gc_cost_type {
    type: string
    group_label: "Google Cloud Fields"
    label: "Google Cloud Cost Type"
    sql: ${TABLE}.gc_CostType ;;
  }

  ###### MEASURES ######
  measure: total_list_cost {
    type: sum
    value_format_name: usd_0
    sql: ${list_cost} ;;
  }

  measure: total_gc_cost {
    type: sum
    group_label: "Google Cloud Fields"
    label: "Total Google Cloud Cost"
    sql: ${gc_cost} ;;
  }

  measure: total_usage_amount {
    type: sum
    value_format_name: decimal_0
    sql: ${usage_amount} ;;
  }
}

view: gc_Credits {
  view_label: "Focus"

  dimension: amount {
    type: number
    hidden: yes
    sql: ${TABLE}.amount ;;
  }

  dimension: full_name {
    type: string
    group_label: "Google Cloud Credits"
    sql: ${TABLE}.fullname ;;
  }

  dimension: id {
    type: string
    group_label: "Google Cloud Credits"
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    group_label: "Google Cloud Credits"
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    group_label: "Google Cloud Credits"
    sql: ${TABLE}.type ;;
  }

  measure: total_amount {
    type: sum
    label: "Google Cloud Credit Amount"
    group_label: "Google Cloud Fields"
    value_format_name: usd_0
    sql: ${amount} ;;
  }
}

view: ServiceCategory {
  view_label: "Focus"
  dimension: service_category {
    type: string
    sql: ${TABLE} ;;
  }
}

view: tags {
  view_label: "Focus"

  dimension: inherited {
    type: yesno
    group_label: "Tags"
    sql: ${TABLE}.inherited ;;
  }

  dimension: key {
    type: string
    group_label: "Tags"
    sql:  ${TABLE}.key ;;
  }

  dimension: namespace {
    type: string
    group_label: "Tags"
    sql:  ${TABLE}.namespace ;;
  }

  dimension: type {
    type: string
    group_label: "Tags"
    sql:  ${TABLE}.type ;;
  }

  dimension: value {
    type: string
    group_label: "Tags"
    sql:  ${TABLE}.value ;;
  }
}
