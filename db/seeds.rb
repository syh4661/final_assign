# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# id를 세개 만들고, 각각 게시글 3개를 만듦
(1..3).each do |i|
    User.create(email: "hyeok#{i}@gmail.com", password: "hyeok#{i}", password_confirmation: "hyeok#{i}")
    (1..3).each do |j|
        Post.create(user_id: i, title: "title#{i}#{j}", content: "content#{i}#{j}")
    end
end
    