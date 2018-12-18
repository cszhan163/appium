#!/bin/bash
set -e;
buildType="$1"
buildCmd="$2"
iosDriverPath="kuben-appium-ios-driver"
if [ "$buildType" == "xcode" ] || [ "$buildType" == "all" ]; then
	cd ../appium-xcode
	npm install
	npm link
	cd ../appium
fi

if [ "$buildType" == "simctl" ] || [ "$buildType" == "all" ]; then
	cd ../node-simctl
	npm install
	npm link 
	cd ../appium
	npm link  kuben-node-simctl
fi

if [ "$buildType" == "sim" ] || [ "$buildType" == "all" ]; then

	cd ../appium-ios-simulator
	npm link kuben-appium-xcode
	npm link kuben-node-simctl
	npm install
	npm link
	cd ../appium
	npm link  kuben-appium-ios-simulator
fi


if [ "$buildType" == "driver" ] || [ "$buildType" == "all" ]; then
	cd ../${iosDriverPath}
	npm install
	npm link
	cd ../appium
	npm link ${iosDriverPath} # create a symlink locally to global viking symlink
fi

if [ "$buildCmd" == "" ]; then 
# voila! now we can develop the two projects side-by-side without   # having to worry about publishing either of them
	node ./build/lib/main.js 
fi
