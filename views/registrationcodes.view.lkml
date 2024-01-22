view: registrationcodes {
  sql_table_name: `postgres_rds_public.registrationcodes` ;;
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
  dimension: accessdays {
    type: number
    sql: ${TABLE}.accessdays ;;
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
  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }
  dimension: maxredemptions {
    type: number
    sql: ${TABLE}.maxredemptions ;;
  }
  dimension: timesredeemed {
    type: number
    sql: ${TABLE}.timesredeemed ;;
  }
  dimension_group: updatedat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updatedat ;;
  }
  measure: count {
    type: count
    drill_fields: [id, registrationcoderedemptions.count]
  }
}
