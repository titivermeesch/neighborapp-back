require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should not save user with missing firstname" do
    user = User.new(email: 'ha@gmail.com', username: 'PlayBossWar', address: 'Rue Haute', idcard: '/path/to/image', lastname: 'Vermeesch')
    assert_not user.save, 'Tried to save with missing firstname'
  end

  test "should not save user with missing email" do
    user = User.new(username: 'PlayBossWar', address: 'Rue Haute', idcard: '/path/to/image', firstname: 'Tristan', lastname: 'Vermeesch')
    assert_not user.save, 'Tried to save with missing email'
  end

  test "should not save user with missing username" do
    user = User.new(email: 'ha@gmail.com', address: 'Rue Haute', idcard: '/path/to/image', firstname: 'Tristan', lastname: 'Vermeesch')
    assert_not user.save, 'Tried to save with missing username'
  end

  test "should not save user with missing address" do
    user = User.new(email: 'ha@gmail.com', username: 'PlayBossWar', idcard: '/path/to/image', firstname: 'Tristan', lastname: 'Vermeesch')
    assert_not user.save, 'Tried to save with missing address'
  end

  test "should not save user with missing idcard" do
    user = User.new(email: 'ha@gmail.com', username: 'PlayBossWar', address: 'Rue Haute', firstname: 'Tristan', lastname: 'Vermeesch')
    assert_not user.save, 'Tried to save with missing idcard'
  end

  test "should not save user with missing lastname" do
    user = User.new(email: 'ha@gmail.com', username: 'PlayBossWar', address: 'Rue Haute', idcard: '/path/to/image', firstname: 'Tristan')
    assert_not user.save, 'Tried to save with missing lastname'
  end
end
