require 'rails_helper'

feature 'Toys' do
  scenario 'index should name the cat that owns each of the toys listed' do
    cat = create_cat
    toy = create_toy(cat)
    visit toys_path
    expect(page).to have_content(cat.name)
  end

  scenario 'show should name the cat that owns that toy' do
    cat = create_cat
    toy = create_toy(cat)
    visit toy_path(toy)
    expect(page).to have_content(cat.name)
  end

  scenario 'new should have a collection select for all Cats' do
    cat1 = create_cat(name: "Awesomekitty")
    cat2 = create_cat
    cat3 = create_cat
    cat4 = create_cat
    visit new_toy_path
    expect(page).to have_content("Awesomekitty")
    expect(page).to have_content(cat2.name)
    expect(page).to have_content(cat3.name)
    expect(page).to have_content(cat4.name)
  end

  scenario 'new should create a new toy and cat ownership and list it on the index' do
    cat = create_cat
    visit new_toy_path
    fill_in "Name", with: "Kitty fishing rod"
    select cat.name, from: :toy_cat_id
    click_on "Create Toy"
    expect(page).to have_content("Kitty fishing rod")
    expect(page).to have_content(cat.name)
  end
end
