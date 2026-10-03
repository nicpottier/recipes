# Recipes

A personal collection of recipes, published as a static website built with [Hugo](https://gohugo.io) and deployed on Netlify.

Recipes are tagged by **meal** (breakfast, lunch, dinner) and **cuisine** (Italian, Korean, Indian, Mexican, etc.), so you can browse by either.

## Adding a recipe

Create a Markdown file in `content/recipes/` with TOML front matter:

```markdown
+++
title = "Recipe Title"
date = "YYYY-MM-DD"
meals = ["dinner"]
cuisines = ["italian"]
+++

Source: https://example.com/recipe-source

# Ingredients
* Ingredient 1
* Ingredient 2

# Instructions
1. Step 1
2. Step 2
```

To add a meal or cuisine tag to an existing recipe:

```bash
./add-taxonomy.sh content/recipes/Pizza.md meals lunch
```

## Running locally

Install [Hugo](https://gohugo.io/installation/), then run:

```bash
hugo server -D
```

Open http://localhost:1313. Run `hugo` to build the site into `public/`.

Or use Docker instead:

```bash
docker compose up
```
