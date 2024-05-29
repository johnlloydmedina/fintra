require 'faker'

current_year = Time.now.year
base_id_number = 1

100.times do |i|
  Member.create!(
    member_id: "#{current_year}#{format('%03d', base_id_number + i)}",
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
    complete_address: Faker::Address.full_address,
    contact_number: Faker::PhoneNumber.phone_number,
    email_address: Faker::Internet.email,
    gender: [0, 1].sample,
    civil_status: [0, 1, 2, 3].sample,
    birthdate: Faker::Date.between(from: '1950-01-01', to: '2000-12-31'),
    age: Faker::Number.between(from: 18, to: 70),
    profile_picture: "cat-5.png",
    username: Faker::Internet.username,
    password_digest: Faker::Internet.password(min_length: 8),
    account_status: [0, 1].sample
  )
end

LoanType.create!([
  { loan_type_name: "Regular loan", description: "Standard loan", interest: 20, duration: "1 month", penalty: 5 },
  { loan_type_name: "Fast cash", description: "Fast cash release", interest: 5, duration: "1 week", penalty: 5 },
  { loan_type_name: "Annual", description: "Yearly ammortization", interest: 20, duration: "1 year", penalty: 5 }
])