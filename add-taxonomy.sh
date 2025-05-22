#!/bin/bash

# Helper script to add a new taxonomy value to a recipe

# Check if all required arguments were provided
if [ $# -lt 3 ]; then
    echo "Usage: $0 <recipe_file> <taxonomy_type> <taxonomy_value>"
    echo "Example: $0 content/recipes/Bibimbap.md cuisines italian"
    exit 1
fi

RECIPE_FILE="$1"
TAXONOMY_TYPE="$2"
TAXONOMY_VALUE="$3"

# Check if file exists
if [ ! -f "$RECIPE_FILE" ]; then
    echo "Error: Recipe file $RECIPE_FILE does not exist."
    exit 1
fi

# Check if taxonomy type is valid
if [[ "$TAXONOMY_TYPE" != "meals" && "$TAXONOMY_TYPE" != "cuisines" ]]; then
    echo "Error: Taxonomy type must be 'meals' or 'cuisines'."
    exit 1
fi

# Check if the taxonomy entry already exists in the file
if grep -q "$TAXONOMY_TYPE = \[.*\"$TAXONOMY_VALUE\".*\]" "$RECIPE_FILE"; then
    echo "Taxonomy value '$TAXONOMY_VALUE' already exists in $TAXONOMY_TYPE for this recipe."
    exit 0
fi

# Add taxonomy value to the file
if grep -q "$TAXONOMY_TYPE = \[\]" "$RECIPE_FILE"; then
    # Empty taxonomy array - replace with the new value
    sed -i "s/$TAXONOMY_TYPE = \[\]/$TAXONOMY_TYPE = \[\"$TAXONOMY_VALUE\"\]/g" "$RECIPE_FILE"
elif grep -q "$TAXONOMY_TYPE = \[" "$RECIPE_FILE"; then
    # Taxonomy array exists - add the new value
    sed -i "s/$TAXONOMY_TYPE = \[/$TAXONOMY_TYPE = \[\"$TAXONOMY_VALUE\", /g" "$RECIPE_FILE"
else
    echo "Error: Could not find taxonomy field $TAXONOMY_TYPE in the recipe file."
    exit 1
fi

echo "Added '$TAXONOMY_VALUE' to $TAXONOMY_TYPE in $RECIPE_FILE"