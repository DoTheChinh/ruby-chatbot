class HandleMessageWorker
  include Sidekiq::Worker
  include Facebook::Messenger

  def perform(params)
    api_ai_response = ApiAi::RequestSender.new(params).call
    parsed_response = ApiAi::ResponseParser.new(api_ai_response).call
    output = ApiAi::OutputGenerator.new(parsed_response).call
    Bot.deliver({
                  recipient: {
                    id: parsed_response[:psid]
                  },
                  message: output
                }, access_token: ENV['ACCESS_TOKEN'])
  end
end
