#! /usr/bin/ruby

require 'sinatra'
require 'uri'
require './search_request'

get '/' do
  haml :index
end

post '/search' do
  query = URI.encode(params["search_word"])
  @search_request = TwitterSearchRequest.new
  result_text = @search_request.search(query)
  @result = @search_request.parse_json_text(result_text)["results"]

  @query_string = params["search_word"]

  haml :list
end
