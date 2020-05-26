class Comic
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :rate, type: Float
  field :adult, type: Mongoid::Boolean
  field :cover, type: String
  field :published_at, type: Date
  field :status, type: Mongoid::Boolean

  belongs_to :category
  belongs_to :author

  has_many :comments
  has_many :rates
  has_many :comic_genres
  has_many :chapters

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :adult, presence: true
  validates :published_at, presence: true

end
