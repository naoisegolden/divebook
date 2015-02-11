# == Schema Information
#
# Table name: dives
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  divesite_id :integer
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryGirl.define do
  factory :dive do
    date      Faker::Date.between(5.month.ago, Date.today)
    user
    divesite
  end
end
