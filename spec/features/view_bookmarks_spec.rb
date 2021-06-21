feature 'View bookmarks' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'visit bookmarks page to see list of bookmarks' do
    visit('bookmarks')
    expect(page).to have_content('https://dev.to/')
    expect(page).to have_content('https://hackernoon.com/')
    expect(page).to have_content('https://hashnode.com/')
  end
end