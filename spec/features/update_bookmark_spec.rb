feature 'Update bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'https://medium.com', title: 'Medium')
    visit('/bookmarks')
    expect(page).to have_link('Medium', href: 'https://medium.com')

    first('.bookmark').click_button('Edit')
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "https://www.loser.com")
    fill_in('title', with: "Loser")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Medium', href: 'https://medium.com')
    expect(page).to have_link('Loser', href: 'https://www.loser.com')
  end

end