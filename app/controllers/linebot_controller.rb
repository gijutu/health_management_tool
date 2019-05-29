class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'
  require 'wikipedia'

  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      # heroku用環境変数
      # config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      # config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      config.channel_secret = ENV['CHANNEL_SECRET']
      config.channel_token = ENV['CHANNEL_TOKEN']
    }
  end

  def push
    message =
    {
      "type": "text",
      "text": "今日の体調はいかがですか？",
      "quickReply": {
        "items": [
          {
            "type": "action",
            "imageUrl": "https://example.com/sushi.png",
            "action": {
              "type": "message",
              "label": "とても元気",
              "text": "hehe"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/tempura.png",
            "action": {
              "type": "message",
              "label": "元気",
              "text": "tere"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/tempura.png",
            "action": {
              "type": "message",
              "label": "普通",
              "text": "smile"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/tempura.png",
            "action": {
              "type": "message",
              "label": "抑うつ",
              "text": "ase"
            }
          },
          {
            "type": "action",
            "imageUrl": "https://example.com/tempura.png",
            "action": {
              "type": "message",
              "label": "とても抑うつ",
              "text": "cry"
            }
          }
        ]
      }
    }

    client.push_message(ENV['PUSH_TO_ID'], message)
  end

  def morning_push
    message = {
      type: 'text',
      text: 'よく眠れましたか？'
    }
    client.push_message(ENV['PUSH_TO_ID'], message)
  end

  def night_push
    message = {
      type: 'text',
      text: '体調はいかがでしたか？'
    }
    client.push_message(ENV['PUSH_TO_ID'], message)
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    events = client.parse_events_from(body)

    events.each { |event|
      if event.message['text'] =~ /体調/
        text = ["普通", "元気", "抑うつ", "とても元気", "とても抑うつ"]
        response = text.shuffle.first
      else event.message['text'] != nil
        word = event.message['text']

        Wikipedia.Configure{
          domain 'ja.wikipedia.org'
          path   'w/api.php'
         }
        page = Wikipedia.find(word)
        response = page.summary ; "\n"+ page.fullurl
      end

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
    }
    head :ok
  end
end
