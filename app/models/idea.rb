class Idea < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  
  enum benefits: [
    :better_decision_making,
    :improved_reputation,
    :reduced_risk,
    :time_saved,
    :cost,
    :improved_service,
    :staff_engagement_and_moral
  ]

  enum it_system: [
    :cclf,
    :ccms,
    :ccr,
    :cis,
    :cwa,
    :eforms,
    :laa_online_portal,
    :maat,
    :maat_libra,
    :management_information,
    :obiee,
    :pims,
    :tv
  ]

  enum involvement: [
    :i_want_to_be_informed,
    :i_want_to_be_involved,
    :i_want_to_lead_on_this,
    :no_involvement
  ]
end
