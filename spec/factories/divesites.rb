# == Schema Information
#
# Table name: divesites
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryGirl.define do
  factory :divesite do
    name    Faker::Company.name
    address Faker::Address.city

    factory :divesite_with_5_users do
      after(:create) do |divesite|
        5.times do
          divesite.users << FactoryGirl.create(:user, email: Faker::Internet.email)
        end
      end
    end
  end
end
