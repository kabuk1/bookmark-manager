feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to their list' do
    visit('/bookmarks/add')
    fill_in('url', with: 'https://medium.com')
    click_button('Submit')

    expect(page).to have_content('https://medium.com')
  end

end