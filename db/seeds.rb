# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(name: "Martha Washington", grade_level_id: 3, email: "martha@washington.edu", password: "password", city: "New York", state: "NY", school: "Washington Heights Middle School", profile_photo: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT-bIRT5v5o3qJHC2KGYbbjIsBcZ0s2pJQHO2J-_lxtuPUPc6drvg")

document = Document.create!(title: "Learning the ABC's", content: "A, B, C, D, E, F, G... You know the rest of the song.", lesson_id: 1)

lesson = Lesson.create!(topic: "American Revolution", description: "America fought and won...everything", user_id: 1, plan_id: 1, star_count: 1)

plan = Plan.create!(title: "Plan for History 101", description: "History is great.", user_id: 1, star_count: 1)

grade_level = GradeLevel.create!(title: "Kindergarten")

subject = Subject.create!(title: "History")

GradeLevel.create!(title: "1st Grade")
GradeLevel.create!(title: "2nd Grade")
GradeLevel.create!(title: "3rd Grade")
GradeLevel.create!(title: "4th Grade")
GradeLevel.create!(title: "5th Grade")
GradeLevel.create!(title: "6th Grade")
GradeLevel.create!(title: "7th Grade")
GradeLevel.create!(title: "8th Grade")

Subject.create!(title: "Mathematics")
Subject.create!(title: "Science")
Subject.create!(title: "Language Arts")
Subject.create!(title: "Physical Education")
Subject.create!(title: "Music")
Subject.create!(title: "Art")
Subject.create!(title: "Technology Lessons")

@all_grades = []
GradeLevel.all.each do |u|
  @all_grades << u.id
end

100.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "password",
              city: Faker::Address.city,
              state: Faker::Address.state_abbr,
              school: Faker::Company.name,
              profile_photo: Faker::Avatar.image("Profile-Picture", "150x150"),
              grade_level_id: @all_grades.sample)
end

@all_users = []
User.all.each do |u|
  @all_users << u.id
end

100.times do
  Plan.create!(title: Faker::Commerce.product_name,
               description: Faker::Lorem.sentence,
               user_id: @all_users.sample,
               star_count: Faker::Number.digit)
end

@all_plans = []
Plan.all.each do |u|
  @all_plans << u.id
end

100.times do
  Lesson.create!(topic: Faker::Company.bs,
                 description: Faker::Lorem.sentences,
                 user_id: @all_users.sample,
                 plan_id: @all_plans.sample,
                 star_count: Faker::Number.digit)
end

@all_lessons = []
Lesson.all.each do |u|
  @all_lessons << u.id
end

100.times do
  Document.create!(title: Faker::Company.catch_phrase,
                  content: Faker::Lorem.sentences(1),
                  lesson_id: @all_lessons.sample)
end





# User.create!(name: "Martha Washington", grade_level_id: 3, email: "martha@washington.edu", password: "password", city: "New York", state: "NY", school: "Washington Heights Middle School", profile_photo: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT-bIRT5v5o3qJHC2KGYbbjIsBcZ0s2pJQHO2J-_lxtuPUPc6drvg")
# User.create!(name: "John Smith", grade_level_id: 4, email: "john@nccsm.edu", city: "Durham", password: "password", state: "NC", school: "NCSSM" )
# User.create!(name: "Brian Johnson", grade_level_id: 4, email: "brian@duke.edu", city: "Raleigh", password: "password", state: "NC", school: "Duke University" )
# User.create!(name: "Kevin Williams", grade_level_id: 4, email: "kevin@campbell.edu", city: "Cary", password: "password", state: "NC", school: "Campbell University" )
#
# Document.create(title: "My first document", content: "I am content...blah blah", lesson_id: 1)
# Document.create(title: "My second document", content: "I am also content! YAY!", lesson_id: 2)
# Document.create(title: "My third document", content: "I am the third set of content", lesson_id: 3)
#
# GradeLevel.create(title: "Kindergarten")
# GradeLevel.create(title: "5th")
# GradeLevel.create(title: "2nd")
# GradeLevel.create(title: "3rd")
# GradeLevel.create(title: "4rd")
# GradeLevel.create(title: "5th")
#
# Lesson.create(topic: "American Revolution", description: "America fought and won...everything", user_id: 1, plan_id: 1, star_count: 1)
# Lesson.create(topic: "Politics in the 80's", description: "A talk about the President and his office during the mid 80's", user_id: 2, plan_id: 2, star_count: 2)
# Lesson.create(topic: "High-level Math Problems", description: "Sequences and Series using logarithms", user_id: 3, plan_id: 3, star_count: 3)
#
# Plan.create(title: "Plan for History 101", description: "History is great.", user_id: 1, star_count: 1)
# Plan.create(title: "Plan for Poly Sci 101", description: "English is great.", user_id: 2, star_count: 2)
# Plan.create(title: "Plan for Math 101", description: "Science is great.", user_id: 3, star_count: 3)
#
# Subject.create(title: "History")
# Subject.create(title: "Political Science")
# Subject.create(title: "Mathematics")
