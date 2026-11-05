# Copilot instructions for this repository

## Project overview

This is a Spring Boot CRUD API for A Song of Ice and Fire characters. The app is centered on the `com.example.demo.api` package and uses JPA + PostgreSQL for persistence.

- Main application entry point: `src/main/java/com/example/demo/DemoApplication.java`
- Domain entity: `ASOIAFcharacter` in `src/main/java/com/example/demo/api/ASOIAFcharacter.java`
- REST controller: `ASOIAFcharacterController` in `src/main/java/com/example/demo/api/ASOIAFcharacterController.java`
- Service layer: `ASOIAFcharacterService`
- Repository layer: `ASOIAFrepository`
- Enum: `Loyalty`
- Config: `src/main/resources/application.properties`

The app is not a general-purpose Spring MVC site; the current working code is a character API. The project also contains a stale UI controller (`ASOIAFUiController`) that references `Plant` and `LightNeeds` and does not match the domain model. Treat that file as a likely migration artifact unless the user is explicitly asking to rebuild the UI.

## Build, test, and run

Use the Maven wrapper from the project root (`crud-api/`).

- Full test suite: `./mvnw test`
- Single test class: `./mvnw -Dtest=DemoApplicationTests test`
- Single test method: `./mvnw -Dtest=DemoApplicationTests#contextLoads test`
- Compile only: `./mvnw -q compile`
- Run locally: `./mvnw spring-boot:run`

There is no dedicated lint script configured in this repo. Maven compilation/test execution is the primary verification path.

Important current build note: as of the current snapshot, `./mvnw test` fails because `ASOIAFUiController.java` references missing classes (`Plant`, `LightNeeds`) and a missing `LocalDate` import. If a Copilot session is fixing build issues, confirm whether the stale UI code is intentionally being removed or whether the API code is the actual target.

## Architecture and runtime shape

- `DemoApplication` bootstraps the Spring Boot app.
- `ASOIAFcharacterController` exposes the REST API under `/api/characters`:
  - `GET /api/characters` with optional `name` and `loyalty` query params
  - `GET /api/characters/{id}`
  - `POST /api/characters`
  - `PUT /api/characters/{id}`
  - `DELETE /api/characters/{id}`
  - `GET /api/characters/pulse`
- `ASOIAFcharacterService` handles search logic and validation flow before persistence.
- `ASOIAFrepository` uses Spring Data derived query methods such as `findByLoyalty`, `findByNameContainingIgnoreCase`, and `findByNameContainingIgnoreCaseAndLoyalty`.
- `ASOIAFcharacter` is a JPA entity mapped to the `characters` table and stores fields such as `name`, `description`, `loyalty`, and `knight`.
- `Loyalty` is an enum: `JOFFREY`, `RENLY`, `STANNIS`, `ROBB`, `BALON`, `DAENERYS`, `NONE`.
- `application.properties` uses environment variables for the datasource (`SPRING_DATASOURCE_URL`) and sets `server.port=${PORT:8080}`.

The README describes a base path of `/api`, but the actual controller is mounted under `/api/characters`. Keep route and documentation changes aligned when editing the API.

## Key conventions in this codebase

- Follow the repository’s layer structure: controller -> service -> repository -> entity.
- Keep business logic in `ASOIAFcharacterService`; repositories should stay focused on persistence and derived query methods.
- Use `@Valid` on request bodies and model attributes when adding or updating records.
- Preserve the `ASOIAFcharacter` bean contract: `name` is required, `loyalty` is required, and `knight` is required.
- Preserve Spring Data naming conventions for repository methods instead of writing ad hoc SQL or custom query code unless the user specifically asks for it.
- Prefer domain terminology from the project (`ASOIAFcharacter`, `Loyalty`, `/api/characters`) over unrelated MVC examples from prior projects.
- If you need to add functionality, check the service and repository before introducing a new controller or custom persistence path.

## Notes for future Copilot sessions

- This project is a small, single-domain Spring app; use the existing `ASOIAFcharacter*` files as the canonical implementation path.
- Do not assume the UI controller is active or complete. It appears to be copy-pasted legacy code from a different project and currently blocks compilation.
- Treat `README.md` as a helpful description of the assignment, but validate against the actual controller and repository code before making assumptions about routes or behavior.
