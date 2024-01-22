view: quizattempts {
  sql_table_name: `postgres_rds_public.quizattempts` ;;
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
  dimension: courseid {
    type: string
    # hidden: yes
    sql: ${TABLE}.courseid ;;
  }
  dimension_group: createdat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createdat ;;
  }
  dimension: forgiven {
    type: yesno
    sql: ${TABLE}.forgiven ;;
  }
  dimension: grade {
    type: number
    sql: ${TABLE}.grade ;;
  }
  dimension: passed {
    type: yesno
    sql: ${TABLE}.passed ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: timeelapsed {
    type: number
    sql: ${TABLE}.timeelapsed ;;
  }
  dimension: topicid {
    type: string
    # hidden: yes
    sql: ${TABLE}.topicid ;;
  }
  dimension: topictype {
    type: string
    sql: ${TABLE}.topictype ;;
  }
  dimension_group: updatedat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updatedat ;;
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
	users.firstname,
	users.id,
	users.lastname,
	users.shippingname,
	topics.id,
	courses.id,
	quizattemptresponses.count
	]
  }

}
