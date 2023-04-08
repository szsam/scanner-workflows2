#!/usr/bin/env bash

set -e

REPOSITORY=$1
BASENAME=$(echo "$1" | sed 's|/|-|') # Replace '/' with '-'
WORKFLOW=".github/workflows/$BASENAME.yml"
BUILD_SCRIPT=".github/build-scripts/$BASENAME.sh"

cp workflow-template.yml "$WORKFLOW"
sed -i -e "s|@REPOSITORY@|$REPOSITORY|" \
       -e "s|@SCRIPT_BASENAME@|$BASENAME|" \
    "$WORKFLOW"

[ -f "$BUILD_SCRIPT" ] || \
  (echo '#!/usr/bin/env bash' > "$BUILD_SCRIPT" && chmod a+x "$BUILD_SCRIPT")
