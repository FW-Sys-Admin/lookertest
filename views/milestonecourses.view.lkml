view: milestonecourses {
  sql_table_name: `postgres_rds_public.milestonecourses` ;;
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
  dimension: contentgrouping {
    type: string
    sql: ${TABLE}.contentgrouping ;;
  }
  dimension: coursegroupid {
    type: string
    # hidden: yes
    sql: ${TABLE}.coursegroupid ;;
  }
  dimension: courseid {
    type: string
    # hidden: yes
    sql: ${TABLE}.courseid ;;
  }
  dimension: milestoneid {
    type: string
    # hidden: yes
    sql: ${TABLE}.milestoneid ;;
  }
  dimension: requirement {
    type: string
    sql: ${TABLE}.requirement ;;
  }
  dimension_group: updatedat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updatedat ;;
  }
  measure: count {
    type: count
    drill_fields: [id, coursegroups.id, milestones.name, milestones.id, courses.id]
  }
}
