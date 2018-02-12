require 'rest-client'
require 'json'

def rest_call(opt = {})
  puts opt
  RestClient::Request.execute(opt) do |response, _request, _result|
    response
  end
end

response = rest_call(headers: {"Authorization" => "token #{ARGV[0]}",
                               content_type: :json},
                     payload: {'commit_title' => "Merge pull request"}.to_json,
                     method: :put,
                     url: ARGV[1])

data = JSON.parse(response.body)

if data["merged"]
  puts "#{data['message']} with sha #{data['sha']}"
else
  raise data["message"]
end
