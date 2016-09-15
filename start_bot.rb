require 'telegram/bot'
require 'unicode'
require 'open-uri'
require 'net/http'
require 'logger'

token = '243969893:AAGCpcJogTnTHB80uUjasgHAdFscM7dl8J8'


class Message

  @debtor= "@temasrkn"
  @count = "1137 рублей"

  def self.hello_message
    "#{@debtor}\n Добрый день должник. Ваш долг составляет #{@count}, в случае невыплаты вас ожидает наказание.\n Чтобы узнать отстаток долга отправьте мне команду /debt"
  end

  def self.menace_message
    composite_message = "#{@debtor}\nEсли не вернешь долг в размере #{@count}, то"
    menaces = [' я приду к тебе домой и убью твою собаку', 'его будут возвращать выжившие члены твоей семьи', 'я буду последовательно отрезать по одной фаланге с твоей руки',
    'с тобой может случиться непредвиденное насилие', 'пожар в твоем доме тушить сам будешь',]

    "#{composite_message} #{menaces.sample}"
  end

  def self.debt_message
   "#{@debtor}\nВаш долг составляет #{@count}."
  end

end


Telegram::Bot::Client.run(token, logger: Logger.new($stdout)) do |bot|
  puts Message.menace_message
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.sendMessage(chat_id:  message.chat.id, text: Message.hello_message)
    when '/debt'
      bot.api.sendMessage(chat_id:  message.chat.id, text: Message.debt_message)
    else
      bot.api.sendMessage(chat_id:  message.chat.id, text: Message.menace_message)
    end
  end
end
