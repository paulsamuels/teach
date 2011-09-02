require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  
  setup do
    @topic = Topic.new(topics(:one).attributes)
  end
  
  test "display options are initialized to 0" do
    assert_equal 0, @topic.display_options 
  end
  
  test "should not save without title" do
    @topic.title = nil
    assert !@topic.save, "saved the topic without title"
  end
  
  test "should not save without body" do
    @topic.body = nil
    assert !@topic.save, "saved the topic without body"
  end
  
  test "display options are correctly assigned" do
    
    test = [["visible", Topic::VISIBLE], ["active", Topic::ACTIVE], ["root", Topic::ROOT], ["full_screen", Topic::FULL_SCREEN], ["linkable", Topic::LINKABLE]]
    
    test.each do |attribute|
      topic = Topic.new(topics(:one).attributes)
      topic.send("#{attribute[0]}=", "1")
      topic.save
      assert_equal attribute[1], topic.reload.display_options, "#{attribute[0]} should be on"
    end
  end
  
end
