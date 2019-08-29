require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should not save message with missing thread_id" do
    message = Message.new(message_author: 'test@gmail.com', date: '12-08-2019', content: 'this is my message')
    assert_not message.save, 'Tried to save with missing thread_id'
  end

  test "should not save message with missing message_author" do
    message = Message.new(thread_id: 8, date: '12-08-2019', content: 'this is my message')
    assert_not message.save, 'Tried to save with missing message_author'
  end

  test "should not save message with missing date" do
    message = Message.new(thread_id: 8, message_author: 'test@gmail.com', content: 'this is my message')
    assert_not message.save, 'Tried to save with missing date'
  end

  test "should not save message with missing content" do
    message = Message.new(thread_id: 8, message_author: 'test@gmail.com', date: '12-08-2019')
    assert_not message.save, 'Tried to save with missing content'
  end

  test "should not save message with too long content" do
    message = Message.new(thread_id: 8, message_author: 'test@gmail.com', date: '12-08-2019', content: 'this is my messagemessmessagemessagemessagemessagemessageagemessagemessagemessagemessagemessagemessagemmessagemessagemessagmessagemessagemessagemessageemessagemessageessagemessagemessage')
    assert_not message.save, 'Tried to save with too long content'
  end
end 