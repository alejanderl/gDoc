require 'test_helper'

class CyclesControllerTest < ActionController::TestCase
  setup do
    @cycle = cycles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cycles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cycle" do
    assert_difference('Cycle.count') do
      post :create, cycle: { description: @cycle.description, end_date: @cycle.end_date, start_date: @cycle.start_date, title: @cycle.title }
    end

    assert_redirected_to cycle_path(assigns(:cycle))
  end

  test "should show cycle" do
    get :show, id: @cycle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cycle
    assert_response :success
  end

  test "should update cycle" do
    put :update, id: @cycle, cycle: { description: @cycle.description, end_date: @cycle.end_date, start_date: @cycle.start_date, title: @cycle.title }
    assert_redirected_to cycle_path(assigns(:cycle))
  end

  test "should destroy cycle" do
    assert_difference('Cycle.count', -1) do
      delete :destroy, id: @cycle
    end

    assert_redirected_to cycles_path
  end
end
