require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models.rb'

before do
    @my_name = 'Red'
    @categories = Category.all
    @memos = Memo.all
end

get '/' do
    erb :index
end

post '/create' do
    Memo.create({
        title: params[:title],
        body: params[:body],
        category_id: params[:category]
    })
    
    redirect '/'
end

get '/category/:id' do
    @categories  =  Category.all
    @category   =  Category.find(params[:id])
    @category_name = @category.name
    @memos         = @category.memos
    erb :index
end

get '/delete/:id' do
    Memo.find(params[:id]).destroy
    redirect '/'
end

get '/edit/:id' do
    @memo = Memo.find(params[:id])
    erb :edit
end

post '/renew/:id' do
    @memo = Memo.find(params[:id])
    @memo.update({
        title: params[:title],
        body: params[:body],
        category_id: params[:category]
    })
    redirect '/'
end