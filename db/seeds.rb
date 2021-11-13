user = User.create!(
  name: 'test test',
  email: 'test@test.com',
  password: 'test1234',
  role: 'paid'
)
puts 'made user'

competition = Competition.create!(
  user_id: user.id,
  name: 'Fake Competition'
)

puts 'made competition'

counter = 0

3.times do 
  #make prizes
  Prize.create!(competition_id: competition.id,
               name: 'Prize' + counter.to_s, 
               dollar_value: rand(1..100)
              )
  counter += 1
  puts 'made prizes'
end