module Lita
  module Handlers
    class Grafana < Handler

      config :url, required: true
      config :api_token, required: true
      #config :api_key, required: true
      #config :s3_bucket, required: true
      #config :s3_secret_access_key, required: true
      #config :s3_prefix, required: true


      route /^graf list(.*)$/i, :grafana, command: false, help: {
        'graf list' => 'hello world'
      }

  def grafana(msg)
    response = http.get('https://google.com') do |request|
      request.headers['Accept'] = 'application/json'
      request.headers['Authorization'] = "Bearer #{config.api_token}"
    end
    msg.reply response.body
  end

      route /^graf db (.*)$/i, :grafana, command: false, help: {
        'graf db graphite-carbon-metrics' => 'hello cats'
      }

      route /^graf search\s?(.*)$/i, :grafana, command: false, help: {
        'graf search cats' => 'you found it'
      }


      Lita.register_handler(self)
    end
  end
end
