# Recipe Collection - GitHub Copilot Instructions

**ALWAYS follow these instructions first and fallback to additional search and context gathering only if the information in these instructions is incomplete or found to be in error.**

This is a recipe collection website built with Hugo 0.147.5, a static site generator, using the Hyde-Y theme. Recipes are organized by meals (breakfast, lunch, dinner) and cuisines (Italian, Korean, etc.).

## Working Effectively

### Bootstrap and Build the Repository
Run these commands in order to set up the development environment:

1. **Install Hugo (if not available)**:
   ```bash
   HUGO_VERSION=0.147.5
   HUGO_BINARY=hugo_${HUGO_VERSION}_Linux-amd64.tar.gz
   wget -q https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}
   tar xzf ${HUGO_BINARY}
   sudo mv hugo /usr/local/bin/
   rm ${HUGO_BINARY}
   hugo version
   ```
   **Timing**: Takes 30-60 seconds. NEVER CANCEL - Set timeout to 5+ minutes.

2. **Build the static site**:
   ```bash
   hugo
   ```
   **Timing**: Takes 77ms (less than 1 second). Build is extremely fast.
   **Output**: Generates static site in `public/` directory with 81 pages.

3. **Run development server**:
   ```bash
   hugo server -D --bind 127.0.0.1
   ```
   **Timing**: Starts in 45ms. NEVER CANCEL - Leave running for development.
   **Access**: Site available at `http://localhost:1313`

### Docker Alternative (Note: May have network issues)
If Docker is preferred (though Hugo direct is recommended):
```bash
docker compose up
```
**Warning**: Docker build may fail due to network limitations. Use Hugo directly if Docker fails.
**Timing**: Docker build takes 2-5 minutes when working. NEVER CANCEL - Set timeout to 10+ minutes.

## Validation Scenarios

### CRITICAL: Always test these scenarios after making changes:

1. **Build and Server Validation**:
   ```bash
   # Build static site
   hugo
   # Start server
   hugo server -D --bind 127.0.0.1
   # Test accessibility
   curl -I http://localhost:1313
   ```
   **Expected**: HTTP 200 response with valid HTML content.

2. **Recipe Viewing Test**:
   - Access homepage at `http://localhost:1313`
   - Navigate to individual recipes like `/recipes/pizza/`
   - Verify recipe content displays correctly with ingredients and instructions
   - Test taxonomy filtering (meals/cuisines) at `/cuisines/italian/` and `/meals/dinner/`
   - **Expected**: All recipes load properly, ingredients appear as lists, instructions as numbered steps

3. **Recipe Creation Test**:
   ```bash
   # Create test recipe file
   touch content/recipes/Test_Recipe.md
   # Add proper TOML frontmatter (see format below)
   # Verify it appears in development server at http://localhost:1313/recipes/test_recipe/
   # Clean up test file
   rm content/recipes/Test_Recipe.md
   ```
   **Expected**: Recipe appears immediately in development server, auto-rebuild triggers.

4. **Taxonomy Management Test**:
   ```bash
   # Test the add-taxonomy script
   ./add-taxonomy.sh content/recipes/Pizza.md meals lunch
   # Verify change was made
   head -10 content/recipes/Pizza.md
   # Revert test change
   git checkout -- content/recipes/Pizza.md
   ```

## Recipe Format

Each recipe MUST use this exact format:

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

# Instructions
1. Step 1
2. Step 2
```

**Critical**: Always preserve the `+++` frontmatter format. Invalid frontmatter will break the site build.

## Repository Structure and Key Locations

```
├── content/recipes/          # ALL RECIPE FILES HERE - 45+ recipe Markdown files
├── config.toml              # Main Hugo configuration
├── themes/hyde-y/           # Hyde-Y theme files (DO NOT MODIFY)
├── static/                  # Static assets like images
├── layouts/                 # Custom layout templates (rarely used)
├── public/                  # Generated static site (created by `hugo` command)
├── add-taxonomy.sh          # Script to add meal/cuisine tags to recipes
├── .vscode/                 # VS Code settings and extension recommendations
└── .github/workflows/       # CI configuration
```

## Helper Scripts and Commands

### Add Taxonomy Script
```bash
./add-taxonomy.sh <recipe_file> <taxonomy_type> <taxonomy_value>
# Example:
./add-taxonomy.sh content/recipes/Bibimbap.md cuisines italian
./add-taxonomy.sh content/recipes/Pizza.md meals breakfast
```
**Usage**: Valid taxonomy types are `meals` and `cuisines` only.

### Hugo Commands Reference
```bash
hugo version          # Check Hugo version (should be 0.147.5)
hugo                  # Build static site (77ms)
hugo server -D        # Start development server with drafts
hugo server --bind 127.0.0.1 -D  # Start with IPv4 binding (recommended)
hugo new content/recipes/Recipe_Name.md  # Create new recipe template (YAML format - needs manual conversion to TOML)
```

**Note**: `hugo new` creates YAML frontmatter (`---`), but recipes use TOML frontmatter (`+++`). Manually convert or copy from existing recipes.

### Repository Navigation
```bash
# View repository structure (excluding hidden/build files)
find . -type f -not -path "*/\.*" -not -path "*/node_modules/*" -not -path "*/public/*" | sort

# Find all recipes
find content/recipes -name "*.md" | sort

# Check recent changes
git log --oneline -10
```

## Development Best Practices

### Always Run These Validations Before Committing:
1. **Build Test**: Run `hugo` and verify clean build with 81+ pages
2. **Server Test**: Start `hugo server -D` and verify site loads at localhost:1313
3. **Recipe Test**: Access at least one recipe page to verify formatting
4. **Taxonomy Test**: Verify meal and cuisine filtering works

### Common Workflow After Making Changes:
1. Edit recipe files in `content/recipes/`
2. Test with `hugo server -D`
3. Verify changes at `http://localhost:1313`
4. Build with `hugo` to ensure clean production build
5. Commit changes

## Troubleshooting

### Build Issues:
- **Hugo not found**: Install Hugo 0.147.5 using commands above
- **Site not loading**: Use `hugo server -D --bind 127.0.0.1` for IPv4 binding
- **Invalid frontmatter**: Check recipe files have proper `+++` TOML format

### Docker Issues:
- **Build fails**: Network issues common - use Hugo directly instead
- **Port conflicts**: Hugo uses port 1313 by default

### Recipe Issues:
- **Recipe not appearing**: Check frontmatter format and file location in `content/recipes/`
- **Taxonomy not working**: Use `add-taxonomy.sh` script or manually edit with exact format

## VS Code Integration

The repository includes optimized VS Code settings:
- **Extensions**: Hugo language support, Markdown tools, Markdown linting
- **Settings**: Format on save, proper tab spacing for Hugo files
- **Recommendations**: Auto-prompted when opening project

Install recommended extensions for the best experience working with Hugo and Markdown files.

## Timing Expectations and Critical Warnings

- **Hugo installation**: 30-60 seconds. NEVER CANCEL - Set timeout to 5+ minutes
- **Static build (`hugo`)**: 77ms (instant). No timeout needed
- **Development server startup**: 45ms (instant). Server runs indefinitely - do not cancel
- **Docker build**: 2-5 minutes when working. NEVER CANCEL - Set timeout to 10+ minutes
- **Script execution**: 1-2 seconds. No special timeout needed

**NEVER CANCEL any long-running operations. Always set appropriate timeouts and wait for completion.**
