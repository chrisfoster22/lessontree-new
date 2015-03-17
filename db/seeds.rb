# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create(name: "John Smith", email: "smith@gmail.com", password: "password", location: "Durham, NC", school: "NCSSM" )
# User.create(name: "Brian Johnson", email: "johnson@gmail.com", password: "password", location: "Raleigh, NC", school: "Duke University" )
# User.create(name: "Kevin Williams", email: "williams@gmail.com", password: "password", location: "Cary, NC", school: "Campbell University" )

Document.create(title: "My first document", content: "I am content...blah blah", lesson_id: 1)
Document.create(title: "My second document", content: "I am also content! YAY!", lesson_id: 2)
Document.create(title: "My third document", content: "I am the third set of content", lesson_id: 3)

GradeLevel.create(title: "Kindergarten")
GradeLevel.create(title: "First Grade")
GradeLevel.create(title: "Second Grade")
GradeLevel.create(title: "Third Grade")
GradeLevel.create(title: "Fourth Grade")
GradeLevel.create(title: "Fifth Grade")

Lesson.create(topic: "American Revolution", description: "America fought and won...everything", user_id: 1, plan_id: 1, star_count: 1)
Lesson.create(topic: "Politics in the 80's", description: "A talk about the President and his office during the mid 80's", user_id: 2, plan_id: 2, star_count: 2)
Lesson.create(topic: "High-level Math Problems", description: "Sequences and Series using logarithms", user_id: 3, plan_id: 3, star_count: 3)

Plan.create(title: "Plan for History 101", description: "History is great.", user_id: 1, star_count: 1)
Plan.create(title: "Plan for Poly Sci 101", description: "English is great.", user_id: 2, star_count: 2)
Plan.create(title: "Plan for Math 101", description: "Science is great.", user_id: 3, star_count: 3)

Subject.create(title: "History")
Subject.create(title: "Political Science")
Subject.create(title: "Mathematics")
