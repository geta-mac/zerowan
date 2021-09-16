# Admin.create!(
#    name: 'testtest',
#    email: 'test@test.com',
#    password: 'testtest',
# )

100.times do |p|
   Pet.create!(
      name: "ダークリ●ッ●マ#{p + 1}号",
      age: rand(1..3),
      castration: rand(1..3),
      category: rand(1..3),
      character: rand(1..2),
      gender: rand(1..4),
      avairable_area: rand(1..47),
      animal_type: rand(1..12),
      description: "テストNo.#{p + 1}",
      image1: open('./app/assets/images/DR.jpg'),
      user_id: 1
   )
end
