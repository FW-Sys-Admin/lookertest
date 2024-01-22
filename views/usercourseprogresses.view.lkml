view: usercourseprogresses {
  sql_table_name: `postgres_rds_public.usercourseprogresses` ;;
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
  dimension: percentcomplete {
    type: number
    sql: ${TABLE}.percentcomplete ;;
  }
  dimension: percentpagesviewed {
    type: number
    sql: ${TABLE}.percentpagesviewed ;;
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
	courses.id,
	users.firstname,
	users.id,
	users.lastname,
	users.shippingname
	]
  }

}
