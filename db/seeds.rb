# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Users
user1 = User.create(email: "test@test.com", password: "Password123")
user2 = User.create(email: "test@example.com", password: "differentPassword")

# Create Notes
note1 = Note.create(title: "New Business Idea", body: "I have an amazing idea for a new business", user_id: "1")
note2 = Note.create(title: "To Do List", body: "take out garbage, wash dishes, do laundry", user_id: "1")
note3 = Note.create(title: "Shopping List", body: "bread, milk, cereal, capsicum", user_id: "2")