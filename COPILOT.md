# GitHub Copilot Agent Guide

This guide contains specific instructions and tips for GitHub Copilot Agent to effectively work with this recipe repository.

## Repository Overview

This is a recipe collection website built with Hugo, a static site generator. The structure is simple:

- `content/recipes/` - Contains all recipe markdown files
- `config.toml` - Main Hugo configuration file
- `themes/hyde-y/` - The Hugo theme files
- `static/` - Static assets
- `layouts/` - Custom layout templates (if any)

## Common Tasks

### 1. Viewing the Repository Structure

Use this command to see the structure of the repository:

```bash
find . -type f -not -path "*/\.*" -not -path "*/node_modules/*" -not -path "*/public/*" | sort
```

### 2. Running the Site Locally

Using Docker (recommended):
```bash
docker-compose up
```

Using Hugo directly:
```bash
hugo server -D
```

### 3. Creating a New Recipe

Using the helper script:
```bash
./new-recipe.sh "Recipe Name"
```

Manual method:
```bash
# Create a new Markdown file in the content/recipes directory
# Use the correct frontmatter format (see existing recipes for reference)
```

### 4. Modifying an Existing Recipe

1. Locate the recipe file in the `content/recipes/` directory
2. Edit the file, preserving the frontmatter format (the +++ section)
3. Test changes locally using `docker-compose up` or `hugo server -D`

### 5. Understanding Recipe Format

Each recipe should have:

```markdown
+++
title = "Recipe Title"
date = "YYYY-MM-DD"
meals = ["breakfast", "lunch", "dinner"]  # choose applicable meal types
cuisines = ["italian", "american", "etc"]  # choose applicable cuisines
+++

Source information or notes

# Section Title (like "Ingredients")
* Item 1
* Item 2

# Section Title (like "Instructions")
1. Step 1
2. Step 2
```

## Helpful Hugo Commands

- `hugo version` - Check Hugo version
- `hugo` - Build the site (outputs to `public/` directory)
- `hugo server` - Start development server
- `hugo server -D` - Start development server and include draft posts
- `hugo new content/recipes/Recipe_Name.md` - Create a new recipe (alternative to helper script)

## VS Code Integration

The repository is configured with VS Code settings for optimal development:

- `.vscode/settings.json` - Editor settings for consistent formatting
- `.vscode/extensions.json` - Recommended extensions for Hugo and Markdown development

These settings help ensure consistent code style and provide helpful tools for working with Hugo and Markdown files.

## Working with Docker

- `docker-compose up` - Start the Hugo server in a container
- `docker-compose down` - Stop the container
- `docker-compose build --no-cache` - Rebuild the container (if Dockerfile changes)

This Docker setup uses Alpine Linux with Hugo installed, providing a lightweight and efficient development environment.

---

When you're done, you can view the site at `http://localhost:1313` when the server is running.