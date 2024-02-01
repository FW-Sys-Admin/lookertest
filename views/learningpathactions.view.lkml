view: learningpathactions {
  sql_table_name: `postgres_rds_public.learningpathactions` ;;
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
  dimension_group: Action_Timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createdat ;;
  }
  dimension: learningpathid {
    type: string
    # hidden: yes
    sql: ${TABLE}.learningpathid ;;
  }
  dimension: milestoneid {
    type: string
    # hidden: yes
    sql: ${TABLE}.milestoneid ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension: userid {
    type: string
    # hidden: yes
    sql: ${TABLE}.userid ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  learningpaths.id,
  learningpaths.name,
  milestones.name,
  milestones.id,
  users.firstname,
  users.id,
  users.lastname,
  users.shippingname
  ]
  }

}
