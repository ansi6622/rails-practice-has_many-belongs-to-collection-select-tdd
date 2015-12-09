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
end
