User.create(username: "rob", email: "rob@test.com", password: "hello", full_name: "Roberto Samia")
User.create(username: "rocky", email: "rocky@test.com", password: "adrian", full_name: "Rocky Balboa")
User.create(username: "wonka", email: "wonka@test.com", password: "candy", full_name: "Willy Wonka")

Event.create(name: " Chattoga County Health Fair", date: "3/7/19", location: "Summerville Senior Center", description: "Education and Inservice about Hypertension with Free Health Screen", user_id: 1)
Event.create(name: " Boxing for Winners not Weiners", date: "7/7/19", location: "Phillips Center", description: "Boxing Conference to use Boxing to lose weight and train not to get beat up in a fight ", user_id: 2)
Event.create(name: " Candy Event", date: "4/1/19", location: "Willy Wonka Factory", description: "For The love of Candy , Candy Making and Technique", user_id: 3)

RsvpEvent.create(event_id: 1, user_id: 3)
RsvpEvent.create(event_id: 2, user_id: 1)
RsvpEvent.create(event_id: 3, user_id: 2)