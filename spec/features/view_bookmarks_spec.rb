feature 'View bookmarks' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'visit bookmarks page to see list of bookmarks' do
    Bookmark.create(url: 'https://dev.to', title: 'Devto')
    Bookmark.create(url: 'https://hashnode.com', title: 'Hashnode')
    Bookmark.create(url: 'https://hackernoon.com', title: 'Hackernoon')
    Bookmark.create(url: 'https://www.freecodecamp.org', title: 'freeCodeCamp')

    visit('/bookmarks')
    expect(page).to have_link('Devto', href: 'https://dev.to')
    expect(page).to have_link('Hashnode', href: 'https://hashnode.com')
    expect(page).to have_link('Hackernoon', href: 'https://hackernoon.com')
    expect(page).to have_link('freeCodeCamp', href: 'https://www.freecodecamp.org')
  end

end