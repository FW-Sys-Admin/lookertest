view: users {
  sql_table_name: `postgres_rds_public.users` ;;
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
  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }
  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
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
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: createdat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createdat ;;
  }
  dimension: disabled {
    type: yesno
    sql: ${TABLE}.disabled ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: externalcustomerid {
    type: string
    sql: ${TABLE}.externalcustomerid ;;
  }
  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }
  dimension_group: lastactiveat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.lastactiveat ;;
  }
  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }
  dimension: ref1 {
    type: string
    sql: ${TABLE}.ref1 ;;
  }
  dimension: ref10 {
    type: string
    sql: ${TABLE}.ref10 ;;
  }
  dimension: ref2 {
    type: string
    sql: ${TABLE}.ref2 ;;
  }
  dimension: ref3 {
    type: string
    sql: ${TABLE}.ref3 ;;
  }
  dimension: co_borrower_firstname {
    type: string
    sql: ${TABLE}.ref4 ;;
  }
  dimension: co_borrower_lastname {
    type: string
    sql: ${TABLE}.ref5 ;;
  }
  dimension: ref6 {
    type: string
    sql: ${TABLE}.ref6 ;;
  }
  dimension: ref7 {
    type: string
    sql: ${TABLE}.ref7 ;;
  }
  dimension: ref8 {
    type: string
    sql: ${TABLE}.ref8 ;;
  }
  dimension: ref9 {
    type: string
    sql: ${TABLE}.ref9 ;;
  }
  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }
  dimension: sfaccountid {
    type: string
    sql: ${TABLE}.sfaccountid ;;
  }
  dimension: sfcontactid {
    type: string
    sql: ${TABLE}.sfcontactid ;;
  }
  dimension: shippingname {
    type: string
    sql: ${TABLE}.shippingname ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: stripecustomerid {
    type: string
    sql: ${TABLE}.stripecustomerid ;;
  }
  dimension: telephone {
    type: string
    sql: ${TABLE}.telephone ;;
  }
  dimension_group: updatedat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updatedat ;;
  }
  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  firstname,
  lastname,
  shippingname,
  clients.name,
  clients.id,
  assignmentsubmissions.count,
  onboarding_survey_responses2.count,
  onboarding_survey_responses.count,
  awards.count,
  certificates.count,
  courseactions.count,
  learningpathactions.count,
  ltiattempts.count,
  onboardingsurveyresponses.count,
  quizattempts.count,
  quizattemptresponses.count,
  scormattempts.count,
  scormattemptresponses.count,
  testimonials.count,
  usercourseprogresses.count,
  userlearningpaths.count,
  userbundles.count,
  usercourses.count,
  userlicenses.count,
  waitlists.count
  ]
  }

}
