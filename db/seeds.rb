# Clear existing data
puts "Clearing existing data..."
ReviewVote.destroy_all
TagVote.destroy_all
RestaurantTag.destroy_all
Review.destroy_all
Tag.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "Creating users..."
users = [
  {
    email: "john@example.com",
    password: "password123",
    first_name: "John",
    last_name: "Doe",
    username: "johndoe"
  },
  {
    email: "jane@example.com",
    password: "password123",
    first_name: "Jane",
    last_name: "Smith",
    username: "janesmith"
  },
  {
    email: "mike@example.com",
    password: "password123",
    first_name: "Mike",
    last_name: "Johnson",
    username: "mikej"
  },
  {
    email: "emily@example.com",
    password: "password123",
    first_name: "Emily",
    last_name: "Brown",
    username: "emilyb"
  },
  {
    email: "chris@example.com",
    password: "password123",
    first_name: "Chris",
    last_name: "Lee",
    username: "chrisl"
  },
  {
    email: "sarah@example.com",
    password: "password123",
    first_name: "Sarah",
    last_name: "Garcia",
    username: "sarahg"
  },
  {
    email: "david@example.com",
    password: "password123",
    first_name: "David",
    last_name: "Martinez",
    username: "davidm"
  },
  {
    email: "laura@example.com",
    password: "password123",
    first_name: "Laura",
    last_name: "Nguyen",
    username: "lauran"
  },
  {
    email: "brian@example.com",
    password: "password123",
    first_name: "Brian",
    last_name: "Clark",
    username: "brianc"
  },
  {
    email: "olivia@example.com",
    password: "password123",
    first_name: "Olivia",
    last_name: "Lopez",
    username: "olivial"
  }
]

created_users = users.map do |user_data|
  User.create!(user_data)
end

puts "Created #{created_users.count} users"

puts "Creating restaurants..."
restaurants = [
  {
    "address": "1003 Barton Springs Rd",
    "latitude": 30.2597015,
    "longitude": -97.75482339999999,
    "phone": "(512) 394-5899",
    "website": "http://terryblacksbbq.com/",
    "description": "Spacious, casual stop for pit-smoked meats & housemade sides from famous 4th-generation pitmasters.",
    "name": "Terry Black's Barbecue",
    "google_restaurant_id": "ChIJZSqCDhu1RIYRx1iRoCvCOsA"
  },
  {
    "address": "900 E 11th St",
    "latitude": 30.270124999999997,
    "longitude": -97.73134189999999,
    "phone": "(512) 653-1187",
    "website": "https://franklinbarbecue.com/",
    "description": "Long lines form early for brisket, pulled pork & other smoked meats at this bustling spot.",
    "name": "Franklin Barbecue",
    "google_restaurant_id": "ChIJM8w7rqS1RIYRhEz2-KuoqzE"
  },
  {
    "address": "2115 S Lamar Blvd",
    "latitude": 30.2477396,
    "longitude": -97.7713502,
    "phone": "(512) 916-4858",
    "website": "https://www.loroeats.com/locations/austin/south-lamar/",
    "description": "Asian smokehouse meets Texas barbecue in a rustic spot with beer, wine, and cocktails, plus a giant patio.",
    "name": "Loro Asian Smokehouse & Bar",
    "google_restaurant_id": "ChIJH3w8zB61RIYRhKc2dFxr5bs"
  },
  {
    "address": "2613 S Lamar Blvd",
    "latitude": 30.245117999999998,
    "longitude": -97.779281,
    "phone": "(512) 462-9333",
    "website": "http://www.mattselrancho.com/",
    "description": "Family-friendly Tex-Mex spot that's been drawing crowds with enchiladas & margaritas since 1952.",
    "name": "Matt's El Rancho",
    "google_restaurant_id": "ChIJH5Enqda0RIYR7UBMfuWeCvE"
  },
  {
    "address": "621 Congress Ave. Suite 101",
    "latitude": 30.2688157,
    "longitude": -97.7422982,
    "phone": "(512) 982-6766",
    "website": "http://www.carolinerestaurant.com/?utm_source=google&utm_medium=organic&utm_campaign=business_listing",
    "description": "Breakfast, weekend brunch, lunch, and dinner in modern surroundings with cocktails, craft beer, and wine.",
    "name": "Caroline",
    "google_restaurant_id": "ChIJQyfp5wm1RIYRd7IXfFuFzTg"
  },
  {
    "address": "1011 S Congress Ave Bldg 2 Suite 180",
    "latitude": 30.253315399999995,
    "longitude": -97.74802439999999,
    "phone": "(737) 273-0199",
    "website": "https://www.abarestaurants.com/austin/",
    "description": "Hip spot serving seafood and Mediterranean classics such as kebabs, hummus, and falafel, plus cocktails.",
    "name": "Aba Austin",
    "google_restaurant_id": "ChIJDfhk1ja1RIYR3NIISvjn88k"
  },
  {
    "address": "415 W Martin Luther King Jr Blvd",
    "latitude": 30.281481799999998,
    "longitude": -97.74250409999999,
    "phone": "(512) 474-2751",
    "website": "https://locations.raisingcanes.com/tx/austin/415-west-martin-luther-king-blvd",
    "description": "Fast-food chain specializing in fried chicken fingers, crinkle-cut fries & Texas toast.",
    "name": "Raising Cane's Chicken Fingers",
    "google_restaurant_id": "ChIJgUnp4nW1RIYR3LRKaVS6R3U"
  },
  {
    "address": "503 W Martin Luther King Jr Blvd",
    "latitude": 30.2817185,
    "longitude": -97.7431593,
    "phone": "(512) 473-8651",
    "website": "https://www.chick-fil-a.com/locations/tx/martin-luther-king-drive-thru-only?utm_source=yext&utm_medium=link",
    "description": "Fast-food chain serving chicken sandwiches & nuggets along with salads & sides.",
    "name": "Chick-fil-A",
    "google_restaurant_id": "ChIJd4CbdHa1RIYRrqSDWk0F2uk"
  },
  {
    "address": "1415 S Congress Ave",
    "latitude": 30.249228600000002,
    "longitude": -97.7495328,
    "phone": "(512) 444-7437",
    "website": "https://homeslicepizza.com/location/south-congress/",
    "description": "Thin-crust slices & pies for dining in or carry out, open late for takeaway on weekends.",
    "name": "Home Slice Pizza",
    "google_restaurant_id": "ChIJu96UVvy0RIYRCPxWa4TSr6o"
  },
  {
    "address": "801 Red River St",
    "latitude": 30.268493199999998,
    "longitude": -97.7362565,
    "phone": "(737) 465-1218",
    "website": "http://www.stubbsaustin.com/",
    "description": "Beer, brisket and music Downtown with a renowned Sunday gospel brunch.",
    "name": "Stubb's Bar-B-Q",
    "google_restaurant_id": "ChIJSVyqJ6S1RIYRdx8PPPRl9Is"
  },
  {
    "address": "4715 E Cesar Chavez St",
    "latitude": 30.251414500000003,
    "longitude": -97.7022034,
    "phone": "(512) 615-3555",
    "website": "https://denadacantina.com/",
    "description": "Cozy locale with outdoor seating, prepping traditional Mexican fare like barbacoa & carnitas.",
    "name": "De Nada Cantina",
    "google_restaurant_id": "ChIJYzTW7YK1RIYRCW0QG4_Eik4"
  },
  {
    "address": "303 Red River St",
    "latitude": 30.2637562,
    "longitude": -97.7380259,
    "phone": "(512) 236-9599",
    "website": "http://www.moonshinegrill.com/",
    "description": "Contemporary comfort food & cocktails in a historic home with a patio.",
    "name": "Moonshine Grill",
    "google_restaurant_id": "ChIJzTkDkai1RIYR9PpN5L6zHD0"
  },
  {
    "address": "1900 S 1st St",
    "latitude": 30.246497100000003,
    "longitude": -97.7567785,
    "phone": "(512) 416-1601",
    "website": "http://bouldincreekcafe.com/",
    "description": "Eco-friendly, bohemian cafe offering hearty meatless meals, coffees & a rotating monthly art show.",
    "name": "Bouldin Creek Cafe",
    "google_restaurant_id": "ChIJH-Sj5OK0RIYRjC-_RrNEotk"
  },
  {
    "address": "1618 E Riverside Dr",
    "latitude": 30.245402600000002,
    "longitude": -97.7304691,
    "phone": "(512) 462-9999",
    "website": "https://1618asianfusion.com/",
    "description": "Cocktails & classic Asian fusion fare in a contemporary restaurant with patio dining.",
    "name": "1618 Asian Fusion",
    "google_restaurant_id": "ChIJS5e6G7a1RIYRxVd0-HJFtRs"
  },
  {
    "address": "1203 E 11th St",
    "latitude": 30.268404099999998,
    "longitude": -97.7276077,
    "phone": "(512) 270-9980",
    "website": "http://www.paperboyaustin.com/",
    "description": "Breakfast, brunch, and cocktails served in a warm, hip restaurant with a patio.",
    "name": "Paperboy East",
    "google_restaurant_id": "ChIJ4Y1SrLu1RIYRDZHWbSNOvIk"
  },
  {
    "address": "110 E 2nd St",
    "latitude": 30.2645703,
    "longitude": -97.7438317,
    "phone": "(512) 608-4488",
    "website": "https://www.cornerrestaurantaustin.com/?utm_source=google&utm_medium=organic&utm_campaign=business_listing",
    "description": "Modern restaurant & bar in the JW Marriott Hotel featuring Texan menus, cocktails & a clubby vibe.",
    "name": "Corner Restaurant",
    "google_restaurant_id": "ChIJxcCceAi1RIYR9AqXT8eWDyc"
  },
  {
    "address": "1814 E Martin Luther King Jr Blvd",
    "latitude": 30.279880600000002,
    "longitude": -97.7215815,
    "phone": "(512) 394-5776",
    "website": "http://sourduckmarket.com/",
    "description": "Casual restaurant serving American fare made from locally-sourced ingredients plus market & bar.",
    "name": "Sour Duck Market",
    "google_restaurant_id": "ChIJAR7m4ZS1RIYRHB6RITAk13A"
  },
  {
    "address": "217 Congress Ave.",
    "latitude": 30.2649418,
    "longitude": -97.7437436,
    "phone": "(512) 474-4227",
    "website": "http://coopersbbqaustin.com/",
    "description": "Classic BBQ joint with picnic table seats serving brisket, ribs & more pulled straight from the pit.",
    "name": "Cooper's Old Time Pit Bar-B-Que",
    "google_restaurant_id": "ChIJoZsHcQi1RIYRfyBnp0UxNMI"
  },
  {
    "address": "2200 S I-35 Frontage Rd",
    "latitude": 30.2348527,
    "longitude": -97.7417114,
    "phone": "(512) 358-1117",
    "website": "https://machisushiaustin.com/",
    "description": "",
    "name": "Machi Sushi",
    "google_restaurant_id": "ChIJZ6z4jbe1RIYR5mH_PDKq6HI"
  },
  {
    "address": "2109 E Riverside Dr",
    "latitude": 30.2395893,
    "longitude": -97.72695089999999,
    "phone": "(512) 383-8556",
    "website": "https://locations.raisingcanes.com/tx/austin/2109-east-riverside-dr.",
    "description": "Fast-food chain specializing in fried chicken fingers, crinkle-cut fries & Texas toast.",
    "name": "Raising Cane's Chicken Fingers",
    "google_restaurant_id": "ChIJo0TKtEW0RIYRDZjH9rvU1QA"
  }
]

created_restaurants = restaurants.map do |restaurant_data|
  Restaurant.create!(restaurant_data)
end

puts "Created #{created_restaurants.count} restaurants"

puts "Creating tags..."
tag_names = [
  "sushi", "japanese", "seafood", "fresh", "casual", "takeout",
  "bbq", "texas", "pit-smoked", "ribs", "brisket", "hearty",
  "american", "comfort food", "market", "local", "seasonal",
  "modern", "upscale", "cocktails", "downtown", "dinner",
  "breakfast", "brunch", "coffee", "hipster", "patio",
  "asian fusion", "contemporary", "dining", "creative",
  "vegetarian", "vegan", "cafe", "bohemian",
  "southern", "gospel brunch", "live music", "beer",
  "pizza", "new york style", "thin crust", "late night",
  "fast food", "chicken", "sandwiches", "drive-thru", "family friendly", "quick",
  "chicken fingers", "sauce", "crispy", "fries",
  "mediterranean", "seafood", "upscale", "family friendly",
  "mexican", "tacos", "barbacoa", "outdoor seating", "friendly", "tex-mex",
  "margaritas", "enchiladas", "historic",
  "smokehouse", "texas bbq", "rustic",
  "long lines", "classic", "pulled pork", "local", "family style"
]

created_tags = tag_names.map do |tag_name|
  Tag.find_or_create_by_name(tag_name)
end

puts "Created #{created_tags.count} tags"

puts "Creating restaurant-tag associations..."
restaurant_tag_mappings = {
  "Machi Sushi" => ["sushi", "japanese", "seafood", "fresh", "casual", "takeout"],
  "Cooper's Old Time Pit Bar-B-Que" => ["bbq", "texas", "pit-smoked", "ribs", "brisket", "hearty"],
  "Sour Duck Market" => ["american", "comfort food", "market", "local", "seasonal", "casual"],
  "Corner Restaurant" => ["modern", "american", "upscale", "cocktails", "downtown", "dinner"],
  "Paperboy East" => ["breakfast", "brunch", "coffee", "casual", "hipster", "patio"],
  "1618 Asian Fusion" => ["asian fusion", "cocktails", "contemporary", "dining", "patio", "creative"],
  "Bouldin Creek Cafe" => ["vegetarian", "vegan", "cafe", "bohemian", "local", "casual"],
  "Moonshine Grill" => ["comfort food", "southern", "brunch", "historic", "cocktails", "patio"],
  "De Nada Cantina" => ["mexican", "tacos", "barbacoa", "outdoor seating", "casual", "cocktails"],
  "Stubb's Bar-B-Q" => ["bbq", "live music", "brisket", "gospel brunch", "downtown", "beer"],
  "Home Slice Pizza" => ["pizza", "new york style", "thin crust", "late night", "casual", "takeout"],
  "Chick-fil-A" => ["fast food", "chicken", "sandwiches", "drive-thru", "family friendly", "quick"],
  "Raising Cane's Chicken Fingers" => ["fast food", "chicken fingers", "sauce", "crispy", "fries", "quick"],
  "Aba Austin" => ["mediterranean", "seafood", "cocktails", "upscale", "dining", "casual"],
  "Caroline" => ["american", "brunch", "cocktails", "modern", "downtown", "friendly"],
  "Matt's El Rancho" => ["tex-mex", "family friendly", "margaritas", "enchiladas", "casual", "historic"],
  "Loro Asian Smokehouse & Bar" => ["asian fusion", "smokehouse", "texas bbq", "patio", "cocktails", "rustic"],
  "Franklin Barbecue" => ["bbq", "brisket", "long lines", "texas", "pulled pork", "classic"],
  "Terry Black's Barbecue" => ["bbq", "pit-smoked", "family style", "hearty", "classic"]
}

restaurant_tag_mappings.each do |restaurant_name, tag_names|
  restaurant = created_restaurants.find { |r| r.name == restaurant_name }
  tag_names.each do |tag_name|
    tag = created_tags.find { |t| t.name == tag_name }
    RestaurantTag.create!(restaurant: restaurant, tag: tag, upvotes: rand(5..20), downvotes: rand(0..3))
  end
end

puts "Created restaurant-tag associations"

puts "Creating reviews..."
reviews_data = [
  {
    restaurant: "Machi Sushi",
    user: created_users[7],
    rating: 4,
    title: "Fresh and flavorful",
    content: "Everything tasted fresh, and the presentation was beautiful. The sashimi was especially good."
  },
  {
    restaurant: "Machi Sushi",
    user: created_users[6],
    rating: 4,
    title: "Solid sushi spot",
    content: "Reliable quality, fair prices, and quick service. Great for a casual dinner."
  },
  {
    restaurant: "Machi Sushi",
    user: created_users[2],
    rating: 4,
    title: "Hidden gem",
    content: "Machi surprised me—better than some high-end places. Try the spicy tuna roll."
  },
  {
    restaurant: "Cooper's Old Time Pit Bar-B-Que",
    user: created_users[1],
    rating: 4,
    title: "Pick your meat right from the pit!",
    content: "I loved the hands-on approach. Everything was juicy and well-seasoned."
  },
  {
    restaurant: "Cooper's Old Time Pit Bar-B-Que",
    user: created_users[0],
    rating: 4,
    title: "Hearty and delicious",
    content: "Massive portions, great smoky flavor, and no fuss. Just good BBQ."
  },
  {
    restaurant: "Cooper's Old Time Pit Bar-B-Que",
    user: created_users[4],
    rating: 4,
    title: "Classic Texas BBQ",
    content: "The brisket was tender with a perfect smoke ring. Beans and cobbler were great too."
  },
  {
    restaurant: "Sour Duck Market",
    user: created_users[0],
    rating: 4,
    title: "Austin-style comfort food",
    content: "Not your typical fare, but very tasty and satisfying."
  },
  {
    restaurant: "Sour Duck Market",
    user: created_users[7],
    rating: 5,
    title: "Creative and casual",
    content: "The brisket sandwich and pastries were fantastic. Definitely coming back."
  },
  {
    restaurant: "Sour Duck Market",
    user: created_users[2],
    rating: 4,
    title: "Chill atmosphere, great food",
    content: "Loved the vibe and locally-sourced menu. Brunch is especially good."
  },
  {
    restaurant: "Corner Restaurant",
    user: created_users[3],
    rating: 5,
    title: "Upscale but approachable",
    content: "Nice ambience and attentive staff. Enjoyed the short rib."
  },
  {
    restaurant: "Corner Restaurant",
    user: created_users[7],
    rating: 4,
    title: "Elevated hotel dining",
    content: "Better than expected for a hotel spot. The tacos and cocktails were standouts."
  },
  {
    restaurant: "Corner Restaurant",
    user: created_users[1],
    rating: 4,
    title: "Convenient and tasty",
    content: "Perfect downtown stop. Everything was solid, nothing mind-blowing."
  },
  {
    restaurant: "Paperboy East",
    user: created_users[3],
    rating: 4,
    title: "Top-tier brunch",
    content: "The biscuits and gravy were amazing. Coffee was excellent too."
  },
  {
    restaurant: "Paperboy East",
    user: created_users[1],
    rating: 5,
    title: "Aesthetic and delicious",
    content: "Great plating and flavors. Sweet potato hash is a must."
  },
  {
    restaurant: "1618 Asian Fusion",
    user: created_users[4],
    rating: 4,
    title: "Good for groups",
    content: "Large menu with something for everyone. Recommend the bao and cocktails."
  },
  {
    restaurant: "Bouldin Creek Cafe",
    user: created_users[0],
    rating: 4,
    title: "Laid-back and delicious",
    content: "Great coffee, cool crowd, and amazing tofu scramble."
  },
  {
    restaurant: "Moonshine Grill",
    user: created_users[5],
    rating: 5,
    title: "Go for brunch",
    content: "Line gets long but it’s worth it. Shrimp & grits were perfect."
  },
  {
    restaurant: "De Nada Cantina",
    user: created_users[0],
    rating: 5,
    title: "Tacos with a twist",
    content: "Loved the barbacoa and the handmade tortillas. Fun spot with great drinks."
  },
  {
    restaurant: "De Nada Cantina",
    user: created_users[3],
    rating: 4,
    title: "Fresh and flavorful",
    content: "Salsas had real kick. Nice outdoor space too."
  },
  {
    restaurant: "Stubb's Bar-B-Q",
    user: created_users[1],
    rating: 4,
    title: "Sunday gospel brunch is a must",
    content: "Great food with live music and a relaxed crowd."
  },
  {
    restaurant: "Home Slice Pizza",
    user: created_users[1],
    rating: 5,
    title: "Late night go-to",
    content: "Always open when you need it. Pepperoni slice hits every time."
  },
  {
    restaurant: "Home Slice Pizza",
    user: created_users[0],
    rating: 4,
    title: "NY-style done right",
    content: "Perfect crust, gooey cheese. Just like the real thing."
  },
  {
    restaurant: "Home Slice Pizza",
    user: created_users[4],
    rating: 4,
    title: "Crowded but worth it",
    content: "Line moves fast. Grab a slice and eat on the patio."
  },
  {
    restaurant: "Chick-fil-A",
    user: created_users[3],
    rating: 5,
    title: "Dependable favorite",
    content: "Not fancy, but exactly what I expect every visit."
  },
  {
    restaurant: "Chick-fil-A",
    user: created_users[0],
    rating: 5,
    title: "Classic and consistent",
    content: "Chicken sandwich is always good. Fast service too."
  },
  {
    restaurant: "Raising Cane's Chicken Fingers",
    user: created_users[3],
    rating: 5,
    title: "Simple, tasty, consistent",
    content: "The menu is small but every item is a hit."
  },
  {
    restaurant: "Aba Austin",
    user: created_users[5],
    rating: 5,
    title: "Perfect date spot",
    content: "Atmosphere, service, food—all 10/10."
  },
  {
    restaurant: "Aba Austin",
    user: created_users[3],
    rating: 4,
    title: "Upscale Mediterranean",
    content: "Every bite had complex flavors. Cocktails were perfect."
  },
  {
    restaurant: "Caroline",
    user: created_users[5],
    rating: 5,
    title: "Great brunch downtown",
    content: "Cinnamon roll was huge and amazing. Friendly service."
  },
  {
    restaurant: "Caroline",
    user: created_users[6],
    rating: 4,
    title: "Stylish and convenient",
    content: "Food is solid, and location is ideal before a show."
  },
  {
    restaurant: "Matt's El Rancho",
    user: created_users[5],
    rating: 5,
    title: "Crowded for a reason",
    content: "Place is always packed, but the food is worth it."
  },
  {
    restaurant: "Matt's El Rancho",
    user: created_users[2],
    rating: 5,
    title: "Margs are strong!",
    content: "Great food and even better drinks. Family favorite."
  },
  {
    restaurant: "Matt's El Rancho",
    user: created_users[0],
    rating: 4,
    title: "Classic Tex-Mex",
    content: "Enchiladas, margaritas, and chips—everything you want."
  },
  {
    restaurant: "Loro Asian Smokehouse & Bar",
    user: created_users[5],
    rating: 4,
    title: "My favorite patio in Austin",
    content: "Chill atmosphere and standout dishes."
  },
  {
    restaurant: "Loro Asian Smokehouse & Bar",
    user: created_users[2],
    rating: 4,
    title: "Amazing fusion flavors",
    content: "Perfectly balanced dishes with real creativity."
  },
  {
    restaurant: "Franklin Barbecue",
    user: created_users[4],
    rating: 5,
    title: "A BBQ pilgrimage",
    content: "It’s a wait, but you won’t regret it. Unreal ribs."
  },
  {
    restaurant: "Franklin Barbecue",
    user: created_users[1],
    rating: 4,
    title: "Lives up to the hype",
    content: "One bite and you understand the reputation."
  },
  {
    restaurant: "Franklin Barbecue",
    user: created_users[2],
    rating: 4,
    title: "The best brisket. Period.",
    content: "Melt-in-your-mouth meat. Worth waking up early."
  },
  {
    restaurant: "Terry Black's Barbecue",
    user: created_users[3],
    rating: 5,
    title: "No-frills, all flavor",
    content: "The meat does the talking here. Absolutely amazing."
  },
  {
    restaurant: "Terry Black's Barbecue",
    user: created_users[6],
    rating: 5,
    title: "Great for groups",
    content: "Grab a tray and feast. Best mac and cheese in town."
  },
]

reviews_data.each do |review_data|
  restaurant = created_restaurants.find { |r| r.name == review_data[:restaurant] }

  Review.create!(
    restaurant: restaurant,
    user: review_data[:user],
    rating: review_data[:rating],
    title: review_data[:title],
    content: review_data[:content],
    helpful_votes: rand(0..15),
    unhelpful_votes: rand(0..3)
  )
end

puts "Created #{reviews_data.count} reviews"

puts "Creating some tag votes..."
# Add some random tag votes
RestaurantTag.all.each do |restaurant_tag|
  # Randomly select 1-6 users to vote on this tag
  voting_users = created_users.sample(rand(1..6))
  voting_users.each do |user|
    vote_type = rand < 0.8 ? 'up' : 'down' # 80% upvotes, 20% downvotes
    TagVote.create!(
      restaurant_tag: restaurant_tag,
      user: user,
      vote_type: vote_type
    )
  end
end

puts "Created tag votes"

puts "Creating some review votes..."
# Add some random review votes
Review.all.each do |review|
  # Randomly select 1-6 users to vote on this review
  voting_users = created_users.sample(rand(1..6))
  voting_users.each do |user|
    next if user == review.user # Users can't vote on their own reviews

    vote_type = rand < 0.75 ? 'helpful' : 'unhelpful' # 75% helpful, 25% unhelpful
    ReviewVote.create!(
      review: review,
      user: user,
      vote_type: vote_type
    )
  end
end

puts "Created review votes"

puts "\n=== SEED DATA SUMMARY ==="
puts "Users: #{User.count}"
puts "Restaurants: #{Restaurant.count}"
puts "Tags: #{Tag.count}"
puts "Restaurant-Tag associations: #{RestaurantTag.count}"
puts "Reviews: #{Review.count}"
puts "Tag votes: #{TagVote.count}"
puts "Review votes: #{ReviewVote.count}"
puts "\nSeed data creation complete!"
