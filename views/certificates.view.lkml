view: certificates {
  sql_table_name: `postgres_rds_public.certificates` ;;
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
  dimension_group: expirationdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.expirationdate ;;
  }
  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }
  dimension_group: issuedat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.issuedat ;;
  }
  dimension: progresswasreset {
    type: yesno
    sql: ${TABLE}.progresswasreset ;;
  }
  dimension: resourceid {
    type: string
    sql: ${TABLE}.resourceid ;;
  }
  dimension: resourcetype {
    type: string
    sql: ${TABLE}.resourcetype ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  dimension_group: updatedat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updatedat ;;
  }
  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }
  dimension: userid {
    type: string
    # hidden: yes
    sql: ${TABLE}.userid ;;
  }
  measure: count {
    type: count
    drill_fields: [id, users.firstname, users.id, users.lastname, users.shippingname]
  }
}
