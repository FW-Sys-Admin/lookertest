view: learningpathtags {
  sql_table_name: `postgres_rds_public.learningpathtags` ;;
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
  dimension: learningpathid {
    type: string
    # hidden: yes
    sql: ${TABLE}.learningpathid ;;
  }
  dimension: tagid {
    type: string
    # hidden: yes
    sql: ${TABLE}.tagid ;;
  }
  measure: count {
    type: count
    drill_fields: [id, tags.id, learningpaths.id, learningpaths.name]
  }
}
