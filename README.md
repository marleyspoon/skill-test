# Rails interview exercise

At Marley Spoon, we are building a small recipe application. The product needs to support listing recipes, viewing a single recipe, and searching recipes, but today it only has a raw JSON data source. In this session, you will take the first practical steps to turn that data into a working Rails app.

This repository is a **small Rails starter** for a live **pairing** interview (about **1.5 hours**).

During the pairing session, we value:

- clear communication about assumptions and trade-offs,
- incremental delivery with small, tested steps,
- pragmatic decisions that keep the code simple and maintainable.

**Clone** the repository using the URL you were given, use **Ruby 3.2 or newer** (including 4.x), install gems with **Bundler** from the **`Gemfile`**, and confirm the app runs:

```bash
bundle install
bin/rspec
bin/rails server
```

If `bundle install` reports a Bundler version mismatch, run `gem install bundler` and retry. If anything else fails to boot, fix or note it at the start of the session so you are not blocked on environment issues.

## Before coding

Spend a few minutes capturing **functional** requirements (what the user should see and do, including edge cases) and **non-functional** requirements (how you will test, anything performance- or security-related). You do not need a long document—a short list you can refer to while pairing is enough.

## How to work

Use **TDD** with **RSpec**, in small steps: write a failing example, make it pass, then refactor with the tests green.

## Data

**`config/data/response.json`** is a JSON **array** of recipe objects.

The starter ships **only** this file and this description: there is **no** Ruby code that reads, parses, or models it (no service, PORO, or routes/views for recipes). You add that as part of the **List** and **Detail** tasks below.

## Tasks

1. **List** — Show every recipe with **title** (linked to the detail page), **tags**, and a **description** preview. Treat null `tags_list` and `chef_name` safely.
2. **Detail** — Show one recipe with **title**, **tags**, **description**, **image**, and **chef name**. Decide how to present missing tags, chef, or a broken image.
3. **Search** — Define what “search” covers in your requirements, then implement and test it.
4. **Database** — Persist recipes in **SQLite** (e.g. file-backed databases under `storage/`) and explain briefly how data reaches the DB (migration, seed, import, etc.).
5. **Cache** — Improve **list** performance with caching and state briefly how you confirmed it works.
6. **Docker** — Add the Docker artifacts needed to run the app in containers, including any services your database or cache setup requires (with Task 4’s **SQLite** file DB, ensure **`storage/`** is writable—e.g. a Docker volume—alongside anything your cache setup needs).
7. **PostgreSQL** — Run the application database on **PostgreSQL** (for example a **Postgres** service in Docker) instead of SQLite.
