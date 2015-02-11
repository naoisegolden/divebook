# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  created_at             :datetime
#  updated_at             :datetime
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0")
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  country                :string
#  provider               :string
#  uid                    :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  authentication_token   :string
#
FactoryGirl.define do
  factory :user do
    name     Faker::Name.name
    email    Faker::Internet.email
    password Faker::Internet.password(8)

    factory :user_with_3_divesites do
      after(:create) do |user|
        3.times do
          user.divesites << FactoryGirl.create(:divesite, address: Faker::Address.city)
        end
      end
    end
  end
end
