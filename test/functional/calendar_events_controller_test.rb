require 'test_helper'

class CalendarEventsControllerTest < ActionController::TestCase
  setup do
    @calendar_event = calendar_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendar_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendar_event" do
    assert_difference('CalendarEvent.count') do
      post :create, calendar_event: { name: @calendar_event.name, when: @calendar_event.when }
    end

    assert_redirected_to calendar_event_path(assigns(:calendar_event))
  end

  test "should show calendar_event" do
    get :show, id: @calendar_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calendar_event
    assert_response :success
  end

  test "should update calendar_event" do
    put :update, id: @calendar_event, calendar_event: { name: @calendar_event.name, when: @calendar_event.when }
    assert_redirected_to calendar_event_path(assigns(:calendar_event))
  end

  test "should destroy calendar_event" do
    assert_difference('CalendarEvent.count', -1) do
      delete :destroy, id: @calendar_event
    end

    assert_redirected_to calendar_events_path
  end
end
