view: topics {
  sql_table_name: `postgres_rds_public.topics` ;;
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
  dimension: completiontimeseconds {
    type: number
    sql: ${TABLE}.completiontimeseconds ;;
  }
  dimension: continueaftertimerexpires {
    type: yesno
    sql: ${TABLE}.continueaftertimerexpires ;;
  }
  dimension: courseid {
    type: string
    # hidden: yes
    sql: ${TABLE}.courseid ;;
  }
  dimension: displayallhints {
    type: yesno
    sql: ${TABLE}.displayallhints ;;
  }
  dimension: hidequestionresults {
    type: yesno
    sql: ${TABLE}.hidequestionresults ;;
  }
  dimension: hintcontrolenabled {
    type: yesno
    sql: ${TABLE}.hintcontrolenabled ;;
  }
  dimension: isgraded {
    type: yesno
    sql: ${TABLE}.isgraded ;;
  }
  dimension: lessonid {
    type: string
    # hidden: yes
    sql: ${TABLE}.lessonid ;;
  }
  dimension: maxattempts {
    type: number
    sql: ${TABLE}.maxattempts ;;
  }
  dimension: minpassingpercent {
    type: number
    sql: ${TABLE}.minpassingpercent ;;
  }
  dimension: navigationdisabled {
    type: yesno
    sql: ${TABLE}.navigationdisabled ;;
  }
  dimension: preventprogression {
    type: yesno
    sql: ${TABLE}.preventprogression ;;
  }
  dimension: questionskipenabled {
    type: yesno
    sql: ${TABLE}.questionskipenabled ;;
  }
  dimension: randomizechoices {
    type: yesno
    sql: ${TABLE}.randomizechoices ;;
  }
  dimension: sectionid {
    type: string
    # hidden: yes
    sql: ${TABLE}.sectionid ;;
  }
  dimension: sidebarishidden {
    type: yesno
    sql: ${TABLE}.sidebarishidden ;;
  }
  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }
  dimension: timelimitinseconds {
    type: number
    sql: ${TABLE}.timelimitinseconds ;;
  }
  dimension: timeperquestioninseconds {
    type: number
    sql: ${TABLE}.timeperquestioninseconds ;;
  }
  dimension: timerenabled {
    type: yesno
    sql: ${TABLE}.timerenabled ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	lessons.id,
	sections.id,
	courses.id,
	ltiattempts.count,
	quizattempts.count,
	quizattemptresponses.count,
	scormattempts.count,
	scormattemptresponses.count
	]
  }

}
