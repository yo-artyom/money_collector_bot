require 'telegram/bot'
require 'unicode'
require 'open-uri'
require 'net/http'
require 'logger'

token = '289589948:AAFUQteT6NOMm6-kMHl51MM5tjGIkBpqDsc'

Telegram::Bot::Client.run(token, logger: Logger.new($stdout)) do |bot|
  chat_id = nil

  bot.listen do |message|
    bot.api.send_message(chat_id: message.chat.id, text: "cron")
    break
  end
end
