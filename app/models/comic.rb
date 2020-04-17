class Comic
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :rate, type: Integer
  field :adult, type: Mongoid::Boolean
  field :cover, type: String
  field :published_at, type: Date

  belongs_to :category
  belongs_to :author

  validates :title, presence: true
  validates :description, presence: true
  validates :adult, presence: true
  validates :published_at, presence: true
end
