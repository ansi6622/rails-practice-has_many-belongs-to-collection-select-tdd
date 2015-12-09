def create_cat
  Cat.create!(:name => 'Fluffy Boots')
end

def create_toy(cat)
  Toy.create!(name: 'Lazer Pointer', cat_id: cat.id)
end
