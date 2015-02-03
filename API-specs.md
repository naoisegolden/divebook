# Divebook REST API Specs

Ruby Version is 2.2.0<br />
Rails Version is 4.2.0

API code should be namespaced to `API::`.<br />
API URIs should be namespaced to `/api/`.

Session authentication is done with Devise.

## Table of Contents

- Dive Sites
    - All Dive Sites
    - Add Dive Site
    - Get Dive Site
    - Update Dive Site
    - Delete Dive Site
    - Dive Sites by User
- Users
    - Add User (?)
    - Get User
    - Update User
    - Delete User
    - Users by Dive Site
- Dives
    - Add Dive
    - Get Dive
    - Update Dive
    - Delete Dive
    - Dives by User
    - Dives by Dive Site

## Dive Sites
### All Dive Sites
#### http://divebook.herokuapp.com/api/divesites

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| GET           | Yes                  |

Response: array of Dive Site objects.

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

### Add Dive Site
#### http://divebook.herokuapp.com/api/divesites/add

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| POST          | Yes                  |

Response: the created Dive Site object.


```json

```

### Get Dive Site
#### http://divebook.herokuapp.com/api/divesites/DIVESITE_ID

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| GET           | Yes                  |

Response: the Dive Site object.


```json
{
  "name": "Blue Hole",
  "address": "Dahab, Egypt",
  "latitude": "28.572179",
  "longitude": "34.537062",
  "dives": 5
}
```


### Update Dive Site
#### http://divebook.herokuapp.com/api/divesites/DIVESITE_ID

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| PUT           | Yes                  |

Response: the updated Dive Site object.

```json
```

### Delete Dive Site
#### http://divebook.herokuapp.com/api/divesites/

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| DELETE        | Yes                  |

Response: success or error message.

```json
```

### Dive Sites by User
#### http://divebook.herokuapp.com/api/users/USER_ID/divesites

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| GET           | Yes                  |

Response: array of Dive Site objects.

```json
```

## Users
### Add User
#### http://divebook.herokuapp.com/api/users

NOTE: maybe it's not possible with Devise. 

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| POST          | Yes                  |

Response: the created User object.

```json
```

### Get User
#### http://divebook.herokuapp.com/api/users/USER_ID

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| GET           | Yes                  |

Response: the User object.

```json
{
  "id": 1,
  "name": "Naoise Golden"
}
```

### Update User
#### http://divebook.herokuapp.com/api/users/USER_ID

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| PUT           | Yes                  |

Response: the updated User object.

```json
```

## Delete User
#### http://divebook.herokuapp.com/api/users/USER_ID

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| DELETE        | Yes                  |

Response: success or error message.

```json
```

### Users by Dive Site
#### http://divebook.herokuapp.com/api/divesites/DIVESITE_ID/users

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| GET           | Yes                  |

Response: array of User objects.

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

## Dives
### Add Dive
#### http://divebook.herokuapp.com/api/dives

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| POST          | Yes                  |

Response: created Dive object.

```json
{
  "id": 1,
  "user_id": 1,
  "divesite_id": 1,
  "date": "2012-04-23T18:25:43.511Z"
}
```

### Dive
#### http://divebook.herokuapp.com/api/dives/DIVE_ID

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| GET           | Yes                  |

Response: the Dive object.

```json
{
  "id": 1,
  "user_id": 1,
  "divesite_id": 1,
  "date": "2012-04-23T18:25:43.511Z"
}
```

### Update Dive
#### http://divebook.herokuapp.com/api/dives/DIVE_ID

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| PUT           | Yes                  |

Response: the updated Dive object.

```json
```

### Delete Dive
#### http://divebook.herokuapp.com/api/dives/DIVE_ID

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| DELETE        | Yes                  |

Response: success or error message.

```json
```

### Dives by User
#### http://divebook.herokuapp.com/api/users/USER_ID/dives

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| GET           | Yes                  |

Response: array of Dive objects.

```json
[
  {
    "id": 1,
    "user_id": 1,
    "divesite_id": 1,
    "date": "2012-04-23T18:25:43.511Z"
  },
  {
    "id": 2,
    "user_id": 1,
    "divesite_id": 2,
    "date": "2012-04-23T15:00:00.511Z"
  }
]
```

### Dives by Dive Site
#### http://divebook.herokuapp.com/api/divesites/USER_ID/dives

| HTTP Method   | Requires acting user |
| ------------- | -------------------- |
| GET           | Yes                  |

Response: array of Dive objects.

```json
[
  {
    "id": 1,
    "user_id": 1,
    "divesite_id": 1,
    "date": "2012-04-23T18:25:43.511Z"
  },
  {
    "id": 3,
    "user_id": 2,
    "divesite_id": 1,
    "date": "2012-03-12T11:10:55.511Z"
  }
]
```
