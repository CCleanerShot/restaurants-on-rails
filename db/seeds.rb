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
    email: "sarah@example.com",
    password: "password123",
    first_name: "Sarah",
    last_name: "Wilson",
    username: "sarahw"
  }
]

created_users = users.map do |user_data|
  User.create!(user_data)
end

puts "Created #{created_users.count} users"

puts "Creating restaurants..."
restaurants = [
  {
    name: "Joe's Pizza",
    address: "150 E 14th St, New York, NY 10003",
    latitude: 40.7342,
    longitude: -73.9896,
    phone: "(212) 366-1182",
    website: "https://joespizzanyc.com",
    description: "Classic New York pizza joint serving thin-crust pies since 1975. Famous for their cheese slices and late-night hours."
  },
  {
    name: "Katz's Delicatessen",
    address: "205 E Houston St, New York, NY 10002",
    latitude: 40.7223,
    longitude: -73.9873,
    phone: "(212) 254-2246",
    website: "https://katzsdelicatessen.com",
    description: "Iconic Jewish deli established in 1888. Home of the famous pastrami sandwich and countless movie scenes."
  },
  {
    name: "The Halal Guys",
    address: "307 E 14th St, New York, NY 10003",
    latitude: 40.7318,
    longitude: -73.9851,
    phone: "(212) 260-4870",
    website: "https://thehalalguys.com",
    description: "Famous halal cart turned restaurant. Known for their chicken and rice platters with white and hot sauce."
  },
  {
    name: "Shake Shack",
    address: "691 8th Ave, New York, NY 10036",
    latitude: 40.7580,
    longitude: -73.9855,
    phone: "(646) 435-0135",
    website: "https://shakeshack.com",
    description: "Modern day roadside burger stand serving premium burgers, fries, and shakes made from fresh ingredients."
  },
  {
    name: "Xi'an Famous Foods",
    address: "81 St Marks Pl, New York, NY 10003",
    latitude: 40.7281,
    longitude: -73.9857,
    phone: "(212) 786-2068",
    website: "https://xianfoods.com",
    description: "Hand-pulled noodles and spicy Chinese street food from the Xi'an region. Known for their bold flavors and unique spices."
  },
  {
    name: "Levain Bakery",
    address: "1484 3rd Ave, New York, NY 10028",
    latitude: 40.7766,
    longitude: -73.9542,
    phone: "(212) 874-6080",
    website: "https://levainbakery.com",
    description: "Famous for their 6-ounce warm chocolate chip walnut cookies. A must-visit for cookie lovers."
  }
]

created_restaurants = restaurants.map do |restaurant_data|
  Restaurant.create!(restaurant_data)
end

puts "Created #{created_restaurants.count} restaurants"

puts "Creating tags..."
tag_names = [
  "pizza", "italian", "casual", "late night", "takeout", "delivery",
  "deli", "jewish", "sandwiches", "historic", "pastrami", "traditional",
  "halal", "middle eastern", "street food", "spicy", "rice bowls", "cart food",
  "burgers", "american", "fast casual", "shakes", "fries", "premium",
  "chinese", "noodles", "hand-pulled", "authentic", "spicy", "unique",
  "bakery", "cookies", "dessert", "warm", "sweet", "famous"
]

created_tags = tag_names.map do |tag_name|
  Tag.find_or_create_by_name(tag_name)
end

puts "Created #{created_tags.count} tags"

puts "Creating restaurant-tag associations..."
restaurant_tag_mappings = {
  "Joe's Pizza" => [ "pizza", "italian", "casual", "late night", "takeout", "delivery" ],
  "Katz's Delicatessen" => [ "deli", "jewish", "sandwiches", "historic", "pastrami", "traditional" ],
  "The Halal Guys" => [ "halal", "middle eastern", "street food", "spicy", "rice bowls", "cart food" ],
  "Shake Shack" => [ "burgers", "american", "fast casual", "shakes", "fries", "premium" ],
  "Xi'an Famous Foods" => [ "chinese", "noodles", "hand-pulled", "authentic", "spicy", "unique" ],
  "Levain Bakery" => [ "bakery", "cookies", "dessert", "warm", "sweet", "famous" ]
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
    restaurant: "Joe's Pizza",
    user: created_users[0],
    rating: 5,
    title: "Best pizza in the city!",
    content: "I've been coming here for years and it never disappoints. The cheese slice is perfection - crispy crust, perfect sauce-to-cheese ratio, and always fresh. The late-night hours are a lifesaver too!"
  },
  {
    restaurant: "Joe's Pizza",
    user: created_users[1],
    rating: 4,
    title: "Solid NYC pizza",
    content: "Good classic New York pizza. Nothing fancy, but hits the spot. Can get crowded during lunch hours but the line moves fast."
  },
  {
    restaurant: "Katz's Delicatessen",
    user: created_users[0],
    rating: 5,
    title: "Iconic pastrami sandwich",
    content: "This place is a New York institution! The pastrami sandwich is massive and incredibly flavorful. Yes, it's touristy and expensive, but it's worth experiencing at least once. The atmosphere is authentic old-school deli."
  },
  {
    restaurant: "Katz's Delicatessen",
    user: created_users[2],
    rating: 4,
    title: "Historic and delicious",
    content: "Amazing food and so much history in this place. The pastrami is tender and perfectly seasoned. Just be prepared for crowds and higher prices."
  },
  {
    restaurant: "The Halal Guys",
    user: created_users[1],
    rating: 4,
    title: "Great late-night food",
    content: "Perfect after a night out! The chicken and rice is flavorful and filling. The white sauce is addictive. Portions are generous for the price."
  },
  {
    restaurant: "The Halal Guys",
    user: created_users[3],
    rating: 5,
    title: "Addictive white sauce",
    content: "I dream about this white sauce! The chicken is perfectly seasoned and the rice is fluffy. This place started the halal cart craze for good reason."
  },
  {
    restaurant: "Shake Shack",
    user: created_users[2],
    rating: 4,
    title: "Quality fast food",
    content: "Better than typical fast food chains. The ShackBurger is juicy and the fries are crispy. The shakes are thick and creamy. A bit pricey but worth it for the quality."
  },
  {
    restaurant: "Xi'an Famous Foods",
    user: created_users[0],
    rating: 5,
    title: "Incredible spicy noodles",
    content: "This place opened my eyes to Xi'an cuisine! The hand-pulled noodles are amazing and the spice level is no joke. The cumin lamb noodles are my favorite. Authentic and bold flavors."
  },
  {
    restaurant: "Xi'an Famous Foods",
    user: created_users[3],
    rating: 4,
    title: "Unique and flavorful",
    content: "Different from typical Chinese food in the best way. The noodles have great texture and the spices are complex. Can be very spicy so order accordingly!"
  },
  {
    restaurant: "Levain Bakery",
    user: created_users[1],
    rating: 5,
    title: "Cookie perfection",
    content: "These cookies are life-changing! Crispy on the outside, gooey on the inside, and served warm. The chocolate chip walnut is incredible. Worth every calorie!"
  },
  {
    restaurant: "Levain Bakery",
    user: created_users[2],
    rating: 5,
    title: "Best cookies ever",
    content: "I've never had cookies this good anywhere else. They're huge, warm, and perfectly baked. The dark chocolate peanut butter is my favorite. A must-try!"
  }
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
  # Randomly select 1-3 users to vote on this tag
  voting_users = created_users.sample(rand(1..3))
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
  # Randomly select 1-4 users to vote on this review
  voting_users = created_users.sample(rand(1..4))
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
