# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = User.create!(name: "Martha Washington", grade_level_id: 3, email: "martha@washington.edu", password: "password", city: "New York", state: "NY", school: "Washington Heights Middle School")

document = Document.create!(title: "Learning the ABC's", content: "A, B, C, D, E, F, G... You know the rest of the song.", lesson_id: 1)

lesson = Lesson.create!(topic: "American Revolution", description: "America fought and won...everything", user_id: 1, star_count: 1)

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

@all_grades = GradeLevel.pluck(:id)

100.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "password",
              city: Faker::Address.city,
              state: Faker::Address.state_abbr,
              school: Faker::Company.name,
              # avatar: Faker::Avatar.image("Profile-Picture", "150x150"),
              grade_level_id: @all_grades.sample)
end

@all_users = User.pluck(:id)

100.times do
  lesson = Lesson.create!(topic: Faker::Company.bs,
                 description: Faker::Lorem.sentences,
                 user_id: @all_users.sample,
                 star_count: Faker::Number.digit)
  grade_level_ids = GradeLevel.pluck(:id).sample((1..3).to_a.sample)
  grade_level_ids.each do |id|
    lesson.lesson_grade_levels.create!(grade_level_id: id)
  end
  subject_ids = Subject.pluck(:id).sample((1..3).to_a.sample)
  subject_ids.each do |id|
    lesson.lesson_subjects.create!(subject_id: id)
  end
end

@all_lessons = Lesson.pluck(:id)

100.times do
  Document.create!(title: Faker::Company.catch_phrase,
                  content: Faker::Lorem.sentences(1),
                  lesson_id: @all_lessons.sample)
end
