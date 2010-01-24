require File.join(File.dirname(__FILE__), '..', 'test_helper')

class AttachedDeviceTest < Test::Unit::TestCase
  setup do
    @data = {
      :"foo controller-0-0" => "foomedium",
      :"foo controller-imageuuid-0-0" => "322f79fd-7da6-416f-a16f-e70066ccf165",
      :"foo controller-1-0" => "barmedium"
    }
    
    @caller = mock("caller")
    @caller.stubs(:name).returns("Foo Controller")
  end
  
  context "populating relationships" do
    setup do
      @value = VirtualBox::AttachedDevice.populate_relationship(@caller, @data)
    end
    
    should "create the correct amount of objects" do
      assert_equal 2, @value.length
    end
    
    should "create objects with proper values" do
      obj = @value[0]
      assert_equal "foomedium", obj.medium
      assert_equal "322f79fd-7da6-416f-a16f-e70066ccf165", obj.uuid
      assert_equal 0, obj.port
      
      obj = @value[1]
      assert_equal "barmedium", obj.medium
      assert_nil obj.uuid
      assert_equal 1, obj.port
    end
  end
end