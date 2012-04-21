#! /usr/bin/ruby

require 'json'
require 'net/http'
Net::HTTP.version_1_2

class TwitterSearchRequest
  # 検索APIのURL
  SEARCH_API_URL = "search.twitter.com"
  SEARCH_API_PATH = "/search.json?"
  SEARCH_PARAM_LIST = [
    "rpp=100",
    "q="
  ]

  def search(query)
    http = Net::HTTP.new(SEARCH_API_URL, 80)
    search_result = http.start{|http|
      path = SEARCH_API_PATH << SEARCH_PARAM_LIST.join("&")
      req = Net::HTTP::Get.new(path << query)
      res = http.request(req).body
    }
  end
  
  def parse_json_text(json_text)
    json = JSON.parser.new(json_text)
    json.parse()
  end
end
