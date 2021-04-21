# skill-test
Marley Spoon Skill Test 2021 v1

## cookbook

Marley Spoon CookBook Recipes Explorer

Explore the most famous and easy to cook recipes that Marley Spoon have on catalogue.

### Project Setup

Export the following variables on your environment to configure Contentful

```bash
CONTENTFUL_SPACE=...
CONTENTFUL_ENVIRONMENT=...
CONTENTFUL_ACCESS_TOKEN=...
```

## Production

### Server

```bash
export RACK_ENV=production
bundle install
bundle exec shotgun
```


## Development

Intial implementation of a REST Backend API for handling CookBook Recipes

### Server

```bash
export RACK_ENV=development
bundle install
bundle exec shotgun
```
