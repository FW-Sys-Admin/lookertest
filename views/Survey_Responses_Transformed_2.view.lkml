view: Survey_Responses_With_Userid {
  derived_table: {
    # Specify the SQL query to transform rows into columns
    sql:
    SELECT
    userid, createdat,
    MAX(CASE WHEN Question = 'Current address' THEN Answer END) AS `Current_Address`,
    MAX(CASE WHEN Question = 'Current city' THEN Answer END) AS `Current_city`,
    MAX(CASE WHEN Question = 'State' THEN Answer END) AS State,
    MAX(CASE WHEN Question = 'Zip Code' THEN Answer END) AS Zip_code,
    MAX(CASE WHEN Question = 'Phone' THEN Answer END) AS Phone,
    MAX(CASE WHEN Question = 'Date of birth' THEN Answer END) AS `Date_of_birth`,
    MAX(CASE WHEN Question = 'Are you disabled?' THEN Answer END) AS `Are_you_disabled`,
    MAX(CASE WHEN Question = 'Marital status' THEN Answer END) AS `Marital_status`,
    MAX(CASE WHEN Question = 'Are you required to take homebuyer education?' THEN Answer END) AS `Are_you_required_to_take_homebuyer_education`,
    MAX(CASE WHEN Question = 'Education' THEN Answer END) AS Education,
    MAX(CASE WHEN Question = 'Gender' THEN Answer END) AS Gender,
    MAX(CASE WHEN Question = 'Ethnicity' THEN Answer END) AS Ethnicity,
    MAX(CASE WHEN Question = 'Race' THEN Answer END) AS Race,
    MAX(CASE WHEN Question = 'Household type' THEN Answer END) AS `Household_type`,
    MAX(CASE WHEN Question = 'Number in household' THEN Answer END) AS `Number_in_household`,
    MAX(CASE WHEN Question = 'Number of dependents' THEN Answer END) AS `Number_of_dependents`,
    MAX(CASE WHEN Question = 'Total annual family income' THEN Answer END) AS `Total_annual_family_income`,
    MAX(CASE WHEN Question = 'Current housing situation' THEN Answer END) AS `Current_housing_situation`,
    MAX(CASE WHEN Question = 'Are you a veteran?' THEN Answer END) AS `Are_you_a_veteran`,
    MAX(CASE WHEN Question = 'Where are you at in the home buying process?' THEN Answer END) AS `Where_are_you_at_in_the_homebuying_process`,
    MAX(CASE WHEN Question LIKE 'If you are in the market to buy%' THEN Answer END) AS `If_you_are_in_the_market_to_buy_how_soon_do_you_plan_to_purchase`,
    MAX(CASE WHEN Question = 'First time home buyer (haven\'t owned in the past 3 years)' THEN Answer END) AS `first_time_home_buyer_havent_owned_in_the_past_3_years`,
    MAX(CASE WHEN Question = 'First generation home buyer (your parents did not own a home)' THEN Answer END) AS `first_generation_home_buyer__your_parents_did_not_own_a_home_`,
    MAX(CASE WHEN Question = 'How did you hear about Framework®?' THEN Answer END) AS `How_did_you_hear_about_Framework`,
    MAX(CASE WHEN Question = 'Which lender (mortgage company, bank, or credit union) are you working with?' THEN Answer END) AS `which_lender_mortgage_company_or_bank_or_credit_union_are_you_working_with`,
    MAX(CASE WHEN Question = 'Are you working with a real estate agent/broker?' THEN Answer END) AS `are_you_working_with_a_real_estate_agent_or_broker`,
    MAX(CASE WHEN Question = 'Which real estate agent/broker are you working with?' THEN Answer END) AS `which_real_estate_agent_or_broker_are_you_working_with`,
  FROM thought-industries-data.postgres_rds_public.onboardingsurveyresponses
  Group BY Userid, createdat
  ;;
  }

  dimension: Userid {
    type: string
    primary_key: yes
    sql: ${TABLE}.userid ;;
  }

  dimension: current_city {
    type: string
    sql: ${TABLE}.current_city ;;
  }
  dimension: current_address {
    type: string
    sql: ${TABLE}.current_address;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state;;
  }

  dimension: zip_code {
    type: string
    sql: ${TABLE}.zip_code;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone;;
  }

 dimension: date_of_birth {
  type: string
  sql: ${TABLE}.date_of_birth;;
}

  dimension: disabled {
    type: string
    sql: ${TABLE}.Are_you_disabled;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.marital_status;;
  }

  dimension: homebuyer_education_required {
    type: string
    sql: ${TABLE}.are_you_required_to_take_homebuyer_education;;
  }

  dimension: education {
    type: string
    sql: ${TABLE}.education;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.ethnicity;;
  }

  dimension: race {
    type: string
    sql: ${TABLE}.race;;
  }

  dimension: household_type {
    type: string
    sql: ${TABLE}.household_type;;
  }

  dimension: number_in_household {
    type: string
    sql: ${TABLE}.number_in_household;;
  }

  dimension: number_of_dependents {
    type: string
    sql: ${TABLE}.number_of_dependents;;
  }

  dimension: total_annual_family_income {
    type: string
    sql: ${TABLE}.total_annual_family_income;;
  }

  dimension: current_housing_situation {
    type: string
    sql: ${TABLE}.current_housing_situation;;
  }

  dimension: veteran_status {
    type: string
    sql: ${TABLE}.are_you_a_veteran;;
  }

  dimension: homebuying_process_stage {
    type: string
    sql: ${TABLE}.where_are_you_at_in_the_homebuying_process;;
  }

  dimension: time_to_purchase {
    type: string
    sql: ${TABLE}.If_you_are_in_the_market_to_buy_how_soon_do_you_plan_to_purchase;;
  }

  dimension: first_time_home_buyer {
    type: string
    sql: ${TABLE}.first_time_home_buyer_havent_owned_in_the_past_3_years;;
  }

  dimension: first_generation_home_buyer {
    type: string
    sql: ${TABLE}.first_generation_home_buyer__your_parents_did_not_own_a_home_;;
  }

  dimension: how_did_you_hear_about_framework {
    type: string
    sql: ${TABLE}.how_did_you_hear_about_framework;;
  }

  dimension: lender {
    type: string
    sql: ${TABLE}.which_lender_mortgage_company_or_bank_or_credit_union_are_you_working_with;;
  }

  dimension: working_with_real_estate_agent {
    type: string
    sql: ${TABLE}.are_you_working_with_a_real_estate_agent_or_broker;;
  }

  dimension: real_estate_agent_or_broker {
    type: string
    sql: ${TABLE}.which_real_estate_agent_or_broker_are_you_working_with;;
  }
  dimension_group: Submission {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createdat ;;
  }
}
