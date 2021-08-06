# carousel_mvvm

## Installation

This project require  `Xcode 12.0`, `Swift 5` and should be run on `iOS 14.0`.

1. Install [Swiftlint](https://github.com/realm/SwiftLint).
2. Install [Carthage](https://github.com/Carthage/Carthage).
-- Then, you should execute this command.
    ```sh
    carthage update
    ```

    If you have this error.
    ```sh
         Build Failed
         Task failed with exit code 1:
         /usr/bin/xcrun lipo -create
	```
	you should follow these steps . [Carthage error lipo -create](https://github.com/Carthage/Carthage/issues/3019)
	
	1. Added a file called `tmp.xcconfig` to the project and added the excludes:
	```
	EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64=arm64 arm64e armv7 armv7s armv6 armv8
    
    EXCLUDED_ARCHS=$(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT))
	```
	2. Then execute, these commands. 
	```sh
    # This export fixes an issues with the latest Xcode beta.
    export XCODE_XCCONFIG_FILE=$PWD/tmp.xcconfig
    carthage update --platform iOS --no-use-binaries --cache-builds
	```
	3. To finish, you should execute `carthage update`

3. Then, you should `run` the app.

## Evidence
On this Section we are going to watch the app running.


