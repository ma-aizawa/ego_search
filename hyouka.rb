#! /usr/bin/ruby
# encoding: utf-8

require 'sinatra'
require 'uri'
require 'sass'
require './search_request'

get '/' do
  haml :index
end

post '/' do
  haml :index
end

before do
  if request.path_info == '/search' && 
    (params["search_word"].nil? || 
    params["search_word"].strip.length == 0)
    @msg = "検索ワードを入力してください。"
    request.path_info = '/'
  end
end

post '/search' do
  query = URI.encode(params["search_word"])
  @search_request = TwitterSearchRequest.new
  @result = @search_request.search(query)["results"]

  @query_string = params["search_word"] #<< @search_request.get_path

  haml :list
end

get '/*.css' do |path|
  content_type 'text/css'
  sass :layout
end
