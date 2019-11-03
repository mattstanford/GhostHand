#!/bin/sh

#First find the app in the wrapper framework
appLocation=`find . -name "GhostHand.app" | head -n 1`

#First boot the simulator we are running against
xcrun simctl boot "${TARGET_DEVICE_IDENTIFIER}"

#Install the app
xcrun simctl install ${TARGET_DEVICE_IDENTIFIER} $appLocation
xcrun simctl --set testing install booted $appLocation


exit 0

