# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#seed user data
#seed concert data
User.delete_all
Concert.delete_all


users = [
	User.create(
		first_name: "Kayce", 
		last_name: "Danna", 
		current_city: "Denver",
		facebook_id: "10101560694417787",
		email: "kayce.danna@gmail.com",
		profile_photo: "https://scontent.xx.fbcdn.net/v/t1.0-1/p160x160/11709737_10101184563332497_1719156922581032238_n.jpg?oh=9d0495308239b76ffae93aa6fb631b2d&oe=581AB836"
		),
	User.create(
		first_name: "Kyle", 
		last_name: "Gibbons", 
		current_city: "Denver",
		facebook_id: "10208701595591385",
		email: "kgibbons.com",
		profile_photo: "https://scontent.xx.fbcdn.net/v/t1.0-9/12552995_10207227890989691_4343259897137735965_n.jpg?oh=2033e359097fed2aa231ce9213484ddd&oe=585C73EE"
		),
	User.create(
		first_name: "Luis", 
		last_name: "Metzger", 
		current_city: "Denver",
		facebook_id: "10209490174238679",
		email: "luismetzger@me.com@gmail.com",
		profile_photo: "https://scontent.xx.fbcdn.net/v/t1.0-9/10845971_10205052195731990_2832556411358384252_n.jpg?oh=d1ababfdb219ef48281436c57c13eea3&oe=585D7A9C"
		)
]


concerts = [
	Concert.create!(
		user_id: 1, 
		date: nil,
		band: "Car Seat Headrest", 
		venue: "Hi Dive",
		notes: "Worst band name. Ever. A bunch of young guys but they have a great sound.  Nothing mind blowing since the bads energy levels were low.  The recorded stuff resonates more."
		),
	Concert.create!(
		user_id: 1, 
		date: nil,
		band: "Animal Collective", 
		venue: "Ogden Theater",
		notes: "We lasted all of 25 mins at the show.  Ben fainted in the crowd. It was so so so scary. He just fell like a limp noodle and was totally unconscious for 30 secs or so. It was a sold out shows so we were lost in the all of the shuffle.   The guy next to me passed a joint to me and then I passed it behind me to my friends.  Everyone freaked out on that pot, and it must have gone straight to Ben's head and caused him to faint.  I didn't mind leaving early.  I am not into new Animal Collective anyway."
		),
	Concert.create!(
		user_id: 1, 
		date: nil,
		band: "Jose Gonzales", 
		venue: "Paramount Theater",
		notes: "We had a St. Patricks day date to this show.  Awesome seats. Beautiful theater and music.  It was the most memorable show I have been to this year.  Jose Gonzales was amazing.  His music is so raw and perfect at the same time."
		),
	Concert.create!(
		user_id: 1, 
		date: nil,
		band: "The Thermals", 
		venue: "Lost Lake Lounge",
		notes: "Lost Lake is an awesome place to see music. There is a 150 person capacity so it is very intimate. The Thermals brought it. It was a sweaty dance party.  Such good energy.  We talked to the band for a bit in a drunken haze after the show. We asked for a picture and all of a sudden Kathy from the band climb on my shoulders for the picture. Yep, I am 30.  Jim, Court, Colleen, Grant, Ben, and Mike were the suspects.  We went to a weird club called Milk post-show."
		),
	Concert.create!(
		user_id: 2, 
		date: nil,
		band: "Eddie Vedder", 
		venue: "The Crocodile",
		notes: "Badass.  Man crush."
		),
	Concert.create!(
		user_id: 2, 
		date: nil,
		band: "Rolling Stones", 
		venue: "Madison Square Garden",
		notes: "Fucking weeeeee man"
		),
	Concert.create!(
		user_id: 3, 
		date: nil,
		band: "Skrillex", 
		venue: "Warehouse Party",
		notes: "Wait, I went to a show?"
		)
]


	

