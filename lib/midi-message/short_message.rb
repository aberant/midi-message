#!/usr/bin/env ruby
#
# (c)2011 Ari Russo and licensed under the Apache 2.0 License
#

module MIDIMessage

  # common behavior amongst all Message types
  module ShortMessageBehavior

    attr_reader :name,
                :status,
                :verbose_name
                  
    def initialize_short_message(status_nibble_1, status_nibble_2)
      @status = [status_nibble_1, status_nibble_2]
      group_name = self.class.const_get(:DisplayName)
      group_name_alias = self.class.const_get(:UseConstants) rescue nil
      val = self.send(self.class.const_get(:ConstProp)) rescue @status[1]
      group = Constant[group_name] || (group_name_alias.nil? ? nil : Constant[group_name_alias])
      unless group.nil?
        const = group.find { |k,v| k if v.eql?(val) }
        unless const.nil?
          @name = const.first
          @verbose_name = "#{self.class::DisplayName}: #{const.first}"
        end
      end
    end

    def to_hex_s
      to_a.join
    end
    alias_method :hex, :to_hex_s

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      
      def const(name)
        key = get_display_name
        key = const_get(:UseConstants) rescue key        
        Constant.instance[key.to_s][name.to_s] unless key.nil?
      end

      # this returns a builder for the class, preloaded with the selected const
      def [](const_name)
        c = const(const_name)
        MessageBuilder.new(self, c) unless c.nil?
      end
      
      def get_display_name
        const_get(:DisplayName) rescue nil
      end

      def display_name(name)
        const_set(:DisplayName, name)
      end

      def use_constants(name, options = {})
        for_prop = options[:for]
        const_set(:ConstProp, for_prop) unless for_prop.nil?
        const_set(:UseConstants, name)
      end

    end

  end

  class MessageBuilder

    def initialize(klass, const)
      @const = const
      @klass = klass
    end

    def new(*a)
      a.last.kind_of?(Hash) ? a.last[:const] = @const : a.push(:const => @const)
      @klass.new(*a)
    end

  end
  
  # shortcuts for dealing with message status
  module Status
    
    # this returns the value of the Status constant with the name status_name
    def self.[](status_name)
      Constant.instance["Status"][status_name.to_s]
    end    
    
  end

end