view: onboarding_survey_responses2 {
  sql_table_name: `postgres_rds_public.OnboardingSurveyResponses2` ;;

  dimension: are_you_a_veteran {
    type: string
    sql: ${TABLE}.Are_you_a_veteran ;;
  }
  dimension: are_you_disabled {
    type: string
    sql: ${TABLE}.Are_you_disabled ;;
  }
  dimension: are_you_required_to_take_homebuyer_education {
    type: string
    sql: ${TABLE}.Are_you_required_to_take_homebuyer_education ;;
  }
  dimension: are_you_working_with_a_real_estate_agent_or_broker {
    type: string
    sql: ${TABLE}.are_you_working_with_a_real_estate_agent_or_broker ;;
  }
  dimension: current_address {
    type: string
    sql: ${TABLE}.Current_Address ;;
  }
  dimension: current_city {
    type: string
    sql: ${TABLE}.Current_city ;;
  }
  dimension: current_housing_situation {
    type: string
    sql: ${TABLE}.Current_housing_situation ;;
  }
  dimension: date_of_birth {
    type: string
    sql: ${TABLE}.Date_of_birth ;;
  }
  dimension: education {
    type: string
    sql: ${TABLE}.Education ;;
  }
  dimension: ethnicity {
    type: string
    sql: ${TABLE}.Ethnicity ;;
  }
  dimension: first_generation_home_buyer__your_parents_did_not_own_a_home_ {
    type: string
    sql: ${TABLE}.first_generation_home_buyer__your_parents_did_not_own_a_home_ ;;
  }
  dimension: first_time_home_buyer_havent_owned_in_the_past_3_years {
    type: string
    sql: ${TABLE}.first_time_home_buyer_havent_owned_in_the_past_3_years ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }
  dimension: household_type {
    type: string
    sql: ${TABLE}.Household_type ;;
  }
  dimension: how_did_you_hear_about_framework {
    type: string
    sql: ${TABLE}.How_did_you_hear_about_Framework ;;
  }
  dimension: if_you_are_in_the_market_to_buy_how_soon_do_you_plan_to_purchase {
    type: string
    sql: ${TABLE}.If_you_are_in_the_market_to_buy_how_soon_do_you_plan_to_purchase ;;
  }
  dimension: marital_status {
    type: string
    sql: ${TABLE}.Marital_status ;;
  }
  dimension: number_in_household {
    type: string
    sql: ${TABLE}.Number_in_household ;;
  }
  dimension: number_of_dependents {
    type: string
    sql: ${TABLE}.Number_of_dependents ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }
  dimension: race {
    type: string
    sql: ${TABLE}.Race ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: total_annual_family_income {
    type: string
    sql: ${TABLE}.Total_annual_family_income ;;
  }
  dimension: userid {
    type: string
    # hidden: yes
    sql: ${TABLE}.Userid ;;
  }
  dimension: where_are_you_at_in_the_homebuying_process {
    type: string
    sql: ${TABLE}.Where_are_you_at_in_the_homebuying_process ;;
  }
  dimension: which_lender_mortgage_company_or_bank_or_credit_union_are_you_working_with {
    type: string
    sql: ${TABLE}.which_lender_mortgage_company_or_bank_or_credit_union_are_you_working_with ;;
  }
  dimension: which_real_estate_agent_or_broker_are_you_working_with {
    type: string
    sql: ${TABLE}.which_real_estate_agent_or_broker_are_you_working_with ;;
  }
  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.Zip_code ;;
  }
  measure: count {
    type: count
    drill_fields: [users.firstname, users.id, users.lastname, users.shippingname]
  }
}
