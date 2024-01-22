view: companies {
  sql_table_name: `postgres_rds_public.companies` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: customhost {
    type: string
    sql: ${TABLE}.customhost ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: subdomain {
    type: string
    sql: ${TABLE}.subdomain ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
