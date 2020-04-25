class Comic
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :rate, type: Float
  field :adult, type: Mongoid::Boolean
  field :cover, type: String
  field :published_at, type: Date
  field :status, type: String

  belongs_to :category
  belongs_to :author

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :adult, presence: true
  validates :published_at, presence: true

  after_create do
    self.rate = 0
  end
end
