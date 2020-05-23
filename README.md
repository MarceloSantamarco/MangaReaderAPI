# MangaReader API
***
The app was built for fun and study, so some pratices or configurations may seem strange 🤷‍♂️

You will need:

 - Rails 6.0.2.1
 - Ruby 2.6.5
 - MongoDB (At localhost:27017)
 - Node.js

After clone the project you need to run:

```
bundle install
rails db:seed
```
### Docker
To run the app using docker:
```
docker-compose build
docker-compose up
```

Run seed inside the container:
```docker-compose run api rails db:seed```

### Endpoints
---
#### Users
Get users:
``` GET /users ```
``` GET /users/:id ```

Create user:
``` POST /users ```
```json
{
	"name": "Example user",
	"email": "example@ex.com",
	"phone": "(11)987876543",
	"birthdate": "04/08/1999",
	"admin": false,
	"password": "123456",
	"password_confirmation": "123456"
}
```
Response:
```json
{
    "_id": {
        "$oid": "5eb0037babd3ae5fd0f63f43"
    },
    "admin": false,
    "birthdate": "1999-08-04",
    "email": "example@ex.com",
    "encrypted_password": "$2a$12$eE/eLAZTVUsunfpYG.P1U.n2YUM2eYi6AH7RxKdMDSqpSaNraJsoK",
    "name": "Example user",
    "phone": "(11)987876543",
    "photo": null
}
````
#### Sessions
New session
``` POST /sessions/create ```
```json
{
	"email": "example@ex.com",
	"password": "123456"
}
```

Response:
```json
{
    "success": "User signed in successfully!",
    "user": {
        "email": "example@ex.com",
        "name": "Example user",
        "token": "eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImV4YW1wbGVAZXguY29tIn0.Ls7jCcBp34tOZyLlkPcn8QR48ZsAgPhrLuCX1WaQjH4"
    }
}
```
#### Authentication
```sh
"bearer eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImV4YW1wbGVAZXguY29tIn0.Ls7jCcBp34tOZyLlkPcn8QR48ZsAgPhrLuCX1WaQjH4"
```
#### Categories, genres and authors
Get all:
``` GET /categories ```
``` GET /categories/:id ```

Create:
``` POST /categories ```

```json
{
    "name": "Comedy"
}
```
Response:
```json
{
    "_id": {
        "$oid": "5eb013edabd3ae764cc2c7c5"
    },
    "name": "Comedy"
}
```
#### Comics
Get all:
```GET \comics```
```GET \comics\:id```

Create:
```POST \comics```

(At author and genre fields, a record with the same name is required)

```json
{
	"title": "Manga example",
	"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
	"adult": 0,
	"cover": "bucket url",
	"published_at": "04/05/2020",
	"status": "Finished",
	"author": "Akira Toryama",
	"category": "5e7d1514abd3ae29f491df79",
	"genres": ["Comedy", "Action"]
}
```

Response:
```json
{
    "_id": {
        "$oid": "5eb01ab1abd3ae764cc2c7c6"
    },
    "adult": false,
    "author_id": {
        "$oid": "5e7ec651abd3ae182854cfeb"
    },    
    "category_id": {
        "$oid": "5e7d1514abd3ae29f491df79"
    },
    "cover": "bucket url",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "published_at": "2020-05-04",
    "rate": 0.0,
    "status": "Finished",
    "title": "Manga example"
}
```
#### Comic/Genre Relation
(Created on comic creation)

Get:
```GET comics/:id/comic_genres```

```json
[
  {
    "_id": {
      "$oid": "5e7d1514abd3ae29f491df80"
    },
    "name": "Comedy"
  },
  {
    "_id": {
      "$oid": "5e7d1514abd3ae29f491df7e"
    },
    "name": "Action"
  }
]
```
#### Favorites
Get user's favorites:
```GET /favorites```

Create:
```POST /favorites```
```json
{
    "comic_id": "5eb01ab1abd3ae764cc2c7c6"
}
```
#### Ratings
(0 to 5 stars)

Get all user's ratings:
```GET /ratings```

Create:
```POST /ratings```
```json
{
    "comic_id": "5e9cb01cabd3ae3984d2bc9d",
    "rate": 2
}
```

Get count of each rate:
```GET /ratings_count```
```json
{
    "comic_id": "5e9cb01cabd3ae3984d2bc9d"
}
```
Response:
```json
{
    "one": 0,
    "two": 1,
    "three": 0,
    "four": 0,
    "five": 0
}
```