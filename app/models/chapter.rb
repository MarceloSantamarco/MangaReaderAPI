class Chapter
  include Mongoid::Document
  field :title, type: Float
  field :folder, type: String
  field :created_at, type: Date

  belongs_to :comic

  validates :title, presence: true
  validates :folder, presence: true
end
