require 'ruby-swagger/object'
require 'ruby-swagger/data/reference'

module Swagger::Data
  class Schema < Swagger::Object #https://github.com/swagger-api/swagger-spec/blob/master/versions/2.0.md#schemaObject

    attr_swagger :format, :title, :description, :default,
                 :multipleOf, :maximum, :exclusiveMaximum, :minimum,
                 :exclusiveMinimum, :maxLength, :minLength,
                 :pattern, :maxItems, :minItems, :uniqueItems, :maxProperties,
                 :minProperties, :required, :enum, :type, :items, :allOf,
                 :properties, :additionalProperties

    @ref = nil

    def self.parse(schema)
      return nil if schema.nil?

      sc = Swagger::Data::Schema.new.bulk_set(schema)
      sc.ref= schema['$ref']
      sc
    end

    def ref=(new_ref)
      return nil unless new_ref

      @ref = new_ref
    end

    def as_swagger
      res = super
      res['$ref'] = @ref if @ref
      res
    end

  end
end