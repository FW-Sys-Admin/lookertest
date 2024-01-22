view: coursegroups {
  sql_table_name: `postgres_rds_public.coursegroups` ;;
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
  dimension: authors {
    type: string
    sql: ${TABLE}.authors ;;
  }
  dimension: companyid {
    type: string
    sql: ${TABLE}.companyid ;;
  }
  dimension: contenttype {
    type: string
    sql: ${TABLE}.contenttype ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: isbn {
    type: string
    sql: ${TABLE}.isbn ;;
  }
  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
  }
  dimension: metadescription {
    type: string
    sql: ${TABLE}.metadescription ;;
  }
  dimension: metatitle {
    type: string
    sql: ${TABLE}.metatitle ;;
  }
  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }
  dimension: ribbon {
    type: string
    sql: ${TABLE}.ribbon ;;
  }
  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	coursegroupcustomfields.count,
	courses.count,
	coursegrouptags.count,
	milestonecourses.count,
	testimonials.count
	]
  }

}
