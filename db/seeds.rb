author = User.create!(username: "topchef" )
user   = User.create!(username: "olvado" )

author.recipes.create!([
    { title: "Penne pasta with courgettes, pinenuts, lemon, chili, garlic and parmesan" },
    { title: "Puy lentils with toasted cumin" },
    { title: "Bife Ana - Marinated steak sandwhich" },
    { title: "Roast sirloin of beef" }
  ])

user.recipes.create!(title: "Pork tenderloin with mustard, walnuts and creme fraiche")

user.favourite_recipes.create!([
    { recipe_id: author.recipes[2].id },
    { recipe_id: author.recipes[1].id },
    { recipe_id: author.recipes[0].id }
  ])

puts "AUTHOR: #{author}"
puts "recipes:"
puts User.first.recipes
puts "USER: #{user}"
puts "recipes:"
puts User.last.recipes
puts "favourites:"
puts User.last.favourites
puts "ALL RECIPES:"
puts Recipe.all


