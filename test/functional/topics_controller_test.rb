require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create topic" do
    assert_difference('Topic.count') do
      post :create, :topic => @topic.attributes
    end

    assert_redirected_to topic_path(assigns(:topic))
  end

  test "should show topic" do
    get :show, :id => @topic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @topic.to_param
    assert_response :success
  end

  test "should update topic" do
    put :update, :id => @topic.to_param, :topic => @topic.attributes
    assert_redirected_to topic_path(assigns(:topic))
  end

  test "should destroy topic" do
    delete :destroy, :id => @topic.to_param
    assert_equal 0, @topic.reload.active & Topic::ACTIVE, "topic was active when destroyed"

    assert_redirected_to topics_path
  end
end
