# Recipes

A collection of recipes built with [Hugo](https://gohugo.io/), a fast and modern static site generator.

## About

This is a simple recipe collection website that uses Hugo and the Hyde-Y theme to organize and display recipes. Recipes are organized by meals (breakfast, lunch, dinner) and cuisines (Italian, Korean, etc.).

## Local Development

### Prerequisites

- [Hugo](https://gohugo.io/) (version 0.147.5 recommended)
- [Git](https://git-scm.com/)

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/nicpottier/recipes.git
   cd recipes
   ```

2. Start the local development server:
   ```bash
   hugo server -D
   ```

3. Visit `http://localhost:1313` in your browser to view the site.

## Docker Development Environment

If you prefer using Docker, we've included Docker configuration files to make setup easier.

### Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

### Setup with Docker

1. Clone this repository:
   ```bash
   git clone https://github.com/nicpottier/recipes.git
   cd recipes
   ```

2. Start the Docker container:
   ```bash
   docker-compose up
   ```

3. Visit `http://localhost:1313` in your browser to view the site.

## Adding a Recipe

Recipes are stored in the `content/recipes/` directory as Markdown files.

### Recipe Format

Each recipe should have the following format:

```markdown
+++
title = "Recipe Title"
date = "YYYY-MM-DD"
meals = ["breakfast", "lunch", "dinner"]
cuisines = ["italian", "american", "mexican"]
+++

Source: http://example.com/recipe-source

# Ingredients
* Ingredient 1
* Ingredient 2
* Ingredient 3

# Instructions
1. Step 1
2. Step 2
3. Step 3
```

## Repository Structure

- `content/recipes/`: Contains all the recipe Markdown files
- `themes/hyde-y/`: The Hyde-Y theme files
- `config.toml`: Main Hugo configuration file
- `static/`: Static assets like images
- `layouts/`: Custom layout templates (if any)

## Building for Production

To build the site for production:

```bash
hugo
```

This will generate the static site in the `public/` directory.

## Contributing

1. Fork the repository
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## License

This project is licensed under the MIT License.