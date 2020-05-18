#!/usr/bin/env bash

# Start the sql proxy
echo >&2 "Starting cloud_sql_proxy to: ${CLOUD_SQL_INSTANCE}"
cloud_sql_proxy -instances=${CLOUD_SQL_INSTANCE}=tcp:3306 &

# Execute the rest of your ENTRYPOINT and CMD as expected.
exec "$@"