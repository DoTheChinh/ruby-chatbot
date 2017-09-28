include Facebook::Messenger

Bot.on :message do |message|
  message.mark_seen
  message.typing_on

  api_ai_response = ApiAi::RequestSender.new(session_id: message.sender['id'], query: message.text).call
  parsed_response = ApiAi::ResponseParser.new(api_ai_response).call
  output = ApiAi::OutputGenerator.new(parsed_response).call
  message.reply(output)
end
