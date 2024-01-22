view: courses {
  sql_table_name: `postgres_rds_public.courses` ;;
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
  dimension: coursegroupid {
    type: string
    # hidden: yes
    sql: ${TABLE}.coursegroupid ;;
  }
  dimension_group: createdat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createdat ;;
  }
  dimension_group: enddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.enddate ;;
  }
  dimension_group: enrollmentenddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.enrollmentenddate ;;
  }
  dimension_group: enrollmentstartdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.enrollmentstartdate ;;
  }
  dimension_group: graceperiodenddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.graceperiodenddate ;;
  }
  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
  }
  dimension: parentcourseid {
    type: string
    sql: ${TABLE}.parentcourseid ;;
  }
  dimension: priceincents {
    type: number
    sql: ${TABLE}.priceincents ;;
  }
  dimension: seatslimit {
    type: number
    sql: ${TABLE}.seatslimit ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }
  dimension_group: startdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.startdate ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  dimension: totaltime {
    type: number
    sql: ${TABLE}.totaltime ;;
  }
  dimension: totalviews {
    type: number
    sql: ${TABLE}.totalviews ;;
  }
  dimension_group: updatedat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updatedat ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	coursegroups.id,
	assignmentsubmissions.count,
	courseactions.count,
	lessons.count,
	ltiattempts.count,
	milestonecourses.count,
	meetings.count,
	quizattempts.count,
	quizattemptresponses.count,
	scormattempts.count,
	scormattemptresponses.count,
	sections.count,
	topics.count,
	usercourseprogresses.count,
	usercourses.count,
	waitlists.count
	]
  }

}
