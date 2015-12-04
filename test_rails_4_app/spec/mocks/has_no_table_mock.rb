require 'active_mocker/mock'

class HasNoTableMock < ActiveMocker::Mock::Base
  created_with('2.0.0.beta1')

# _modules_constants.erb
#_class_methods.erb
  class << self
    def attributes
      @attributes ||= HashWithIndifferentAccess.new({"id"=>nil}).merge(super)
    end

    def types
      @types ||= ActiveMocker::Mock::HashProcess.new({ id: Fixnum }, method(:build_type)).merge(super)
    end

    def associations
      @associations ||= {}.merge(super)
    end

    def associations_by_class
      @associations_by_class ||= {}.merge(super)
    end

    def mocked_class
      "HasNoTable"
    end

    private :mocked_class

    def attribute_names
      @attribute_names ||= ["id"] | super
    end

    def primary_key
      "id"
    end

    def abstract_class?
      true
    end

    def table_name
      nil || super
    end

  end
# _attributes.erb
  def id
    read_attribute(:id)
  end

  def id=(val)
    write_attribute(:id, val)
  end
# _associations.erb



# _scopes.erb
  module Scopes
    include ActiveMocker::Mock::Base::Scopes

  end

  extend Scopes

  class ScopeRelation < ActiveMocker::Mock::Association
    include HasNoTableMock::Scopes
  end

  def self.__new_relation__(collection)
    HasNoTableMock::ScopeRelation.new(collection)
  end

  private_class_method :__new_relation__
end
