class MostRead
  include Mongoid::Document
  belongs_to :comic
  belongs_to :user
end
  