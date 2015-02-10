count = 0
15.times do
  User.create(
    name: Faker::Name.name,
    email: "user#{count}@example.com",
    password: '12345678',
    country: Faker::Address.country)

  count += 1
end

15.times do
  address = "#{Faker::Address.city}, #{Faker::Address.country}"
  Divesite.create(
    name: Faker::Company.name,
    address: address)
end

20.times do
  Dive.create(
    user_id: rand(1...15),
    divesite_id: rand(1...15),
    date: Faker::Date.between(5.month.ago, Date.today))
end
