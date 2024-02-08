#!/usr/bin/env bash

set -e

REPOSITORY=$1 # username/repo
BASENAME=$(echo "$1" | sed 's|/|_|') # Replace '/' with '_'
# Underscores (_) are not allowed in GitHub usernames,
# so the first underscore in $BASENAME effectively separates username and repo.
WORKFLOW=".github/workflows/$BASENAME.yml"
BUILD_SCRIPT=".github/build-scripts/$BASENAME.sh"

cp workflow-template.yml "$WORKFLOW"
sed -i -e "s|@REPOSITORY@|$REPOSITORY|" \
       -e "s|@SCRIPT_BASENAME@|$BASENAME|" \
    "$WORKFLOW"

[ -f "$BUILD_SCRIPT" ] || \
  (echo '#!/usr/bin/env bash' > "$BUILD_SCRIPT" && chmod a+x "$BUILD_SCRIPT")
