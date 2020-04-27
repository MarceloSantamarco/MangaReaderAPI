class Comment
  include Mongoid::Document
  field :text, type: String

  belongs_to :user
  belongs_to :comic
end
