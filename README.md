# LifeGraph Backend

Rails API for the LifeGraph MVP. PostgreSQL is the source of truth for workspaces,
entities, relationships, documents, activity, search, and permission-filtered AI
context.

## Requirements

- Ruby 3.4.10
- PostgreSQL

## Local setup

Configure the database values shown in `.env.example` in your shell, then run:

```sh
bundle install
bin/rails db:prepare
bin/rails server
```

The public integration endpoint is available at `GET /api/v1/system`.

## Repository boundaries

`lifegraph-web` and `lifegraph-mobile` are separate Git repositories even when
they are checked out inside this directory. They are intentionally ignored by
the backend repository.

## Security baseline

- Never commit `.env` files, `config/master.key`, connector keys, or AI provider
  credentials.
- Every future graph record must be scoped to a workspace and authorized on the
  server. A workspace identifier supplied by a client is never sufficient proof
  of access.
- Private graph content must not be written to analytics or application logs.
- Production database access should use a managed `DATABASE_URL` or injected
  environment values.
