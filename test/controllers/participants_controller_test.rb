require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should not save participant with missing user_id" do
    participant = Participant.new(id_request: 2)
    assert_not participant.save, 'Tried to save with missing user_id'
  end

  test "should not save participant with missing id_request" do
    participant = Participant.new(user_id: 2)
    assert_not participant.save, 'Tried to save with missing id_request'
  end
end
