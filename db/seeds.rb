# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kevin = User.create(name: 'Kevin', email: 'kevin@kevin.com', password: '1234')
christi = User.create(name: 'Christi', email: 'christ@christi.com', password: '1234')
jason = User.create(name: 'Jason', email: 'jason@jason.com', password: '1234')
jenn = User.create(name: 'Jenn', email: 'jenn@jenn.com', password: '1234')

cat = Tag.create(name: 'cat')
kitty = Tag.create(name: 'kitty')
caramel = Tag.create(name: 'caramel')
trump = Tag.create(name: 'trump')
armageddon = Tag.create(name: 'armageddon')
us = Tag.create(name: 'united states')
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
jobs = Tag.create(name: 'steve jobs')
apple = Tag.create(name: 'apple')
computers = Tag.create(name: 'computers')

first = Bookmark.create(title: 'Pretty Kitty', description: 'OMG Catz!', url: 'http://www.prettykitty.city/', user_id: kevin.id, image_url: 'http://www.rd.com/wp-content/uploads/sites/2/2016/04/01-cat-wants-to-tell-you-laptop.jpg')
first.tags = [cat, caramel]
second = Bookmark.create(title: 'Pretty Kitty', description: 'OMG Catz!', url: 'http://www.prettykitty.city/', user_id: jenn.id, image_url: 'http://www.rd.com/wp-content/uploads/sites/2/2016/04/01-cat-wants-to-tell-you-laptop.jpg')
second.tags = [kitty, caramel]
third = Bookmark.create(title: 'BBC News', description: 'News in the UK', url: 'http://www.bbc.com/news/world-us-canada-38589427', user_id: jason.id, image_url: 'http://www.bbc.co.uk/news/special/2015/newsspec_10857/bbc_news_logo.png?cb=1')
third.tags = [trump, armageddon, us, election]
fourth = Bookmark.create(title: 'Flatiron School', description: 'Come here to code for three months!', url: 'https://flatiron-school.slack.com/messages/web-1116/details/', user_id: christi.id)
fourth.tags = [coding, js]
fifth = Bookmark.create(title: 'Flatiron School', description: 'Come here to code for three months!', url: 'https://flatiron-school.slack.com/messages/web-1116/details/', user_id: jenn.id)
fifth.tags = [coding, ruby, flatiron, js, nolife]
sixth = Bookmark.create(title: 'Blogs', description: 'A new medium to write your blogs', url: 'https://medium.com/', user_id: christi.id)
sixth.tags = [blog, medium, post]
seventh = Bookmark.create(title: 'Blogs', description: 'A new medium to write your blogs', url: 'https://medium.com/', user_id: jenn.id)
seventh.tags = [post, apple]
eighth = Bookmark.create(title: 'Apple', description: 'Computers, devices, oh my', url: 'http://www.apple.com/', user_id: jason.id, image_url: 'https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?201612081039')
eighth.tags = [jobs, apple]
ninth = Bookmark.create(title: 'Apple', description: 'Computers, devices, oh my', url: 'http://www.apple.com/', user_id: kevin.id, image_url: 'https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?201612081039')
ninth.tags = [apple, cat]
tenth = Bookmark.create(title: 'Apple', description: 'Computers, devices, oh my', url: 'http://www.apple.com/', user_id: jenn.id, image_url: 'https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?201612081039')
tenth.tags = [computers, jobs]
eleventh = Bookmark.create(title: 'Apple', description: 'Computers, devices, oh my', url: 'http://www.apple.com/', user_id: christi.id, image_url: 'https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?201612081039')
eleventh.tags = [computers, jobs, apple]
