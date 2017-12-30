require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  let(:one) { messages :one }

  it 'gets index' do
    get messages_url
    value(response).must_be :success?
  end

  it 'creates message' do
    expect {
      post messages_url, params: { message: { content: message.content, originator: message.originator, recipient: message.recipient, status: message.status } }
    }.must_change "Message.count"

    value(response.status).must_equal 201
  end

  it 'destroys message' do
    expect {
      delete message_url(message)
    }.must_change "Message.count", -1

    value(response.status).must_equal 204
  end
end
