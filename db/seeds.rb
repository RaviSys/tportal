# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mentor_groups = MentorGroup.create([
  {name: "Mentor Group One"},
  {name: "Mentor Group Two"},
  {name: "Mentor Group Three"},
  {name: "Mentor Group Four"},
  {name: "Mentor Group Five"},
  {name: "Mentor Group Six"},
  {name: "Mentor Group Seven"},
  {name: "Mentor Group Eight"},
  {name: "Mentor Group Nine"},
  {name: "Mentor Group Ten"},
  {name: "Mentor Group Eleven"},
  {name: "Mentor Group Twelve"}
])

users = User.create([
  {
    first_name: "Ravi", 
    last_name: "Singh", 
    role: "admin", 
    email: "admin@tportal.com", 
    password: "password"
  }, 
  {
    first_name: "Rishabh", 
    last_name: "Rai", 
    role: "mentor", 
    email: "rishabh@tportal.com", 
    password: "password"
  }, 
  {
    first_name: "Richa", 
    last_name: "Singh", 
    role: "mentor", 
    email: "richa@tportal.com", 
    password: "password"
  }, 
  {
    first_name: "Anand", 
    last_name: "Singh", 
    role: "participant", 
    email: "anand@tportal.com", 
    password: "password",
    mentor_id: 2
  }, 
  {
    first_name: "Deepesh", 
    last_name: "Singh", 
    role: "participant", 
    email: "deepesh@tportal.com", 
    password: "password",
    mentor_id: 2
  }, 
  {
    first_name: "Harshaditya", 
    last_name: "Singh", 
    role: "participant", 
    email: "harsha@tportal.com", 
    password: "password",
    mentor_id: 2
  }
])