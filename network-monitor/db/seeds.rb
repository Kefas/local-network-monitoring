# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


(1..100).each do |i|
  Package.create(
      from: Faker::Internet.user_name,
      to: Faker::Internet.domain_name,
      time: Faker::Time.between(Time.now - 2.week, Time.now).to_s,
      protocol: ['ssh', 'http', 'ssh'].sample,
      is_tcp: Faker::Boolean)
end


# youtube addresses from one address in 4 minutes interval
fixed_ip_adress = Faker::Internet.user_name
start_time = Time.now - 1.week

(1..100).each do |i|
  Package.create(
      from: fixed_ip_adress,
      to: 'www.youtube.com',
      time: start_time + 4.minute * i,
      protocol: 'http',
      is_tcp: true)
end

(1..100).each do |i|
  Package.create(
      from: fixed_ip_adress,
      to: 'www.google.com',
      time: start_time + 4.day + 4.minute * i,
      protocol: 'http',
      is_tcp: true)
end

(1..50).each do |i|
  Package.create(
      from: fixed_ip_adress,
      to: 'www.facebook.com',
      time: start_time - 2.day + 4.minute * i,
      protocol: 'http',
      is_tcp: true)
end


