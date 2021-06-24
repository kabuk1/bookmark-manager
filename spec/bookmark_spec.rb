require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      bookmark = Bookmark.create(url: 'https://dev.to', title: 'Devto' )
      Bookmark.create(url: 'https://hashnode.com', title: 'Hashnode')
      Bookmark.create(url: 'https://hackernoon.com', title: 'Hackernoon')
      Bookmark.create(url: 'https://www.freecodecamp.org', title: 'freeCodeCamp')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 4
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Devto'
      expect(bookmarks.first.url).to eq 'https://dev.to'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'https://medium.com', title: 'Medium')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Medium'
      expect(bookmark.url).to eq 'https://medium.com'
    end
  end

  describe '.delete' do
    scenario 'deltes the given bookmark' do
      bookmark = Bookmark.create(url: 'https://medium.com', title: 'Medium')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end

  end

  describe '.update' do
    it 'updates the bookmark' do
      bookmark = Bookmark.create(title: 'Medium', url: 'https://medium.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'https://loser.com', title: 'Loser')
  
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Loser'
      expect(updated_bookmark.url).to eq 'https://loser.com'
    end

  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Medium', url: 'https://medium.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Medium'
      expect(result.url).to eq 'https://medium.com'
    end

  end

end