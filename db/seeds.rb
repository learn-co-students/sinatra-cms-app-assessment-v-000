musician1 = Musician.create(username: "abc", password: "abc")
musician2 = Musician.create(username: "123", password: "123")

review1 = Review.create(content: "It Sucked!")
review2 = Review.create(content: "Great!")

venue1 = Venue.create(name: "The Court Tavern", location: "New Brunswick")
venue2 = Venue.create(name: "Johnny Brenda's", location: "Philadelphia")

musician1.reviews << review1
venue1.reviews << review1
musician1.save
venue1.save

musician2.reviews << review2
venue2.reviews << review2
musician2.save
venue2.save
