# crud-api
A RESTful crud api built for CSC340 assignment 3. Built with Spring Boot to track characters from the A Song of Ice and Fire series. Data is stored in PostgreSQL (Neon).

# character attributes

| Field | Type | Rules |
|-------|------|-------|
| `id` | Long | Generated automatically |
| `name` | String | Required, not blank |
| `loyalty` | Enum: 'JOFFREY', 'RENLY', 'STANNIS', 'ROBB', 'BALON', 'DAENERYS', 'NONE' | Required |
| `knight` | boolean | Required |

# endpoints

Base path: `/api`

| Method | Path | Description | Success |
|--------|------|-------------|---------|
| GET | `/api` | List all characters (supports filters below) | 200 |
| GET | `/api/{id}` | Get one character | 200 |
| POST | `/api/` | Create a character | 201 |
| PUT | `/api/{id}` | Replace a character's fields | 200 |
| DELETE | `/api/{id}` | Delete a character | 204 |

## link to deployed API

https://crud-api-j5tl.onrender.com/api

Note: free Render services sleep when idle, so the first request can take up to a minute. 

