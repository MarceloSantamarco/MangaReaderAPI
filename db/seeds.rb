categories = ["Manga", "Web comic", "HQ", "Manhwa"]

genres = [
    "4-koma", "Action", "Adventure", "Comedy", "Crime", "Demons", "Doujinshi","Drama", "Ecchi", "Fantasy",
    "Food", "Gender Bender", "Harem","Historical","Horror","Isekai","Josei","Kids","Magic","Martial Arts",
    "Mecha","Military","Music","Mystery","Mystery/Suspense","One Shot","Parody","Police","Psychological",
    "Romance","School Life","Sci-Fi","Science Fiction","Seinen","Shoujo","Shoujo Ai","Shoujo-ai","Shounen",
    "Shounen Ai","Shounen-ai","Slice of Life","Space","Sports","Super Power","Superhero","Supernatural",
    "Tragedy","Vampire","Vampires", "Webtoons", "Yaoi", "Yuri"
]

categories.each do |cat|
    Category.create(name: cat)
end

genres.each do |gen|
    Genre.create(name: gen)
end