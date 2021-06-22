require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://dev.to');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://hashnode.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://hackernoon.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.freecodecamp.org');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('https://dev.to')
      expect(bookmarks).to include('https://hashnode.com')
      expect(bookmarks).to include('https://hackernoon.com')
      expect(bookmarks).to include('https://www.freecodecamp.org')
    end
  end
end