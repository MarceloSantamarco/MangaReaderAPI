class Genre
  include Mongoid::Document
  field :name, type: String
  has_mny :comics
end
