require 'faker'

current_year = Time.now.year
base_id_number = 1

20.times do |i|
  Debtor.create(
    debtor_id: "#{current_year}#{format('%03d', base_id_number + i)}",
    name: Faker::Name.name[0..49],
    contact: Faker::PhoneNumber.cell_phone_in_e164[0..12],
    email: Faker::Internet.email[0..19],
    address: Faker::Address.full_address,
    proof_of_billing: "proof-of-address.png",
    identification: Faker::IDNumber.valid,
    proof_of_identity: "proof-of-identity.jpg",
    credit_score: rand(300..850),
    is_active: rand(0..1),
    remarks: Faker::Lorem.paragraph
  )
end