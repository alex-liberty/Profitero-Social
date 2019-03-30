json.partial! "cards/card", card: @card

json.extract! @message, :id, :username, :message
json.url chat_url(@message, format: :json)