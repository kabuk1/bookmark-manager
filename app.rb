require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader 
  end
  register Sinatra::Flash

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do   
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/bookmarks/add' do
    erb :"bookmarks/add"
  end

  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params[:url], title: params[:title])
    else
      flash[:notice] = "Must use a valid URL."
    end

    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end


  run! if app_file == $0
end