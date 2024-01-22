view: learningpaths {
  sql_table_name: `postgres_rds_public.learningpaths` ;;
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
  dimension: accessdays {
    type: number
    sql: ${TABLE}.accessdays ;;
  }
  dimension: asset {
    type: string
    sql: ${TABLE}.asset ;;
  }
  dimension: certificatetemplateblockid {
    type: string
    sql: ${TABLE}.certificatetemplateblockid ;;
  }
  dimension: companyid {
    type: string
    sql: ${TABLE}.companyid ;;
  }
  dimension: contenttype {
    type: string
    sql: ${TABLE}.contenttype ;;
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
  dimension: detailasset {
    type: string
    sql: ${TABLE}.detailasset ;;
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
  dimension: freewithregistration {
    type: yesno
    sql: ${TABLE}.freewithregistration ;;
  }
  dimension: heroasset {
    type: string
    sql: ${TABLE}.heroasset ;;
  }
  dimension: longdescription {
    type: string
    sql: ${TABLE}.longdescription ;;
  }
  dimension: metadescription {
    type: string
    sql: ${TABLE}.metadescription ;;
  }
  dimension: metatitle {
    type: string
    sql: ${TABLE}.metatitle ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: priceincents {
    type: number
    sql: ${TABLE}.priceincents ;;
  }
  dimension: ribbon {
    type: string
    sql: ${TABLE}.ribbon ;;
  }
  dimension: shortdescription {
    type: string
    sql: ${TABLE}.shortdescription ;;
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
  dimension: suggestedretailpriceincents {
    type: number
    sql: ${TABLE}.suggestedretailpriceincents ;;
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
	name,
	learningpathtags.count,
	learningpathactions.count,
	milestones.count,
	userlearningpaths.count
	]
  }

}
