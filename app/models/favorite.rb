class Favorite
  include Mongoid::Document
  belongs_to :user
end
