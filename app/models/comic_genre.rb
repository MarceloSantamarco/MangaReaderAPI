class ComicGenre
  include Mongoid::Document

  belongs_to :genre
  belongs_to :comic
end
