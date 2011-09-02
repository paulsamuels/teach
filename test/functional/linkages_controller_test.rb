require 'test_helper'

class LinkagesControllerTest < ActionController::TestCase
  setup do
    @linkage = linkages(:one)
  end

  test "should get index" do
    get :index, :format => :json
    assert_response :success
    assert_not_nil assigns(:linkages)
  end

  test "should create linkage" do
    parent_topic = topics(:one)
    child_topic  = topics(:two)
    Topic.create(parent_topic.attributes)
    Topic.create(child_topic.attributes)
    
    assert_difference('Linkage.count') do
      request.env["HTTP_REFERER"] = topics_path
      post :create, { :topic_id => parent_topic.to_param, :child_id => child_topic.to_param }
    end

    assert_redirected_to topics_path
  end

  test "should destroy linkage" do
    
    request.env["HTTP_REFERER"] = topics_path
    delete :destroy, :id => @linkage.to_param
    assert !@linkage.reload.active

    assert_redirected_to topics_path
  end
end
