class Comic
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :rate, type: Integer
  field :adult, type: Mongoid::Boolean
  field :cover, type: String

  belongs_to :category
  belongs_to :author
end
