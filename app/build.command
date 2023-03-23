#!/bin/bash

set -e

cd "$(dirname "$0")"

WORKING_LOCATION="$(pwd)"
APPLICATION_NAME=app
CONFIGURATION=Debug


if [ ! -d "build" ]; then
mkdir build
fi
cd build
if [ -e "$APPLICATION_NAME.ipa" ]; then
rm $APPLICATION_NAME.ipa
fi

# Build .app
xcodebuild -project "$WORKING_LOCATION/$APPLICATION_NAME.xcodeproj" \
    -scheme $APPLICATION_NAME \
    -configuration Debug \
    -derivedDataPath "$WORKING_LOCATION/build/DerivedData" \
    -destination 'generic/platform=iOS' \
    ONLY_ACTIVE_ARCH="NO" \
    CODE_SIGNING_ALLOWED="NO" \

DD_APP_PATH="$WORKING_LOCATION/build/DerivedData/Build/Products/$CONFIGURATION-iphoneos/Scylla.app"
TARGET_APP="$WORKING_LOCATION/build/Scylla.app"
cp -r "$DD_APP_PATH" "$TARGET_APP"

# Remove signature
codesign --remove "$TARGET_APP"
if [ -e "$TARGET_APP/_CodeSignature" ]; then
    rm -rf "$TARGET_APP/_CodeSignature"
fi
if [ -e "$TARGET_APP/embedded.mobileprovision" ]; then
    rm -rf "$TARGET_APP/embedded.mobileprovision"
fi

# Package .ipa
rm -rf Payload
mkdir Payload
cp -r Scylla.app Payload/Scylla.app
zip -vr Scylla.ipa Payload
rm -rf Scylla.app
rm -rf Payload
