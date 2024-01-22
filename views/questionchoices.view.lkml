view: questionchoices {
  sql_table_name: `postgres_rds_public.questionchoices` ;;
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
  dimension: correct {
    type: yesno
    sql: ${TABLE}.correct ;;
  }
  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }
  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }
  dimension: points {
    type: number
    sql: ${TABLE}.points ;;
  }
  dimension: questionid {
    type: string
    # hidden: yes
    sql: ${TABLE}.questionid ;;
  }
  dimension: response {
    type: string
    sql: ${TABLE}.response ;;
  }
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
  measure: count {
    type: count
    drill_fields: [id, questions.id]
  }
}
