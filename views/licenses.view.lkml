view: licenses {
  sql_table_name: `postgres_rds_public.licenses` ;;
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
  dimension: clientid {
    type: string
    # hidden: yes
    sql: ${TABLE}.clientid ;;
  }
  dimension: companyid {
    type: string
    sql: ${TABLE}.companyid ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: parentlicense {
    type: string
    sql: ${TABLE}.parentlicense ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, clients.name, clients.id, userlicenses.count]
  }
}
