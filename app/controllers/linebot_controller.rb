class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'
  require 'wikipedia'
  require 'sinatra'

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
