# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: "Harry")
user2 = User.create(name: "Tanusri")

# GROUPS
group1 = Category.create(name: "Group1", author_id: user1, icon: "https://www.flaticon.com/free-icon/flower_10404135")
group2 = Category.create(name: "Group2", author_id: user1, icon: "https://www.flaticon.com/free-icon/wedges_10404291")

# TRANRACTS
transaract1 = Expense.create(name: "Transract1", author_id: user1, amount: 10)
transaract2 = Expense.create(name: "Transract2", author_id: user1, amount: 58)
