view: redemptioncodes {
  sql_table_name: `postgres_rds_public.redemptioncodes` ;;
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
  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }
  dimension: companyid {
    type: string
    sql: ${TABLE}.companyid ;;
  }
  dimension_group: createdat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createdat ;;
  }
  dimension: redeemed {
    type: yesno
    sql: ${TABLE}.redeemed ;;
  }
  dimension_group: redeemedat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.redeemedat ;;
  }
  dimension: redeemedbyuserid {
    type: string
    sql: ${TABLE}.redeemedbyuserid ;;
  }
  dimension: redemptioncodegroupid {
    type: string
    # hidden: yes
    sql: ${TABLE}.redemptioncodegroupid ;;
  }
  measure: count {
    type: count
    drill_fields: [id, redemptioncodegroups.id]
  }
}
