#!/usr/bin/env bash

# Start the sql proxy
if [ "$CLOUD_SQL_INSTANCE" ]; then
    echo >&2 "Starting cloud_sql_proxy to: ${CLOUD_SQL_INSTANCE}"
    cloud_sql_proxy -instances=${CLOUD_SQL_INSTANCE}=tcp:3306 &
fi

# Execute the rest of your ENTRYPOINT and CMD as expected.
exec "$@"