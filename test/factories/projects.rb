# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
  	user
  	title 'Rearden Metal'
  	teaser "Jesus Based Metal; Lighter than air, stronger than diamonds."
  	description "It Color is undescriable in the english vocalulary."
  	goal 1000000
  end
end
