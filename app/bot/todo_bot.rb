include Facebook::Messenger

Bot.on :message do |message|
  message.mark_seen
  message.typing_on
  HandleMessageWorker.perform_async(session_id: message.sender['id'], query: message.text)
end
