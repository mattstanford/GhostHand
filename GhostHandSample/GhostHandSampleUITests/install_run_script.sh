#!/bin/sh

#First boot the simulator we are running against
xcrun simctl boot "${TARGET_DEVICE_IDENTIFIER}"

#First find the app in the wrapper framework
appLocation=`find $FRAMEWORK_SEARCH_PATHS -name "GhostHand.app" | head -n 1`

#Install the app
xcrun simctl install ${TARGET_DEVICE_IDENTIFIER} $appLocation

exit 0
