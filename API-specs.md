# Divebook REST API Specs

Ruby version is 2.2.0 <br />
Ruby on Rails version is 4.2.0

API code should be namespaced to `Api::V1` <br />
API URIs should be namespaced to `/api/v1/`

## Table of Contents

- Users
    - [Authentication](#authentication)
    - [Get User](#get-user)
    - [Update User](#update-user)
    - [Delete User](#delete-user)
    - [Users by Dive Site](#users-by-dive-site)

- Dive Sites
    - [All Dive Sites](#all-dive-sites)
    - [Add Dive Site](#add-dive-site)
    - [Get Dive Site](#get-dive-site)
    - [Update Dive Site](#update-dive-site)
    - [Delete Dive Site](#delete-dive-site)
    - [Dive Sites by User](#dive-sites-by-user)

- Dives
    - [Add Dive](#add-dive)
    - [Get Dive](#get-dive)
    - [Update Dive](#update-dive)
    - [Delete Dive](#delete-dive)
    - [Dives by User](#dives-by-user)
    - [Dives by Dive Site](#dives-by-dive-site)

- Images
    - [Add Image](#add-image)
    - [Get Image](#get-image)
    - [Update Image](#update-image)
    - [Delete Image](#delete-image)
    - [Images by Dive](#images-by-dive)
    - [Images by Dive Site](#images-by-dive-site)
    - [Images by User](#images-by-user)

- [Pagination](#pagination)


***

## Users
### Authentication

`POST https://divebook.herokuapp.com/api/v1/auth`

#### Parameters

- **name**
- **email** _(required)_
- **password** _(required)_

#### Response

Status code: `201 Created` <br/>
The created User object.

```json
{
  "id": 1,
  "name": "User Name",
  "email": "user@example.com",
  "access_token": "y786wY4Q-bVyYFFNm5QA"
}
```

#### Errors

- **422 Unprocessable Entity** — The system had trouble saving the User.

***

### Get User

`GET https://divebook.herokuapp.com/api/users/:id`

#### Parameters

- **id** *(required)* — ID of the user.
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
The User object.

```json
{
  "id": 1,
  "name": "Naoise Golden"
}
```

#### Errors

- **404 Not Found** — User with the specified ID does not exist.

***

### Update User

`PUT https://divebook.herokuapp.com/api/users/:id`

#### Parameters

- **id** *(required)* — ID of the user.
- **access_token** *(required)*
- **name**
- **email**

#### Response

Status code: `200 OK` <br/>
The updated User object.

```json
{
  "id": 1,
  "name": "Naoise Golden"
}
```

#### Errors

- **404 Not Found** — User with the specified ID does not exist.
- **422 Unprocessable Entity** — The system had trouble updating the User.

***

### Delete User

`DELETE https://divebook.herokuapp.com/api/users/:id`

#### Parameters

- **id** *(required)* — ID of the user.
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
The deleted User object.

```json
{
  "id": 1,
  "name": "Naoise Golden"
}
```

#### Errors

- **404 Not Found** — User with the specified ID does not exist.

***

### Users by Dive Site

`GET https://divebook.herokuapp.com/api/divesites/:divesite_id/users`

#### Parameters

- **divesite_id** *(required)* — ID of the Dive Site.
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
Array of User objects.

```json
[
  {
    "id": 1,
    "name": "Naoise Golden"
  },
  {
    "id": 2,
    "name": "Paula Sanchez"
  }
]
```

#### Errors

- **404 Not Found** — Dive Site with the specified ID does not exist.

***

## Dive Sites

### All Dive Sites

`GET https://divebook.herokuapp.com/api/divesites`

#### Parameters

- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
Array of Dive Site objects.

```json
[
  {
    "id": 1,
    "name": "Blue Hole",
    "address": "Dahab, Egypt",
    "latitude": "28.572179",
    "longitude": "34.537062",
    "dives": 5
  },
  {
    "id": 2,
    "name": "Eel Garden",
    "address": "Utila, Honduras",
    "latitude": "16.114262",
    "longitude": "-86.945522",
    "dives": 3
  }
]
```

***

### Add Dive Site

`POST https://divebook.herokuapp.com/api/divesites`

#### Parameters

- **name**
- **address** *(required)*
- **access_token** *(required)*

#### Response

Status code: `201 Created` <br/>
The created Dive Site object.

```json
{
  "id": 1,
  "name": "Blue Hole",
  "address": "Dahab, Egypt",
  "latitude": "28.572179",
  "longitude": "34.537062",
  "dives": 0
}
```

#### Errors

- **422 Unprocessable Entity** — The system had trouble saving the Dive Site.

***

### Get Dive Site

`GET https://divebook.herokuapp.com/api/divesites/:id`

#### Parameters

- **id** *(required)*
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
The Dive Site object.


```json
{
  "id": 1,
  "name": "Blue Hole",
  "address": "Dahab, Egypt",
  "latitude": "28.572179",
  "longitude": "34.537062",
  "dives": 5
}
```

#### Errors

- **404 Not Found** — Dive Site with the specified ID does not exist.

***

### Update Dive Site
`PUT https://divebook.herokuapp.com/api/divesites/:id`

#### Parameters

- **id** *(required)*
- **access_token** *(required)*
- **name**
- **address**

#### Response

Status code: `200 OK` <br/>
The updated Dive Site object.

```json
{
  "id": 1,
  "name": "Blue Hole",
  "address": "Dahab, Egypt",
  "latitude": "28.572179",
  "longitude": "34.537062",
  "dives": 5
}
```

#### Errors

- **404 Not Found** — Dive Site with the specified ID does not exist.
- **422 Unprocessable Entity** — The system had trouble updating the Dive Site.

***

### Delete Dive Site
`DELETE https://divebook.herokuapp.com/api/divesites/:id`

#### Parameters

- **id** *(required)*
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
The deleted Dive Site object.

```json
{
  "id": 1,
  "name": "Blue Hole",
  "address": "Dahab, Egypt",
  "latitude": "28.572179",
  "longitude": "34.537062",
  "dives": 5
}
```

#### Errors

- **404 Not Found** — Dive Site with the specified ID does not exist.

***

### Dive Sites by User
`GET https://divebook.herokuapp.com/api/users/:user_id/divesites`

#### Parameters

- **user_id** *(required)* — ID of the User.
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
Array of Dive Site objects.

```json
[
  {
    "id": 1,
    "name": "Blue Hole",
    "address": "Dahab, Egypt",
    "latitude": "28.572179",
    "longitude": "34.537062",
    "dives": 5
  },
  {
    "id": 2,
    "name": "Eel Garden",
    "address": "Utila, Honduras",
    "latitude": "16.114262",
    "longitude": "-86.945522",
    "dives": 3
  }
]
```

#### Errors

- **404 Not Found** — User with the specified ID does not exist.

***


## Dives

### Add Dive

`POST https://divebook.herokuapp.com/api/dives`

#### Parameters

- **user_id** *(required)*
- **divesite_id** *(required)*
- **date**
- **access_token** *(required)*

#### Response

Status code: `201 Created` <br/>
The created Dive object.

```json
{
  "id": 1,
  "user_id": 1,
  "divesite_id": 1,
  "date": "2014-04-23T18:25:43.511Z",
  "images": [ ]
}
```

#### Errors

- **422 Unprocessable Entity** — The system had trouble saving the Dive.

***

### Get Dive

`GET https://divebook.herokuapp.com/api/dives/:id`

#### Parameters

- **id** *(required)*
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
The Dive object.

```json
{
  "id": 1,
  "user_id": 1,
  "divesite_id": 1,
  "date": "2014-04-23T18:25:43.511Z",
  "images": [ ]
}
```

#### Errors

- **404 Not Found** — Dive with the specified ID does not exist.

***

### Update Dive
`PUT https://divebook.herokuapp.com/api/dives/:id`

#### Parameters

- **id** *(required)*
- **access_token** *(required)*
- **user_id**
- **divesite_id**
- **date**

#### Response

Status code: `200 OK` <br/>
The updated Dive object.

```json
{
  "id": 1,
  "user_id": 1,
  "divesite_id": 1,
  "date": "2014-04-23T18:25:43.511Z",
  "images": [ ]
}
```

#### Errors

- **404 Not Found** — Dive with the specified ID does not exist.
- **422 Unprocessable Entity** — The system had trouble updating the Dive.

***

### Delete Dive
`DELETE https://divebook.herokuapp.com/api/dives/:id`

#### Parameters

- **id** *(required)*
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
The deleted Dive object.

```json
{
  "id": 1,
  "user_id": 1,
  "divesite_id": 1,
  "date": "2014-04-23T18:25:43.511Z",
  "images": [ ]
}
```

#### Errors

- **404 Not Found** — Dive with the specified ID does not exist.

***

### Dives by User
`GET https://divebook.herokuapp.com/api/users/:user_id/dives`

#### Parameters

- **user_id** *(required)* — ID of the User.
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
Array of Dive objects.

```json
[
  {
    "id": 1,
    "user_id": 1,
    "divesite_id": 1,
    "date": "2014-04-23T18:25:43.511Z",
    "images": [ ]
  },
  {
    "id": 2,
    "user_id": 1,
    "divesite_id": 2,
    "date": "2014-04-23T15:00:00.511Z",
    "images": [ ]
  }
]
```

#### Errors

- **404 Not Found** — User with the specified ID does not exist.

***

### Dives by Dive Site
`GET https://divebook.herokuapp.com/api/divesites/:divesite_id/dives`

#### Parameters

- **divesite_id** *(required)* — ID of the Dive Site.
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
Array of Dive objects.

```json
[
  {
    "id": 1,
    "user_id": 1,
    "divesite_id": 1,
    "date": "2014-04-23T18:25:43.511Z",
    "images": [ ]
  },
  {
    "id": 2,
    "user_id": 2,
    "divesite_id": 1,
    "date": "2014-04-23T15:00:00.511Z",
    "images": [ ]
  }
]
```

#### Errors

- **404 Not Found** — Dive Site with the specified ID does not exist.

***


## Images

### Add Image

`POST https://divebook.herokuapp.com/api/images`

#### Parameters

- **dive_id** *(required)*
- **file** *(required)*
- **access_token** *(required)*

#### Response

Status code: `201 Created` <br/>
The created Image object.

- **thumbnail** — Image with 150x150> size.
- **medium** — Image with 300x300> size.
- **standard** — Image with 600x600> size.
- **original** — Original Image.

```json
{
  "id": 1,
  "dive_id": 3,
  "divesite_id": 5,
  "user_id": 7,
  "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/001/thumbnail/sample.jpg",
  "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/001/medium/sample.jpg",
  "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/001/standard/sample.jpg",
  "original": "http://s3.amazonaws.com/divebook/images/files/000/000/001/original/sample.jpg"
}
```

#### Errors

- **422 Unprocessable Entity** — The system had trouble saving the Image.

***

### Get Image

`GET https://divebook.herokuapp.com/api/images/:id`

#### Parameters

- **id** *(required)*
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
The Image object.

```json
{
  "id": 1,
  "dive_id": 3,
  "divesite_id": 5,
  "user_id": 7,
  "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/001/thumbnail/sample.jpg",
  "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/001/medium/sample.jpg",
  "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/001/standard/sample.jpg",
  "original": "http://s3.amazonaws.com/divebook/images/files/000/000/001/original/sample.jpg"
}
```

#### Errors

- **404 Not Found** — Image with the specified ID does not exist.

***

### Update Image
`PUT https://divebook.herokuapp.com/api/images/:id`

#### Parameters

- **id** *(required)*
- **dive_id**
- **file**
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
The updated Image object.

```json
{
  "id": 1,
  "dive_id": 3,
  "divesite_id": 5,
  "user_id": 7,
  "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/001/thumbnail/sample.jpg",
  "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/001/medium/sample.jpg",
  "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/001/standard/sample.jpg",
  "original": "http://s3.amazonaws.com/divebook/images/files/000/000/001/original/sample.jpg"
}
```

#### Errors

- **404 Not Found** — Image with the specified ID does not exist.
- **422 Unprocessable Entity** — The system had trouble updating the Image.

***

### Delete Image
`DELETE https://divebook.herokuapp.com/api/images/:id`

#### Parameters

- **id** *(required)*
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
The deleted Image object.

```json
{
  "id": 1,
  "dive_id": 3,
  "divesite_id": 5,
  "user_id": 7,
  "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/001/thumbnail/sample.jpg",
  "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/001/medium/sample.jpg",
  "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/001/standard/sample.jpg",
  "original": "http://s3.amazonaws.com/divebook/images/files/000/000/001/original/sample.jpg"
}
```

#### Errors

- **404 Not Found** — Image with the specified ID does not exist.

***

### Images by Dive
`GET https://divebook.herokuapp.com/api/dives/:dive_id/images`

#### Parameters

- **dive_id** *(required)* — ID of the Dive.
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
Array of Image objects.

```json
[
  {
    "id": 1,
    "dive_id": 3,
    "divesite_id": 5,
    "user_id": 7,
    "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/001/thumbnail/sample.jpg",
    "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/001/medium/sample.jpg",
    "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/001/standard/sample.jpg",
    "original": "http://s3.amazonaws.com/divebook/images/files/000/000/001/original/sample.jpg"
  },
  {
    "id": 2,
    "dive_id": 3,
    "divesite_id": 6,
    "user_id": 8,
    "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/002/thumbnail/egypt.jpg",
    "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/002/medium/egypt.jpg",
    "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/002/standard/egypt.jpg",
    "original": "http://s3.amazonaws.com/divebook/images/files/000/000/002/original/egypt.jpg"
  }
]
```

#### Errors

- **404 Not Found** — Dive with the specified ID does not exist.

***

### Images by Dive Site
`GET https://divebook.herokuapp.com/api/divesites/:divesite_id/images`

#### Parameters

- **divesite_id** *(required)* — ID of the Dive Site.
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
Array of Image objects.

```json
[
  {
    "id": 1,
    "dive_id": 3,
    "divesite_id": 5,
    "user_id": 7,
    "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/001/thumbnail/sample.jpg",
    "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/001/medium/sample.jpg",
    "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/001/standard/sample.jpg",
    "original": "http://s3.amazonaws.com/divebook/images/files/000/000/001/original/sample.jpg"
  },
  {
    "id": 2,
    "dive_id": 4,
    "divesite_id": 5,
    "user_id": 8,
    "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/002/thumbnail/egypt.jpg",
    "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/002/medium/egypt.jpg",
    "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/002/standard/egypt.jpg",
    "original": "http://s3.amazonaws.com/divebook/images/files/000/000/002/original/egypt.jpg"
  }
]
```

#### Errors

- **404 Not Found** — Dive Site with the specified ID does not exist.

***

### Images by User
`GET https://divebook.herokuapp.com/api/users/:user_id/images`

#### Parameters

- **user_id** *(required)* — ID of the User.
- **access_token** *(required)*

#### Response

Status code: `200 OK` <br/>
Array of Image objects.

```json
[
  {
    "id": 1,
    "dive_id": 3,
    "divesite_id": 5,
    "user_id": 7,
    "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/001/thumbnail/sample.jpg",
    "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/001/medium/sample.jpg",
    "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/001/standard/sample.jpg",
    "original": "http://s3.amazonaws.com/divebook/images/files/000/000/001/original/sample.jpg"
  },
  {
    "id": 2,
    "dive_id": 4,
    "divesite_id": 6,
    "user_id": 7,
    "thumbnail": "http://s3.amazonaws.com/divebook/images/files/000/000/002/thumbnail/egypt.jpg",
    "medium": "http://s3.amazonaws.com/divebook/images/files/000/000/002/medium/egypt.jpg",
    "standard": "http://s3.amazonaws.com/divebook/images/files/000/000/002/standard/egypt.jpg",
    "original": "http://s3.amazonaws.com/divebook/images/files/000/000/002/original/egypt.jpg"
  }
]
```

#### Errors

- **404 Not Found** — User with the specified ID does not exist.

***

## Pagination

Requests that return multiple items will be paginated to 25 items by default. You can specify further pages with the `?page` parameter. For some resources, you can also set a custom page size up to 100 with the `?per_page` parameter.

`GET https://divebook.herokuapp.com/api/dives?per_page=10&page=2`

Note that page numbering is 1-based and that omitting the ?page parameter will return the first page.
