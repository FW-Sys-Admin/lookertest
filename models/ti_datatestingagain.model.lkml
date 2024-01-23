connection: "ti_data"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: ti_datatestingagain_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ti_datatestingagain_default_datagroup

explore: assignmentsubmissions {
  join: courses {
    type: left_outer
    sql_on: ${assignmentsubmissions.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${assignmentsubmissions.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: bundletags {
  join: tags {
    type: left_outer
    sql_on: ${bundletags.tagid} = ${tags.id} ;;
    relationship: many_to_one
  }

  join: bundles {
    type: left_outer
    sql_on: ${bundletags.bundleid} = ${bundles.id} ;;
    relationship: many_to_one
  }
}

explore: awardtypes {}

explore: onboarding_survey_responses2 {
  join: users {
    type: left_outer
    sql_on: ${onboarding_survey_responses2.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: bundles {}

explore: onboarding_survey_responses {
  join: users {
    type: left_outer
    sql_on: ${onboarding_survey_responses.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: awards {
  join: clients {
    type: left_outer
    sql_on: ${awards.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }

  join: awardtypes {
    type: left_outer
    sql_on: ${awards.awardtypeid} = ${awardtypes.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${awards.userid} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: certificates {
  join: users {
    type: left_outer
    sql_on: ${certificates.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: clients {}

explore: coursegroupcustomfields {
  join: coursegroups {
    type: left_outer
    sql_on: ${coursegroupcustomfields.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: companies {}

explore: courseactions {
  join: courses {
    type: left_outer
    sql_on: ${courseactions.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${courseactions.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: clienttags {
  join: clients {
    type: left_outer
    sql_on: ${clienttags.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }

  join: tags {
    type: left_outer
    sql_on: ${clienttags.tagid} = ${tags.id} ;;
    relationship: many_to_one
  }
}

explore: coursegroups {}

explore: courses {
  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: coursegrouptags {
  join: coursegroups {
    type: left_outer
    sql_on: ${coursegrouptags.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }

  join: tags {
    type: left_outer
    sql_on: ${coursegrouptags.tagid} = ${tags.id} ;;
    relationship: many_to_one
  }
}

explore: discountgrouptags {
  join: tags {
    type: left_outer
    sql_on: ${discountgrouptags.tagid} = ${tags.id} ;;
    relationship: many_to_one
  }

  join: discountgroups {
    type: left_outer
    sql_on: ${discountgrouptags.discountgroupid} = ${discountgroups.id} ;;
    relationship: many_to_one
  }
}

explore: discountgroups {}

explore: fivetran_audit {}

explore: lessons {
  join: sections {
    type: left_outer
    sql_on: ${lessons.sectionid} = ${sections.id} ;;
    relationship: many_to_one
  }

  join: courses {
    type: left_outer
    sql_on: ${lessons.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: learningpathtags {
  join: tags {
    type: left_outer
    sql_on: ${learningpathtags.tagid} = ${tags.id} ;;
    relationship: many_to_one
  }

  join: learningpaths {
    type: left_outer
    sql_on: ${learningpathtags.learningpathid} = ${learningpaths.id} ;;
    relationship: many_to_one
  }
}

explore: learningpaths {}

explore: licenses {
  join: clients {
    type: left_outer
    sql_on: ${licenses.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: learningpathactions {
  join: learningpaths {
    type: left_outer
    sql_on: ${learningpathactions.learningpathid} = ${learningpaths.id} ;;
    relationship: many_to_one
  }

  join: milestones {
    type: left_outer
    sql_on: ${learningpathactions.milestoneid} = ${milestones.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${learningpathactions.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: ltiattempts {
  join: topics {
    type: left_outer
    sql_on: ${ltiattempts.topicid} = ${topics.id} ;;
    relationship: many_to_one
  }

  join: courses {
    type: left_outer
    sql_on: ${ltiattempts.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${ltiattempts.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: lessons {
    type: left_outer
    sql_on: ${topics.lessonid} = ${lessons.id} ;;
    relationship: many_to_one
  }

  join: sections {
    type: left_outer
    sql_on: ${topics.sectionid} = ${sections.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: migrations {}

explore: milestonecourses {
  join: coursegroups {
    type: left_outer
    sql_on: ${milestonecourses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }

  join: milestones {
    type: left_outer
    sql_on: ${milestonecourses.milestoneid} = ${milestones.id} ;;
    relationship: many_to_one
  }

  join: courses {
    type: left_outer
    sql_on: ${milestonecourses.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: learningpaths {
    type: left_outer
    sql_on: ${milestones.learningpathid} = ${learningpaths.id} ;;
    relationship: many_to_one
  }
}

explore: milestones {
  join: learningpaths {
    type: left_outer
    sql_on: ${milestones.learningpathid} = ${learningpaths.id} ;;
    relationship: many_to_one
  }
}

explore: onboardingsurveyresponses {
  join: onboardingsurveys {
    type: left_outer
    sql_on: ${onboardingsurveyresponses.onboardingsurveyid} = ${onboardingsurveys.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${onboardingsurveyresponses.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${onboardingsurveys.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: onboardingsurveys {
  join: clients {
    type: left_outer
    sql_on: ${onboardingsurveys.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: meetings {
  join: courses {
    type: left_outer
    sql_on: ${meetings.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: pickablegroups {}

explore: pickablegrouptags {
  join: tags {
    type: left_outer
    sql_on: ${pickablegrouptags.tagid} = ${tags.id} ;;
    relationship: many_to_one
  }

  join: pickablegroups {
    type: left_outer
    sql_on: ${pickablegrouptags.pickablegroupid} = ${pickablegroups.id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: producttags {
  join: products {
    type: left_outer
    sql_on: ${producttags.productid} = ${products.id} ;;
    relationship: many_to_one
  }

  join: tags {
    type: left_outer
    sql_on: ${producttags.tagid} = ${tags.id} ;;
    relationship: many_to_one
  }
}

explore: questions {}

explore: questionchoices {
  join: questions {
    type: left_outer
    sql_on: ${questionchoices.questionid} = ${questions.id} ;;
    relationship: many_to_one
  }
}

explore: quizattempts {
  join: users {
    type: left_outer
    sql_on: ${quizattempts.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: topics {
    type: left_outer
    sql_on: ${quizattempts.topicid} = ${topics.id} ;;
    relationship: many_to_one
  }

  join: courses {
    type: left_outer
    sql_on: ${quizattempts.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }

  join: lessons {
    type: left_outer
    sql_on: ${topics.lessonid} = ${lessons.id} ;;
    relationship: many_to_one
  }

  join: sections {
    type: left_outer
    sql_on: ${topics.sectionid} = ${sections.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: quizattemptresponses {
  join: questions {
    type: left_outer
    sql_on: ${quizattemptresponses.questionid} = ${questions.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${quizattemptresponses.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: topics {
    type: left_outer
    sql_on: ${quizattemptresponses.topicid} = ${topics.id} ;;
    relationship: many_to_one
  }

  join: quizattempts {
    type: left_outer
    sql_on: ${quizattemptresponses.quizattemptid} = ${quizattempts.id} ;;
    relationship: many_to_one
  }

  join: courses {
    type: left_outer
    sql_on: ${quizattemptresponses.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }

  join: lessons {
    type: left_outer
    sql_on: ${topics.lessonid} = ${lessons.id} ;;
    relationship: many_to_one
  }

  join: sections {
    type: left_outer
    sql_on: ${topics.sectionid} = ${sections.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: redemptioncodegroups {}

explore: redemptioncodes {
  join: redemptioncodegroups {
    type: left_outer
    sql_on: ${redemptioncodes.redemptioncodegroupid} = ${redemptioncodegroups.id} ;;
    relationship: many_to_one
  }
}

explore: registrationcodes {}

explore: registrationcoderedemptions {
  join: registrationcodes {
    type: left_outer
    sql_on: ${registrationcoderedemptions.registrationcodeid} = ${registrationcodes.id} ;;
    relationship: many_to_one
  }
}

explore: scormattempts {
  join: users {
    type: left_outer
    sql_on: ${scormattempts.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: topics {
    type: left_outer
    sql_on: ${scormattempts.topicid} = ${topics.id} ;;
    relationship: many_to_one
  }

  join: courses {
    type: left_outer
    sql_on: ${scormattempts.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }

  join: lessons {
    type: left_outer
    sql_on: ${topics.lessonid} = ${lessons.id} ;;
    relationship: many_to_one
  }

  join: sections {
    type: left_outer
    sql_on: ${topics.sectionid} = ${sections.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: scormattemptresponses {
  join: questions {
    type: left_outer
    sql_on: ${scormattemptresponses.questionid} = ${questions.id} ;;
    relationship: many_to_one
  }

  join: scormattempts {
    type: left_outer
    sql_on: ${scormattemptresponses.scormattemptid} = ${scormattempts.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${scormattemptresponses.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: topics {
    type: left_outer
    sql_on: ${scormattemptresponses.topicid} = ${topics.id} ;;
    relationship: many_to_one
  }

  join: courses {
    type: left_outer
    sql_on: ${scormattemptresponses.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }

  join: lessons {
    type: left_outer
    sql_on: ${topics.lessonid} = ${lessons.id} ;;
    relationship: many_to_one
  }

  join: sections {
    type: left_outer
    sql_on: ${topics.sectionid} = ${sections.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: sections {
  join: courses {
    type: left_outer
    sql_on: ${sections.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: tags {}

explore: testimonials {
  join: coursegroups {
    type: left_outer
    sql_on: ${testimonials.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${testimonials.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: topics {
  join: lessons {
    type: left_outer
    sql_on: ${topics.lessonid} = ${lessons.id} ;;
    relationship: many_to_one
  }

  join: sections {
    type: left_outer
    sql_on: ${topics.sectionid} = ${sections.id} ;;
    relationship: many_to_one
  }

  join: courses {
    type: left_outer
    sql_on: ${topics.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }
}

explore: usercourseprogresses {
  join: courses {
    type: left_outer
    sql_on: ${usercourseprogresses.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${usercourseprogresses.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: userlearningpaths {
  join: learningpaths {
    type: left_outer
    sql_on: ${userlearningpaths.learningpathid} = ${learningpaths.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${userlearningpaths.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: userbundles {
  join: bundles {
    type: left_outer
    sql_on: ${userbundles.bundleid} = ${bundles.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${userbundles.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: usercourses {
  join: courses {
    type: left_outer
    sql_on: ${usercourses.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${usercourses.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: userlicenses {
  join: licenses {
    type: left_outer
    sql_on: ${userlicenses.licenseid} = ${licenses.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${userlicenses.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${licenses.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: users {
  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}

explore: waitlists {
  join: courses {
    type: left_outer
    sql_on: ${waitlists.courseid} = ${courses.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${waitlists.userid} = ${users.id} ;;
    relationship: many_to_one
  }

  join: coursegroups {
    type: left_outer
    sql_on: ${courses.coursegroupid} = ${coursegroups.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer
    sql_on: ${users.clientid} = ${clients.id} ;;
    relationship: many_to_one
  }
}
explore: Survey_Responses_With_Userid {
  label: "1) Survey Responses with Learner Info"
  join: users {
    type: left_outer # A standard SQL left join will be used (the method keeps all records, even if no joinable user data is found)
    relationship: one_to_one # The "left side" table (the table we're joining from, the basic_order_items table) can have many records for one record in the "right side" table (the basic_users table)
    sql_on: ${users.id} = ${Survey_Responses_With_Userid.Userid} ;; #  This uses the LookML references ( ${} syntax ) to define the on clause of the join that Looker will write (when needed)
  }
  join: clients {
    type:  left_outer
    relationship:  one_to_one
    sql_on:  ${clients.id} = ${users.clientid} ;;
  }
  join: learningpathactions {
    type: left_outer
    relationship:  one_to_one
    sql_on:  ${learningpathactions.userid} = ${users.id} ;;
  }
  join: learningpaths {
    type: left_outer
    relationship:  one_to_one
    sql_on:  ${learningpaths.id} = ${learningpathactions.learningpathid} ;;
  }
}
