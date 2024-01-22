view: scormattemptresponses {
  sql_table_name: `postgres_rds_public.scormattemptresponses` ;;
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
  dimension: questiondescription {
    type: string
    sql: ${TABLE}.questiondescription ;;
  }
  dimension: questionid {
    type: string
    # hidden: yes
    sql: ${TABLE}.questionid ;;
  }
  dimension: result {
    type: string
    sql: ${TABLE}.result ;;
  }
  dimension: scormattemptid {
    type: string
    # hidden: yes
    sql: ${TABLE}.scormattemptid ;;
  }
  dimension: studentresponse {
    type: string
    sql: ${TABLE}.studentresponse ;;
  }
  dimension: topicid {
    type: string
    # hidden: yes
    sql: ${TABLE}.topicid ;;
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
	questions.id,
	scormattempts.id,
	users.firstname,
	users.id,
	users.lastname,
	users.shippingname,
	topics.id,
	courses.id
	]
  }

}
