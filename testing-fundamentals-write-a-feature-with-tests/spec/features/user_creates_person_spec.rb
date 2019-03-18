require 'rails_helper'

feature 'user creates person' do
  scenario 'with valid data' do
    visit new_person_path
    fill_in 'person_first_name', with: 'Bob'
    click_button 'Create Person'

    expect(page).to have_content('Person created')
    expect(page).to have_content('Bob')
  end
end

feature 'user edits existing person' do
  scenario 'with valid data' do
    Person.create(first_name: 'Lionel')
    visit edit_person_path(Person.last)
    fill_in 'person_first_name', with: 'Barack'
    click_button 'Edit Person'

    expect(page).to have_content('Person edited')
    expect(page).to have_content('Barack')
  end
end
