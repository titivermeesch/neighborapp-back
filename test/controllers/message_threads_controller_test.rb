require 'test_helper'

class MessageThreadsControllerTest < ActionDispatch::IntegrationTest
  test "should not save message_thread with missing thread_owner" do
    message_thread = MessageThread.new(title: 'Building a chair', id_request: 7)
    assert_not message_thread.save, 'Tried to save with missing thread_owner'
  end

  test "should not save message_thread with missing title" do
    message_thread = MessageThread.new(thread_owner: 'test@gmail.com', id_request: 7)
    assert_not message_thread.save, 'Tried to save with missing title'
  end

  test "should not save message_thread with missing id_request" do
    message_thread = MessageThread.new(thread_owner: 'test@gmail.com', title: 'Building a chair')
    assert_not message_thread.save, 'Tried to save with missing id_request'
  end  
end
