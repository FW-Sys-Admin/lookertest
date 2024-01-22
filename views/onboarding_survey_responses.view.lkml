view: onboarding_survey_responses {
  sql_table_name: `postgres_rds_public.OnboardingSurveyResponses` ;;

  dimension: are_you_a_veteran {
    type: string
    sql: ${TABLE}.`Are you a veteran` ;;
  }
  dimension: are_you_disabled {
    type: string
    sql: ${TABLE}.`Are you disabled` ;;
  }
  dimension: are_you_required_to_take_homebuyer_education {
    type: string
    sql: ${TABLE}.`Are you required to take homebuyer education` ;;
  }
  dimension: are_you_working_with_a_real_estate_agent_or_broker {
    type: string
    sql: ${TABLE}.`Are you working with a real estate agent or broker` ;;
  }
  dimension: current_address {
    type: string
    sql: ${TABLE}.`Current Address` ;;
  }
  dimension: current_city {
    type: string
    sql: ${TABLE}.`Current city` ;;
  }
  dimension: current_housing_situation {
    type: string
    sql: ${TABLE}.`Current housing situation` ;;
  }
  dimension: date_of_birth {
    type: string
    sql: ${TABLE}.`Date of birth` ;;
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
    sql: ${TABLE}.`First generation home buyer _your parents did not own a home_` ;;
  }
  dimension: first_time_home_buyer__havent_owned_in_the_past_3_years_ {
    type: string
    sql: ${TABLE}.`First time home buyer _havent owned in the past 3 years_` ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }
  dimension: household_type {
    type: string
    sql: ${TABLE}.`Household type` ;;
  }
  dimension: how_did_you_hear_about_framework {
    type: string
    sql: ${TABLE}.`How did you hear about Framework` ;;
  }
  dimension: if_you_are_in_the_market_to_buy_how_soon_do_you_plan_to_purchase {
    type: string
    sql: ${TABLE}.`If you are in the market to buy how soon do you plan to purchase` ;;
  }
  dimension: marital_status {
    type: string
    sql: ${TABLE}.`Marital status` ;;
  }
  dimension: number_in_household {
    type: string
    sql: ${TABLE}.`Number in household` ;;
  }
  dimension: number_of_dependents {
    type: string
    sql: ${TABLE}.`Number of dependents` ;;
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
    sql: ${TABLE}.`Total annual family income` ;;
  }
  dimension: userid {
    type: string
    # hidden: yes
    sql: ${TABLE}.Userid ;;
  }
  dimension: where_are_you_at_in_the_homebuying_process {
    type: string
    sql: ${TABLE}.`Where are you at in the homebuying process` ;;
  }
  dimension: which_lender__mortgage_company_or_bank_or_credit_union__are_you_working_with {
    type: string
    sql: ${TABLE}.`Which lender _mortgage company or bank or credit union_ are you working with` ;;
  }
  dimension: which_real_estate_agent_or_broker_are_you_working_with {
    type: string
    sql: ${TABLE}.`Which real estate agent or broker are you working with` ;;
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
