
# GhostHand 👻

Have you ever tried to test custom schemes or universal links with XCUITest? You may have tried to use one of the simulator's built in apps (like Messages of Safari), but encountered frustration. With Apple changing up these apps on the simulator all the time, it's like trying to hit a moving target.

But what if there was an easy, reliable and FAST way to test custom schemes/universal links? That's where GhostHand comes in! The GhostHand library contains a pre-built app that will install itself on your simulator. Just call the GhostHandLib's static function, and it will open the companion app with your supplied URL, and will call `UIApplication.shared.open(url`:)` on open. This should work for both custom schemes and universal links.

## Installation

Currently GhostHand supports CocoaPods, Carthage, and manual installs

### Cocoapods

First add the GhostHand pod to your project's **UI Test Target** in your `Podfile`:

```
target 'MyProjectUITests' do
    # Other UI Test pods....
    pod 'GhostHand'
end
```

Then go to your **UI Test Target** in Xcode, click `Build Phases`, and add a new run script with the following code:

```
"${PODS_ROOT}/GhostHand/ghosthand_install.sh"
```

### Carthage

Add the GhostHand library to your Cartfile:

```
github "mds6058/GhostHand"
```

After you've linked the library properly to your **UI Test Target**, click on the project in Xcode, select the UI Test Target, click `Build Phases`, and add a new run script with the following code:

```
"${PROJECT_DIR}/Carthage/Build/iOS/GhostHandLib.framework/ghosthand_install.sh"
```

### Manual Install

Link the `GhostHandLib` framework to your **UI Test Target** appropriately, click on the project in Xcode, select the UI Test Target, click `Build Phases`, and add a new run script with the following code:

```
<PATH_TO_GHOSTHANDLIB>/ghosthand_install.sh
```


## Usage

Once GhostHand is setup on your UI Test Target appropriately, it's time to put it into action!

Here's a simple UI Test that exercises GhostHand. Note that we are assuming the app being tested here has the custom scheme `myApp://` registered in the info.plist properly:

```
swift

func testSample() {
    app.launch()
    let appBooted = app.staticTexts["Sample App for 👻"].waitForExistence(timeout: 5)
    XCTAssert(appBooted)

    //Tap the home button to put the app under test in the background
    XCUIDevice.shared.press(XCUIDevice.Button.home)

    //Use the GhostHand companion app to launch the custom scheme
    GhostHand.launch(url: "myApp://TEST")

    //The app should be called by the GhostHand companion app
    let appShowedAgain = app.staticTexts["Sample App for 👻"].waitForExistence(timeout: 5)
    XCTAssert(appShowedAgain)
  }
```
