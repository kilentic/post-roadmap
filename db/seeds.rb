# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.create category: "like_comment", content: "reacted to your comment"
Event.create category: "like_post", content: "reacted to your post"
Event.create category: "comment_post", content: "commented on your post"
