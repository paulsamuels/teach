require 'test_helper'

class LinkageTest < ActiveSupport::TestCase
  
  setup do
    @linkage = Linkage.new(linkages(:one).attributes)
  end
  
  test "should not create linkage without topic_id" do
    @linkage.topic_id = nil
    assert !@linkage.save, "linkage created without topic_id"
  end
  
  test "should not create linkage without child_id" do 
    @linkage.child_id = nil
    assert !@linkage.save, "linkage created without child_id"
  end
  
  test "should save successfully when topic_id and child_id are given" do
    assert @linkage.save
  end
  
end
