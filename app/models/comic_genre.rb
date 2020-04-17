class ComicGenre
  include Mongoid::Document

  belongs_to :genre, dependent: :destroy
  belongs_to :comic, dependent: :destroy
end
