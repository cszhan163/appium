#!/bin/bash
set -e;
buildType="$1"
buildCmd="$2"

appiumPath="appium"
iosDriverPath="kuben-appium-ios-driver"
iosXcodePath="kuben-appium-ios-xcode"
iosSimulator="kuben-appium-ios-simulator"
iosSimulatorCtl="kuben-node-simctl"

if [ "$buildType" == "xcode" ] || [ "$buildType" == "all" ]; then
	cd ../${iosXcodePath}
	npm install
	npm link
	cd ../appium
fi

if [ "$buildType" == "simctl" ] || [ "$buildType" == "all" ]; then
	cd ../${iosSimulatorCtl}
	npm install
	npm link 
	cd ../appium
	npm link  ${iosSimulatorCtl}
fi

if [ "$buildType" == "sim" ] || [ "$buildType" == "all" ]; then

	cd ../${iosSimulator}
	npm link ${iosXcodePath}
	npm link ${iosSimulatorCtl}
	npm install
	npm link
	cd ../appium
	npm link  ${iosSimulator}
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
