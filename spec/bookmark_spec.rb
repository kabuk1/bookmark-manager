require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include('https://dev.to/')
      expect(bookmarks).to include('https://hashnode.com/')
      expect(bookmarks).to include('https://hackernoon.com/')
    end
  end
end