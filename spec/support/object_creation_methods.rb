def create_cat(overrides = {})
  Cat.create!({
    :name => "Fluffy Boots #{rand(1000..9999)}"
  }.merge(overrides))
end

def create_toy(cat)
  Toy.create!(
    name: "Lazer Pointer #{rand(1000..9999)}",
    cat_id: cat.id
  )
end
