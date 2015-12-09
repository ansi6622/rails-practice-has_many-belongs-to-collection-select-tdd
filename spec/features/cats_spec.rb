require 'rails_helper'

feature 'Cats' do
  scenario 'show page should list the toys that cat owns' do
    cat = create_cat
    toy = create_toy(cat)
    visit cat_path(cat)
    expect(page).to have_content(toy.name)
  end
end
