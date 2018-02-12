require 'rest-client'
require 'json'


def rest_call(opt = {})
  opt[:method] ||= :get
  opt[:url] ||= ARGV[1]
  RestClient::Request.execute(opt)
end

response = rest_call(headers: {"Authorization" => "token #{ARGV[0]}"},
                     payload: {commit_title: "Merge pull request"},
                     method: :put)

data = JSON.parse(response.body)

if data["merged"]
  puts "#{data['message']} with sha #{data['sha']}"
else
  raise StandardError, data["message"]
end
