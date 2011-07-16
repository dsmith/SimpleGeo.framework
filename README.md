# SimpleGeo.framework

`SimpleGeo.framework` is an Objective-C client library for the SimpleGeo API, suitable for use in both Mac OS X and iOS applications.

## Downloading the Framework

`SimpleGeo.framework` is available as either a [downloadable ZIP
file](https://github.com/simplegeo/SimpleGeo.framework/downloads) or a branch suitable for use as a [git
submodule](http://book.git-scm.com/5_submodules.html). In either case, you'll want to place `SimpleGeo.framework` in a subdirectory beneath your app.

Here's an example of adding `SimpleGeo.framework` as a submodule:

    $ git submodule add -b framework-ios \
      git://github.com/simplegeo/SimpleGeo.framework.git ext/SimpleGeo.framework

## Embedding in an iOS Application

Once `SimpleGeo.framework` has been placed in a subdirectory beneath your app, drag it into your Xcode project; it will show up as a linked framework.

Add the following additional frameworks to your project by clicking on the target, choosing the "Build Phases" tab, and using the '+' button at the bottom of the "Linked Libraries" section:

* Foundation
* UIKit
* CoreGraphics
* CFNetwork
* SystemConfiguration
* MobileCoreServices
* CoreLocation
* MapKit
* libz

* YAJLiOS (if it's not already present)
* SimpleGeo (if it's not already present)

Non-system frameworks must be statically linked to your application (iOS does not allow embedded frameworks), so you'll need to add `-ObjC` and `-all_load` to "Other Linker Flags" (accessible via the "Linking" section under your target's  "Build Settings" tab).

[SimpleGeo-iPhone](https://github.com/simplegeo/SimpleGeo-iPhone) is an example of an iOS application built using 'SimpleGeo.framework'.

## Embedding in a Cocoa Application

Once `SimpleGeo.framework` has been placed in a subdirectory beneath your app, drag it into your Xcode project; it will show up as a linked framework.

Add the following additional frameworks to your project by clicking on the target, choosing the "Build Phases" tab, and using the '+' button at the bottom of the "Linked Libraries" section:

* CoreServices
* SystemConfiguration
* libz

* YAJL (if it's not already present)
* SimpleGeo (if it's not already present)

[SimpleApp](https://github.com/simplegeo/SimpleApp) is an example of a Cocoa application built using this framework.

## Getting Started

If you'd like help getting started with some basic tutorials, visit SimpleGeo's [Objective-C tutorials](https://simplegeo.com/docs/tutorials/objective-c) page.

## Working with Source

You may download and modify the `SimpleGeo.framework` source code to meet your needs. If you make edits that may be appreciated by others, please submit a gitHub pull request.

### Downloading Dependencies

`SimpleGeo.framework` depends on the following codebases:

* [ASIHTTPRequest](http://allseeing-i.com/ASIHTTPRequest/) (a git submodule)
* [ASIHTTPRequest+OAuth](https://github.com/AlterTap/asi-http-request-oauth.git) (a git submodule)
* ['YAJL.framework'](https://github.com/gabriel/yajl-objc/downloads) (for Cocoa projects)
* ['YAJLiOS.framework'](https://github.com/gabriel/yajl-objc/downloads) (for iOS projects)
* ['GHUnit.framework'](https://github.com/gabriel/gh-unit/downloads) (an optional testing framework)

An included script can get you up and running quickly. To download and update dependencies, simply run:

	./scripts/update-dependencies

This script does the following:

* Downloads ['YAJL.framework'](https://github.com/gabriel/yajl-objc/downloads) into the Framework's ext/ directory
* Downloads ['YAJLiOS.framework'](https://github.com/gabriel/yajl-objc/downloads) into the Framework's iOS/ext directory
* Downloads ['GHUnit.framework'](https://github.com/gabriel/gh-unit/downloads) (an optional testing framework) into the Framework's ext/ directory
* Runs $ git submodule update --init to download and update the [ASIHTTPRequest] and [ASIHTTPRequest+OAuth] submodules. If git is not installed, the appropriate files are simply downloaded into the Framework's ext/ directory.

### Building for OS X

To generate a usable `SimpleGeo.framework` for OS X from the command-line:

    $ make

The resulting Framework will appear in `build/Release`.

### Building for iOS

To generate a usable `SimpleGeo.framework` for iOS from the command-line:

    $ cd iOS
    $ make

The resulting Framework will appear in `iOS/build/Release-iphoneos`.

Building from the command-line will create an über-Universal Framework, built for `armv6` and `armv7` devices *as well as the Simulator*.

### Docs

To generate docs, make sure you've got `doxygen` installed (`brew install doxygen`, for example), then:

    $ cd docs/html/
    $ doxygen

If you'd like a handy-dandy Xcode docset:

    $ cd docs/html/
    $ make

You can either run `make install` in `docs/html/` to install the docset into your home directory, or you can do whatever you wish with the `SimpleGeo.docset` that was created there.

### Support

`SimpleGeo.framework` is fully supported by SimpleGeo. If you have any questions, comments, or bug reports, please contact us via our Google Groups [support page.](https://groups.google.com/forum/#!forum/simplegeo)
