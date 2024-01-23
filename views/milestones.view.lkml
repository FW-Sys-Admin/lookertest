view: milestones {
  sql_table_name: `postgres_rds_public.milestones` ;;
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
  dimension: completioncriteriadescription {
    type: string
    sql: ${TABLE}.completioncriteriadescription ;;
  }
  dimension: learningpathid {
    type: string
    # hidden: yes
    sql: ${TABLE}.learningpathid ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	learningpaths.id,
	learningpaths.name,
	learningpathactions.count,
	milestonecourses.count
	]
  }

}
