- dashboard: focus
  title: FOCUS
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: MTD List Cost
    name: MTD List Cost
    model: focus
    explore: focus
    type: single_value
    fields: [focus.total_list_cost]
    filters:
      focus.charge_period_start_month: 1 months
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 4
    height: 2
  - title: QTD List Cost
    name: QTD List Cost
    model: focus
    explore: focus
    type: single_value
    fields: [focus.total_list_cost]
    filters:
      focus.charge_period_start_quarter: 1 quarters
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    defaults_version: 1
    listen: {}
    row: 4
    col: 0
    width: 4
    height: 2
  - title: YTD List Cost
    name: YTD List Cost
    model: focus
    explore: focus
    type: single_value
    fields: [focus.total_list_cost]
    filters:
      focus.charge_period_start_date: 1 years
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    defaults_version: 1
    listen: {}
    row: 6
    col: 0
    width: 4
    height: 2
  - title: Cost by Service
    name: Cost by Service
    model: focus
    explore: focus
    type: looker_grid
    fields: [focus.total_list_cost, focus.service_name]
    sorts: [focus.total_list_cost desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    listen: {}
    row: 16
    col: 0
    width: 12
    height: 5
  - title: Cost by Region
    name: Cost by Region
    model: focus
    explore: focus
    type: looker_grid
    fields: [focus.total_list_cost, focus.region]
    filters:
      focus.region: "-NULL"
    sorts: [focus.total_list_cost desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    row: 21
    col: 0
    width: 12
    height: 5
  - title: WTD List Cost
    name: WTD List Cost
    model: focus
    explore: focus
    type: single_value
    fields: [focus.total_list_cost]
    filters:
      focus.charge_period_start_date: 1 weeks
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 4
    height: 2
  - title: Cost by Charge Description
    name: Cost by Charge Description
    model: focus
    explore: focus
    type: looker_grid
    fields: [focus.total_list_cost, focus.charge_description]
    sorts: [focus.total_list_cost desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    row: 16
    col: 12
    width: 12
    height: 5
  - title: Cost by Billing Account
    name: Cost by Billing Account
    model: focus
    explore: focus
    type: looker_grid
    fields: [focus.total_list_cost, focus.billing_account_id]
    filters:
      focus.region: "-NULL"
    sorts: [focus.total_list_cost desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    row: 21
    col: 12
    width: 12
    height: 5
  - title: Monthly Spend by Publisher
    name: Monthly Spend by Publisher
    model: focus
    explore: focus
    type: looker_line
    fields: [focus.total_list_cost, focus.publisher_name, focus.charge_period_start_month]
    pivots: [focus.publisher_name]
    fill_fields: [focus.charge_period_start_month]
    filters:
      focus.charge_period_start_month: after 2023/05/01
    sorts: [focus.publisher_name, focus.total_list_cost desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_pivots: {}
    row: 0
    col: 4
    width: 20
    height: 8
  - title: CUD Spend by Month
    name: CUD Spend by Month
    model: focus
    explore: focus
    type: looker_column
    fields: [focus.commitment_discount_id, focus.total_list_cost, focus.charge_period_start_month]
    pivots: [focus.commitment_discount_id]
    fill_fields: [focus.charge_period_start_month]
    filters:
      focus.commitment_discount_id: "-NULL"
      focus.commitment_discount_category: Usage
      focus.charge_period_start_month: 6 months
    sorts: [focus.commitment_discount_id, focus.total_list_cost desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      focus.total_list_cost:
        is_active: true
    series_value_format:
      focus.total_list_cost: '[>=1000000]$0.00,,"M";$0.00,"K"'
    hidden_pivots: {}
    truncate_column_names: false
    defaults_version: 1
    series_column_widths:
      focus.charge_period_start_month: 189.91000000000008
    listen: {}
    row: 8
    col: 12
    width: 12
    height: 8
  - title: Top Billed Services
    name: Top Billed Services
    model: focus
    explore: focus
    type: looker_waterfall
    fields: [focus.service_name, focus.total_list_cost]
    sorts: [focus.total_list_cost desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${focus.total_list_cost}+0"
      label: Total Cost
      value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: total_cost
      _type_hint: number
    up_color: "#34A853"
    down_color: false
    total_color: "#9AA0A6"
    show_value_labels: true
    show_x_axis_ticks: true
    show_x_axis_label: false
    x_axis_scale: auto
    show_y_axis_labels: false
    show_y_axis_ticks: false
    y_axis_gridlines: false
    label_color: ["#FFF"]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields: [focus.total_list_cost]
    listen: {}
    row: 8
    col: 0
    width: 12
    height: 8
