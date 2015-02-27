user = User.create!(username: "olvado")

user.recipes.create!([
    { title: "Penne pasta with courgettes, pinenuts, lemon, chili, garlic and parmesan" },
    { title: "Puy lentils with toasted cumin" },
    { title: "Bife Ana - Marinated steak sandwhich" },
    { title: "Roast sirloin of beef" },
    { title: "Pork tenderloin with mustard, walnuts and creme fraiche" }
  ])

puts User.first.recipes
