include Facebook::Messenger

Bot.on :message do |message|
  message.mark_seen
  message.typing_on

  api_ai_response = ApiAi::RequestSender.new(session_id: message.sender['id'], query: message.text).call
  # parsed_response = ApiAi::ResponseParser.new(api_ai_response).call
  # output = ApiAi::OutputGenerator.mnew(parsed_response).call
  # message.reply output

  # if message.text.end_with? '?'
  #   message.typing_on
  #
  #   stack = StackFinder.new message.text
  #   stack.answer
  #
  #   message.reply(
  #     text: stack.answer.present? ? stack.answer[:body] : "Couldn't find any answers for You, sorry :c"
  #   )
  # else
  #   message.reply(text: 'Hi! Ask me some questions please')
  # end
end