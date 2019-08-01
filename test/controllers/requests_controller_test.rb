require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should not save request with missing user_id" do
    request = Request.new(request_type: 'normal', description: 'My description', date: '12-08-2019', required_people: 4, x: 49.578, y: 41.367, status: 'open', 
    title: 'Building a chair')
    assert_not request.save, 'Tried to save with missing user_id'
  end

  test "should not save request with missing request_type" do
    request = Request.new(user_id:1, description: 'My description', date: '12-08-2019', required_people: 4, x: 49.578, y: 41.367, status: 'open', 
    title: 'Building a chair')
    assert_not request.save, 'Tried to save with missing request_type'
  end

  test "should not save request with missing description" do
    request = Request.new(user_id:1, request_type: 'normal', date: '12-08-2019', required_people: 4, x: 49.578, y: 41.367, status: 'open', 
    title: 'Building a chair')
    assert_not request.save, 'Tried to save with missing description'
  end

  test "should not save request with missing date" do
    request = Request.new(user_id:1, request_type: 'normal', description: 'My description', required_people: 4, x: 49.578, y: 41.367, status: 'open', 
    title: 'Building a chair')
    assert_not request.save, 'Tried to save with missing date'
  end

  test "should not save request with missing required_people" do
    request = Request.new(user_id:1, request_type: 'normal', description: 'My description', date: '12-08-2019', x: 49.578, y: 41.367, status: 'open', 
    title: 'Building a chair')
    assert_not request.save, 'Tried to save with missing required_people'
  end

  test "should not save request with missing x" do
    request = Request.new(user_id:1, request_type: 'normal', description: 'My description', date: '12-08-2019', required_people: 4, y: 41.367, status: 'open', 
    title: 'Building a chair')
    assert_not request.save, 'Tried to save with missing x'
  end

  test "should not save request with missing y" do
    request = Request.new(user_id:1, request_type: 'normal', description: 'My description', date: '12-08-2019', required_people: 4, x: 49.578, status: 'open', 
    title: 'Building a chair')
    assert_not request.save, 'Tried to save with missing y'
  end

  test "should not save request with missing status" do
    request = Request.new(user_id:1, request_type: 'normal', description: 'My description', date: '12-08-2019', required_people: 4, x: 49.578, y: 41.367,
    title: 'Building a chair')
    assert_not request.save, 'Tried to save with missing status'
  end

  test "should not save request with missing title" do
    request = Request.new(user_id:1, request_type: 'normal', description: 'My description', date: '12-08-2019', required_people: 4, x: 49.578, y: 41.367, status: 'open')
    assert_not request.save, 'Tried to save with missing title'
  end
end