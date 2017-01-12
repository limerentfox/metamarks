# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kevin = User.create(email: 'kevin@kevin.com', password: '1234')
christi = User.create(email: 'christ@christi.com', password: '1234')
jason = User.create(email: 'jason@jason.com', password: '1234')
jenn = User.create(email: 'jenn@jenn.com', password: '1234')

cat = Tag.create(name: 'cat')
kitty = Tag.create(name: 'kitty')
caramel = Tag.create(name: 'caramel')
trump = Tag.create(name: 'trump')
armageddon = Tag.create(name: 'armageddon')
us = Tag.create(name: 'United States')
election = Tag.create(name: 'election')
coding = Tag.create(name: 'coding')
flatiron = Tag.create(name: 'flatiron')
ruby = Tag.create(name: 'ruby')
js = Tag.create(name: 'javascript')
jobs = Tag.create(name: 'jobs')
nolife = Tag.create(name: 'no life')
blog = Tag.create(name: 'blog')
medium = Tag.create(name: 'medium')
post = Tag.create(name: 'post')
jobs = Tag.create(name: 'Steve Jobs')
apple = Tag.create(name: 'apple')
computers = Tag.create(name: 'computers')

first = Bookmark.create(url: 'http://www.prettykitty.city/', user_id: kevin.id)
first.tags = [cat, caramel]
second = Bookmark.create(url: 'http://www.prettykitty.city/', user_id: jenn.id)
second.tags = [kitty, caramel]
third = Bookmark.create(url: 'http://www.bbc.com/news/world-us-canada-38589427', user_id: jason.id)
third.tags = [trump, armageddon, us, election]
fourth = Bookmark.create(url: 'https://flatiron-school.slack.com/messages/web-1116/details/', user_id: christi.id)
fourth.tags = [coding, js]
fifth = Bookmark.create(url: 'https://flatiron-school.slack.com/messages/web-1116/details/', user_id: jenn.id)
fifth.tags = [coding, ruby, flatiron, js, nolife]
sixth = Bookmark.create(url: 'https://medium.com/', user_id: christi.id)
sixth.tags = [blog, medium, post]
seventh = Bookmark.create(url: 'https://medium.com/', user_id: jenn.id)
seventh.tags = [post, apple]
eighth = Bookmark.create(url: 'http://www.apple.com/', user_id: jason.id)
eighth.tags = [jobs, apple]
ninth = Bookmark.create(url: 'http://www.apple.com/', user_id: kevin.id)
ninth.tags = [apple, cat]
tenth = Bookmark.create(url: 'http://www.apple.com/', user_id: jenn.id)
tenth.tags = [computers, jobs]
eleventh = Bookmark.create(url: 'http://www.apple.com/', user_id: christi.id)
eleventh.tags = [computers, jobs, apple]
