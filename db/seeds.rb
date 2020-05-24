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
    Category.find_or_create_by(name: cat)
end

genres.each do |gen|
    Genre.find_or_create_by(name: gen)
end

Author.find_or_create_by(name: 'Sui Ishida')

unless Comic.first.present?
    manga = Comic.create(
        title: 'Tokyo Ghoul',
        description: 'Em Tokyo, criaturas conhecidas como "Ghouls" vivem entre os humanos e os devoram para sobreviver. 
            Alheio a eles, o jovem universitário Ken Kaneki leva uma vida pacata entre livros, até que um trágico encontro o 
            coloca diante desses seres e o obriga a lutar por sua humanidade.',
        adult: 1,
        cover: 'gs://mangareader-a41a3.appspot.com/covers/tokyo_ghoul.jpg',
        published_at: '2014/10/17',
        status: 'Finished',
        author: Author.find_by(name: 'Sui Ishida').id,
        category: Category.find_by(name: 'Manga').id,
        rate: 0.0
    )
    
    ['Psychological', 'Shounen', 'Horror', 'Action'].each do |gen|
        ComicGenre.create(genre_id: Genre.find_by(name: gen).id, comic_id: manga.id)
    end
end
