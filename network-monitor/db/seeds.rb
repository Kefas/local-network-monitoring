# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


(1..100).each do |i|
  Package.create(
      from_ip: Faker::Internet.ip_v4_address,
      to_ip: Faker::Internet.ip_v4_address,
      time: Faker::Time.between(Time.now - 2.week, Time.now).to_s,
      protocol: ['ssh', 'http', 'ssh'].sample,
      is_tcp: Faker::Boolean)
end


# youtube addresses from one address in 4 minutes interval
fixed_ip_adress = Faker::Internet.ip_v4_address
start_time = Time.now - 1.week

(1..10).each do |i|
  Package.create(
      from_ip: fixed_ip_adress,
      to_ip: ['208.65.153.238', '208.65.153.251', '208.65.153.253', '208.117.236.69'].sample,
      time: start_time + 4.minute * i,
      protocol: 'http',
      is_tcp: true)
end

