# crud-api
A RESTful crud api built for CSC340 assignment 3. Built with Spring Boot to track characters from the A Song of Ice and Fire series. Data is stored in PostgreSQL (Neon).

# character attributes

| Field | Type | Rules |
|-------|------|-------|
| `id` | Long | Generated automatically |
| `name` | String | Required, not blank |
| `title` | String | Required, not blank |
| `summary` | String | Required, not blank |
| `description` | String | Required, not blank |
| `loyalty` | Enum: 'JOFFREY', 'RENLY', 'STANNIS', 'ROBB', 'BALON', 'DAENERYS', 'NONE' | Required |
| `knight` | boolean | Required |

# endpoints

Base path: `/`

| Method | Path | Description | Success |
|--------|------|-------------|---------|
| GET | `/` | List all characters (supports filters below) | 200 |
| GET | `/characters/{id}` | Get one character | 200 |
| POST | `/characters/new/` | Create a character | 201 |
| PUT | `/characters/{id}/edit` | Replace a character's fields | 200 |
| DELETE | `/characters/{id}/delete` | Delete a character | 204 |

## link to deployed API

https://crud-api-j5tl.onrender.com/

Note: free Render services sleep when idle, so the first request can take up to a minute. 

