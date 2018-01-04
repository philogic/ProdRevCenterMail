require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @message = messages(:one)
    @client = clients(:product_review_center)
    @token = JWT.encode({user: @client.id}, Rails.application.secrets.secret_key_base)
  end
  
  it 'gets index' do
    Client.stub(:find, @client) do
      get messages_url, as: :json
      get messages_url, headers: {HTTP_AUTHORIZATION: @token}, as: :query
    end
    value(response).must_be :success?
  end

  it 'creates message' do
    Client.stub(:find, @client) do
      expect {
        post messages_url, params: { message: { content: @message.content, originator: @message.originator,
                                                recipient: @message.recipient,
                                                status: @message.status } },
             headers: { HTTP_AUTHORIZATION: @token }, as: :json
      }.must_change 'Message.count'
    end


    value(response.status).must_equal 201
  end

  it 'destroys message' do
    Client.stub(:find, @client) do
      expect {
        delete message_url(@message),
               headers: { HTTP_AUTHORIZATION: @token }, as: :json
      }.must_change "Message.count", -1
    end


    value(response.status).must_equal 204
  end
end
