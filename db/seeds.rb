require 'faker'

current_year = Time.now.year
base_id_number = 1

10.times do |i|
  Member.create!(
    member_id: "#{current_year}#{format('%03d', base_id_number + i)}",
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
    complete_address: Faker::Address.full_address,
    contact_number: Faker::PhoneNumber.phone_number,
    email_address: Faker::Internet.email,
    gender: ['Male', 'Female'].sample,
    civil_status: ['Single', 'Married', 'Divorced', 'Widowed'].sample,
    birthdate: Faker::Date.between(from: '1950-01-01', to: '2000-12-31'),
    age: Faker::Number.between(from: 18, to: 70),
    profile_picture: "proof-of-identity.jpg",
    username: Faker::Internet.username,
    password_digest: Faker::Internet.password(min_length: 8),
    account_status: [0, 1].sample
  )
end