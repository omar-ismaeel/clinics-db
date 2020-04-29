require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
doctors = []
patients = []
20.times do
  doctor = Doctor.create(name: Faker::Name.name,rank: Faker::Job.seniority,position: Faker::Job.position,email: Faker::Internet.email,phone_number: Faker::PhoneNumber.phone_number)
  [1,2,3,4].sample.times do
    appointments = doctor.appointments.create(start: Faker::Time.between(from: DateTime.now - 4, to: DateTime.now), finish: Faker::Time.between(from: DateTime.now, to: DateTime.now+5))
  end
   [1,2,3,4].sample.times do
    addresses = doctor.address.create(country: Faker::Address.country, city: Faker::Address.city, area: Faker::Address.state,street: Faker::Address.street_name)
   end
  [1,2,3,4].sample.times do
    availables = doctor.availables.create(Start: Faker::Time.between(from: DateTime.now - 4, to: DateTime.now), Finish: Faker::Time.between(from: DateTime.now, to: DateTime.now+5))
  end
  [1,2,3,4].sample.times do
    skills = doctor.skills.create(name: Faker::Job.key_skill, level: Faker::Number.within(range: 0..20))
  end
  doctors.push(doctor)
end

20.times do
  patient = Patient.create(name: Faker::Name.name,age: Faker::Number.within(range: 18..85),gender: Faker::Gender.binary_type, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number)
  
   [1,2,3,4].sample.times do
     addresses = patient.address.create(country: Faker::Address.country, city: Faker::Address.city, area: Faker::Address.state, street: Faker::Address.street_address)
   end

  [1,2,3,4].sample.times do
    appointments = patient.appointments.create(start: Faker::Time.between(from: DateTime.now - 4, to: DateTime.now), finish: Faker::Time.between(from: DateTime.now, to: DateTime.now+5))
  end

  [1,2,3,4].sample.times do
    reviews = patient.reviews.create(doctor_id: Faker::Number.within(range: 0..20), body: Faker::Lorem.paragraph, rating: Faker::Number.within(range: 0..5))
  end

end


departments = ["Emergency","Cardiology","Intensive care","Neurology","Oncology"].map do |department|
  Department.create(name: department)
end

Department_head.create(doctor_id: doctors.sample.id, department_id: departments.sample.id)
