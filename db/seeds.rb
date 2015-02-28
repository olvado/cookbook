user = User.create!(username: "olvado")

user.recipes.create!([
    { title: "Penne pasta with courgettes, pinenuts, lemon, chili, garlic and parmesan" },
    { title: "Puy lentils with toasted cumin" },
    { title: "Bife Ana - Marinated steak sandwhich" },
    { title: "Roast sirloin of beef" },
    { title: "Pork tenderloin with mustard, walnuts and creme fraiche" }
  ])

FavouriteRecipe.create!([
    { user_id: user.id, recipe_id: user.recipes[2].id },
    { user_id: user.id, recipe_id: user.recipes[1].id },
    { user_id: user.id, recipe_id: user.recipes[0].id }
  ])

puts User.first.favourites
