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
    person = Person.create(first_name: 'Lionel')

    update_person(person: person, first_name: 'Barack')

    expect(page).to have_content('Person edited')
    expect(page).to have_content('Barack')
  end

  scenario 'with invalid data' do
    person = Person.create(first_name: 'Lionel')

    update_person(person: person, first_name: '')

    expect(page).to have_content("First name can't be blank")
  end

  def update_person(person:, first_name:)
    visit person_path(person)
    click_link 'Edit'
    fill_in 'person_first_name', with: first_name
    click_button 'Update'
  end
end
