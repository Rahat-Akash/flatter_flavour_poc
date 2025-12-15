#!/bin/bash

# Script to copy the appropriate Firebase configuration file based on the flavor
# This script should be added as a Run Script phase in Xcode

# Get the flavor from the build configuration
FLAVOR="${CONFIGURATION}"

# Define source and destination paths
FIREBASE_CONFIG_DIR="${PROJECT_DIR}/../assets/firebase"
DEST_DIR="${PROJECT_DIR}/Runner"
DEST_FILE="${DEST_DIR}/GoogleService-Info.plist"

# Map build configurations to flavors
case "${FLAVOR}" in
  *Development*|*Debug*)
    SOURCE_FILE="${FIREBASE_CONFIG_DIR}/dev/GoogleService-Info.plist"
    ;;
  *Staging*)
    SOURCE_FILE="${FIREBASE_CONFIG_DIR}/staging/GoogleService-Info.plist"
    ;;
  *Production*|*Release*)
    SOURCE_FILE="${FIREBASE_CONFIG_DIR}/prod/GoogleService-Info.plist"
    ;;
  *)
    echo "Warning: Unknown flavor ${FLAVOR}, using development config"
    SOURCE_FILE="${FIREBASE_CONFIG_DIR}/dev/GoogleService-Info.plist"
    ;;
esac

# Copy the Firebase config file
if [ -f "${SOURCE_FILE}" ]; then
    echo "Copying Firebase config from ${SOURCE_FILE} to ${DEST_FILE}"
    cp "${SOURCE_FILE}" "${DEST_FILE}"
else
    echo "Warning: Firebase config file not found at ${SOURCE_FILE}"
    echo "Please ensure you have placed the GoogleService-Info.plist file in the correct flavor directory"
fi

