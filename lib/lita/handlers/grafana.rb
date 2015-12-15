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
    msg.reply("hello grafana")
  end

      route /^graf db (.*)$/i, :grafana, command: false, help: {
        'graf db graphite-carbon-metrics' => 'hello cats'
      }

      route /^graf search (.*)$/i, :grafana, command: false, help: {
        'graf search cats' => 'you found it'
      }


      Lita.register_handler(self)
    end
  end
end
