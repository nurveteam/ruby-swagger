require 'grape-entity'

class ArrayOfHash < Grape::Entity
  expose(:attributes, documentation: { type: 'Array[Hash]', desc: 'Attributes' })
end
