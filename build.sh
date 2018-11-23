#!/bin/bash
set -e;
buildType="$1"
if [ "$buildType" == "xcode" ] || [ "$buildType" == "all" ]; then
	cd ../appium-xcode
	npm install
	npm link
	cd ../appium
fi
if [ "$buildType" == "driver" ] || [ "$buildType" == "all" ]; then
	cd ../appium-ios-driver
	npm install
	npm link  appium-xcode # create a global symlink to the local "viking" project
	cd ../appium
fi

npm link appium-ios-driver # create a symlink locally to global viking symlink
# voila! now we can develop the two projects side-by-side without   # having to worry about publishing either of them
node ./build/lib/main.js 
