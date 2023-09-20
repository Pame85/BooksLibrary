require 'sinatra'
require 'sinatra/activerecord'
# require 'Bcyrpt'

require_relative 'models/book'
require_relative 'models/review'
# require_relative 'models/user'


get '/' do
    erb :index
end

post '/add-book' do 
    @book = Book.create(title: params[:title], author: params[:author])

    if @book.save
      redirect "/books"
    else
        erb :index
    end
end

get '/book/:id' do
    @book = Book.find(params[:id])
    if @book
        erb :book
    else
        redirect '/books'
    end
end

get '/books' do
    @books = Book.all
    erb :books
end

get '/book/edit/:id' do
    @book = Book.find(params[:id])
    erb :edit_book
end

post '/update-book/:id' do
    @book = Book.find(params[:id])
    if @book.update(title: params[:title], author: params[:author])
        redirect "/books/#{params[:id]}"
    else
        erb :edit_book
    end
end

# delete '/book/delete/:id' do
#     if @book 
#         @book = Book.destroy
#         redirect '/books'
#     else 
#         redirect '/books'
#     end
# end

