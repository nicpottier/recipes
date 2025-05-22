#!/bin/bash

# Helper script to create a new recipe with the correct frontmatter

# Check if a recipe name was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 \"Recipe Name\""
    exit 1
fi

# Format the recipe name for the filename
RECIPE_NAME="$1"
FILENAME=$(echo "$RECIPE_NAME" | tr ' ' '_')
DATE=$(date +"%Y-%m-%d")

# Create the file path
FILEPATH="content/recipes/${FILENAME}.md"

# Check if file already exists
if [ -f "$FILEPATH" ]; then
    echo "Error: Recipe file $FILEPATH already exists."
    exit 1
fi

# Create the new recipe file with template
cat > "$FILEPATH" << EOF
+++
title = "$RECIPE_NAME"
date = "$DATE"
meals = [""]
cuisines = [""]
+++

Source: 

# Ingredients
* 
* 
* 

# Instructions
1. 
2. 
3. 
EOF

echo "Created new recipe: $FILEPATH"
echo "Edit the file to add ingredients, instructions, and categorize it by meals and cuisines."