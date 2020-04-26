class Rate
  include Mongoid::Document

  field :rate, type: Float

  belongs_to :user
  belongs_to :comic

  after_create do
    comic = Comic.find(self.comic_id)

    ratings = Rate.where(comic_id: comic.id).map(&:rate)

    comic.rate = ratings.sum()/ratings.length

    comic.save!
  end

end
