include Facebook::Messenger

Bot.on :message do |message|
  message.mark_seen
  if message.text.end_with? '?'
    message.typing_on

    stack = StackFinder.new message.text
    stack.find_answer

    message.reply(
      text: stack.answer.present? ? stack.answer[:body] : "Couldn't find any answers for You, sorry :c"
    )
  else
    message.reply(text: 'Hi! Ask me some questions please')
  end
end