module Lita
  module Handlers
    class Grafana < Handler

      config :url, required: true
      #config :api_key, required: true
      #config :s3_bucket, required: true
      #config :s3_secret_access_key, required: true
      #config :s3_prefix, required: true


  route /^graf list$/i, :grafana, command: false, help: {
    'graf list' => 'hello world'
  }

  def grafana(msg)
    msg.reply("hello grafana") 
  end
  

      Lita.register_handler(self)
    end
  end
end
