view: tags {
  sql_table_name: `postgres_rds_public.tags` ;;
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
  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
  }
  dimension: companyid {
    type: string
    sql: ${TABLE}.companyid ;;
  }
  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	bundletags.count,
	clienttags.count,
	coursegrouptags.count,
	discountgrouptags.count,
	learningpathtags.count,
	pickablegrouptags.count,
	producttags.count
	]
  }

}
