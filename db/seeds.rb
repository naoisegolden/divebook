count = 0
15.times do
  User.create(
    name: Faker::Name.name,
    email: "user#{count}@example.com",
    password: '12345678',
    country: Faker::Address.country)

  count += 1
end
