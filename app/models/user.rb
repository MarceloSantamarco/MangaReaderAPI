class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :encrypted_password, type: String
  field :phone, type: String
  field :birthdate, type: Date
  field :admin, type: Boolean
  field :photo, type: String

  has_many :favorites
  has_many :rates
  has_many :comments
end
