feature 'Delete bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'https://medium.com', title: 'Medium')
    visit('/bookmarks')
    expect(page).to have_link('Medium', href: 'https://medium.com')

    first('.bookmark').click_button('Delete')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Medium', href: 'https://medium.com')
  end

end