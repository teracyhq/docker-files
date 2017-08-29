#!/bin/sh -e

# generate .boto for google cloud storage

echo -e "[Credentials]\ngs_access_key_id = $GS_ACCESS_KEY_ID\ngs_secret_access_key = $GS_SECRET_ACCESS_KEY\n\n[GSUtil]\ndefault_project_id = $GS_PROJECT_ID" > ~/.boto

# echo "Executing command $@"
exec "$@"
