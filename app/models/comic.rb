class Comic
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :rate, type: Integer
  field :parental_rate, type: Integer
  field :published_at, type: Date
  field :category_id, type: Integer
  field :genre_id, type: Integer
  field :author_id, type: Integer
  field :comic_file_name, type: String
  field :comic_content_type, type: String
  field :comic_file_size, type: Integer
  field :cover, type: String
  field :comic_path, type: String

  belongs_to :category
  belongs_to :genre
end
