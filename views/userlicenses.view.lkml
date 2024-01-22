view: userlicenses {
  sql_table_name: `postgres_rds_public.userlicenses` ;;
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
  dimension: licenseid {
    type: string
    # hidden: yes
    sql: ${TABLE}.licenseid ;;
  }
  dimension: licenserole {
    type: string
    sql: ${TABLE}.licenserole ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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
	licenses.name,
	licenses.id,
	users.firstname,
	users.id,
	users.lastname,
	users.shippingname
	]
  }

}
