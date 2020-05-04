class Comment
  include Mongoid::Document
  field :text, type: String
  field :created_at, type: Date

  belongs_to :user
  belongs_to :comic

  validates :text, presence: true
end
