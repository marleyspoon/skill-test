# Rails interview exercise

This repository is a **small Rails starter** for a live **pairing** interview (about **1.5 hours**). It is **not** a take-home assignment: you and the interviewer work together in the session.

Before you join, **clone** the repository using the URL you were given, use **Ruby 3.2 or newer** (including 4.x), install gems with **Bundler** from the **`Gemfile`**, and confirm the app runs:

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

**`config/data/response.json`** is a JSON **array** of recipe objects. Each object uses these keys:

| Field | Meaning |
| --- | --- |
| `id` | String identifier for the recipe. |
| `title` | Recipe title (string). |
| `description` | Long text; may include markdown-like markers or links in the source data. |
| `image` | URL string for the hero image (may be missing or unreachable in real use). |
| `chef_name` | String or **JSON `null`** — treat absent chef as a valid case. |
| `tags_list` | Array of tag strings, or **JSON `null`** — treat absent tags as a valid case. |

The starter ships **only** this file and this description: there is **no** Ruby code that reads, parses, or models it (no service, PORO, or routes/views for recipes). You add that as part of the **List** and **Detail** tasks below.

## Tasks

1. **List** — Show every recipe with **title** (linked to the detail page), **tags**, and a **description** preview. Treat null `tags_list` and `chef_name` safely.
2. **Detail** — Show one recipe with **title**, **tags**, **description**, **image**, and **chef name**. Decide how to present missing tags, chef, or a broken image.
3. **Search** — Define what “search” covers in your requirements, then implement and test it.
4. **Database** — Persist recipes in a database and explain briefly how data reaches the DB (migration, seed, import, etc.).
5. **Cache** — Improve **list** performance with caching and state briefly how you confirmed it works.
6. **Docker** — Add the Docker artifacts needed to run the app in containers, including any services your database or cache setup requires.
