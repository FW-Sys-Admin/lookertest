view: onboardingsurveyresponses {
  sql_table_name: `postgres_rds_public.onboardingsurveyresponses` ;;
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
  dimension: answer {
    type: string
    sql: ${TABLE}.answer ;;
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
  dimension: onboardingsurveyid {
    type: string
    # hidden: yes
    sql: ${TABLE}.onboardingsurveyid ;;
  }
  dimension: question {
    type: string
    sql: ${TABLE}.question ;;
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
	onboardingsurveys.id,
	users.firstname,
	users.id,
	users.lastname,
	users.shippingname
	]
  }

}
