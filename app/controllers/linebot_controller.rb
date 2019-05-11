class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'
  require 'wikipedia'

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    events.each { |event|
      if event.message['text'] =~ /体調/
        message[:text] =
          ["普通", "元気", "抑うつ", "とても元気", "とても抑うつ"].all
      end

      response = text

      if event.message['text'] != nil
        word = event.message['text']

        Wikipedia.Configure{
          domain 'ja.wikipedia.org'
          path   'w/api.php'
         }
      end

      page = Wikipedia.find(word)

      response = page.summary ; "\n"+ page.fullurl

<<<<<<< HEAD
      # case event
      # when Line::Bot::Event::Message
      #   case event.type
      #   when Line::Bot::Event::MessageType::Text
      #     message = {
      #       type: 'text',
      #       text: response
      #     }
      #     client.reply_message(event['replyToken'], message)
      #   end
      # end
=======
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            text: response
          }
          client.reply_message(event['replyToken'], message)
        end
      end
>>>>>>> 8c500c417378b76efc4e5059fa479e63b392ae62
    }

    head :ok
  end
end
