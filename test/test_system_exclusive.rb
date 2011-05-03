#!/usr/bin/env ruby

require 'test_helper'

class SystemExclusiveMessageTest < Test::Unit::TestCase

  include MIDIMessage
  include TestHelper
 
  def test_node
    node = SystemExclusive::Node.new(0x41, 0x42, :device_id => 0x10)
    assert_equal(0x41, node.manufacturer)
    assert_equal(0x42, node.model_id)
    assert_equal(0x10, node.device_id)  
  end
  
  def test_new
    msg = SystemExclusive.new(0xF0, 0x41, 0x10, 0x42, 0x12, 0x40, 0x00, 0x7F, 0x10, 0x41, 0xF7)
    assert_equal(0x41, msg.node.manufacturer)
    assert_equal(0x42, msg.node.model_id)
    assert_equal(0x10, msg.node.device_id)  
    assert_equal([0x40, 0x00, 0x7F], msg.address)
    assert_equal(0x10, msg.data)          
  end
  
  def test_command
    node = SystemExclusive::Node.new(0x41, 0x42, :device_id => 0x10)
    msg = SystemExclusive::Command.new([0x40, 0x7F, 0x00], 0x10, :node => node)
    assert_equal(node, msg.node)
    assert_equal([0x40, 0x7F, 0x00], msg.address)
    assert_equal(0x10, msg.data)      
  end  
  
  def test_request
    node = SystemExclusive::Node.new(0x41, 0x42, :device_id => 0x10)
    msg = SystemExclusive::Request.new([0x40, 0x7F, 0x00], 0x10, :node => node)
    assert_equal(node, msg.node)
    assert_equal([0x40, 0x7F, 0x00], msg.address)
    assert_equal(0x10, msg.size)
  end  
  
  def test_node_oriented
    node = SystemExclusive::Node.new(0x41, 0x42, :device_id => 0x10)
    msg = node.request([0x40, 0x7F, 0x00], 0x10)
    assert_equal(node, msg.node)
    assert_equal([0x40, 0x7F, 0x00], msg.address)
    assert_equal(0x10, msg.size)    
  end
  
  def test_prototype
    prototype = SystemExclusive::Request.new([0x40, 0x7F, 0x00], 0x10)
    node = SystemExclusive::Node.new(0x41, 0x42, :device_id => 0x10)
    msg = node.new_message_from(prototype)
    assert_equal(node, msg.node)
    assert_equal(prototype.address, msg.address)
    assert_equal(prototype.size, msg.size)
  end        
  
  def test_checksum    
    node = SystemExclusive::Node.new(0x41, 0x42, :device_id => 0x10)
    msg = SystemExclusive::Command.new([0x40, 0x00, 0x7F], 0x00, :node => node)
    assert_equal(0x41, msg.checksum)
  end
  
  def test_to_a
    node = SystemExclusive::Node.new(0x41, 0x42, :device_id => 0x10)
    msg = SystemExclusive::Command.new([0x40, 0x00, 0x7F], 0x00, :node => node)
    assert_equal([0xF0, 0x41, 0x10, 0x42, 0x12, 0x40, 0x00, 0x7F, 0x00, 0x41, 0xF7], msg.to_bytes)
  end
  
  def test_to_s
    node = SystemExclusive::Node.new(0x41, 0x42, :device_id => 0x10)
    msg = SystemExclusive::Command.new([0x40, 0x00, 0x7F], 0x00, :node => node)
    assert_equal("F04110421240007F0041F7", msg.to_bytestr)
  end
   
end