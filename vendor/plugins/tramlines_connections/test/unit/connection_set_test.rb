require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class ConnectionSetTest < ActiveSupport::TestCase
  
  context "an instance on call to connections" do
    
    setup do
      @member = Factory.build(:member)
      @connection_set = ConnectionSet.new(@member)
    end
    
    should "call get_for on it's connection_classes, returning an Array of connections" do
      ConnectionSet.connection_classes = [AConnection, BConnection]
      AConnection.expects(:get_for).with(@member, {}).returns [AConnection.new, AConnection.new]
      BConnection.expects(:get_for).with(@member, {}).returns [BConnection.new]
      assert @connection_set.connections.all? {|connection| connection.is_a?(Connection)}
    end
    
  end
  
end

class AConnection < Connection

  def member
    Factory.build(:member)
  end
  
end

class BConnection < AConnection;end
