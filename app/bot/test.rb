include Facebook::Messenger

Bot.on :message do |message|
  message.mark_seen
  if message.text.include? 'gif'
    message.typing_on
    message.reply(
      attachment: {
        type: 'image',
        payload: {
          url: GifFinder.new.gif_by_tag
        }
      }
    )
  else
    message.reply(text: 'Hello!')
  end
end