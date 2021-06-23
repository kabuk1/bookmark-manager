feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to their list' do
    visit('/bookmarks/add')
    fill_in('url', with: 'https://medium.com')
    fill_in('title', with: 'Medium')
    click_button('Submit')

    expect(page).to have_link('Medium', href: 'https://medium.com')
  end

end