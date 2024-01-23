view: awards {
  sql_table_name: `postgres_rds_public.awards` ;;
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
  dimension: awardamount {
    type: number
    sql: ${TABLE}.awardamount ;;
  }
  dimension: awardtypeid {
    type: string
    # hidden: yes
    sql: ${TABLE}.awardtypeid ;;
  }
  dimension: awardwhen {
    type: string
    sql: ${TABLE}.awardwhen ;;
  }
  dimension: clientid {
    type: string
    # hidden: yes
    sql: ${TABLE}.clientid ;;
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
  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }
  dimension: resourceid {
    type: string
    sql: ${TABLE}.resourceid ;;
  }
  dimension: resourcetype {
    type: string
    sql: ${TABLE}.resourcetype ;;
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
	clients.name,
	clients.id,
	awardtypes.id,
	users.firstname,
	users.id,
	users.lastname,
	users.shippingname
	]
  }

}
