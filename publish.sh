type="$1"
if [ ${type} == 'sim' ]; then
   cd ../kuben-appium-ios-simulator
   npm install
   npm publish
fi
if [ ${type} == 'simctl' ]; then
   cd ../kuben-node-simctl
   npm install
   npm publish
fi
if [ ${type} == 'xctest' ];then
   cd ../kuben-appium-xcuitest-driver
   npm install
   npm publish
fi
