class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :encrypted_password, type: String
  field :phone, type: String
  field :birthdate, type: Date
end
