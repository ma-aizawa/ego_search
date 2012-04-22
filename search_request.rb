#! /usr/bin/ruby

require 'json'
require 'net/http'
Net::HTTP.version_1_2

class TwitterSearchRequest
  # 検索APIのURL
  SEARCH_API_URL = "search.twitter.com"
  SEARCH_API_PATH = "/search.json"
  SEARCH_PARAM_LIST = [
    "rpp=100",
    "since_id=0",
    "q="
  ]

  @http
  @path

  def get_path()
    @path
  end

  def search(query)
    @http = Net::HTTP.new(SEARCH_API_URL, 80)
    path = SEARCH_API_PATH + "?" << SEARCH_PARAM_LIST.join("&") << query
    @path = path
    refresh_url_result = get_response(path)
    parse_json_text(refresh_url_result)
    #new_path = parse_json_text(refresh_url_result)["refresh_url"]
=begin
    path = SEARCH_API_PATH + new_path

    @path = path

    parse_json_text(get_response(path))
=end
  end

  def get_response(path)
    @http.start{|http|
      req = Net::HTTP::Get.new(path)
      res = http.request(req).body
    }
  end
  
  def parse_json_text(json_text)
    json = JSON.parser.new(json_text)
    json.parse()
  end
end
