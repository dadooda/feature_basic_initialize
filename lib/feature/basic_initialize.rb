
module Feature
  # Provide a basic initializer for a class.
  #
  #   require "feature/basic_initialize"
  #
  #   class Person
  #     Feature::BasicInitialize.load(self)
  #
  #     attr_accessor :name, :age
  #
  #     def self.defaults
  #       {likes_coffee: true}
  #     end
  #   end
  #
  #   Person.new(name: "Joe", age: 29)
  #
  # @see InstanceMethods#initialize
  module BasicInitialize
    def self.load(owner)
      return if owner < InstanceMethods
      owner.send(:include, InstanceMethods)
    end

    module InstanceMethods
      # See source for details.
      def initialize(attrs = {})
        # Validate `attrs` with a meaningful exception. Otherwise confusion is possible at `MyKlass.new(obj)`.
        [attrs, Hash].tap {|v, klass| v.is_a?(klass) or raise ArgumentError, "#{klass} expected, #{v.class} given: #{v.inspect}"}

        # Handle defaults.
        defaults = self.class.respond_to?(:defaults) ? self.class.defaults : {}

        defaults.merge(attrs).each {|k, v| public_send("#{k}=", v)}
      end
    end
  end
end
