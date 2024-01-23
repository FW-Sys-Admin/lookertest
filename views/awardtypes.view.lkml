view: awardtypes {
  sql_table_name: `postgres_rds_public.awardtypes` ;;
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
  dimension: companyid {
    type: string
    sql: ${TABLE}.companyid ;;
  }
  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }
  dimension: icon {
    type: string
    sql: ${TABLE}.icon ;;
  }
  dimension: includeondashboard {
    type: yesno
    sql: ${TABLE}.includeondashboard ;;
  }
  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }
  dimension: plurallabel {
    type: string
    sql: ${TABLE}.plurallabel ;;
  }
  measure: count {
    type: count
    drill_fields: [id, awards.count]
  }
}
