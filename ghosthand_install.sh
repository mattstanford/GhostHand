#!/bin/sh

#First find the app in the wrapper framework
scriptLocation=`dirName $0`
appLocation=`find $scriptLocation -name "GhostHand.app" | head -n 1`

#First boot the simulator we are running against
xcrun simctl boot "${TARGET_DEVICE_IDENTIFIER}"

#Install the app
echo xcrun simctl install ${TARGET_DEVICE_IDENTIFIER} $appLocation
xcrun simctl install ${TARGET_DEVICE_IDENTIFIER} $appLocation

#Install on any running clones managed by Xcode (if running test in parallel)
xcrun simctl --set testing install booted $appLocation


exit 0

