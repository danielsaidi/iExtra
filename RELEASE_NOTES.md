# Release Notes

There are no release notes before v`1.2.0`. For these versions, please check the
git tags. Also please note that iExtra does not use semver. Breaking changes can
occur on minor version bumps, but not on revision bumps.


## 1.7.0

This is a small update, with new extensions, code cleanups and minor adjustments.

Breaking Changes:

- `DeviceModelType` and all `UIDevice+Model` extensions have been removed. These
features are better covered in `https://github.com/dennisweissmann/DeviceKit`.

- `Array+ElementsOfType` has been removed, since it's just a useless `compactMap`
wrapper. Use `compactMap` directly.



## 1.6.0

This version upgrades iExtra to `Swift 4.2` and removes functionality that Swift
now has built-in (array `shuffled()`). I have also removed old deprecated status
bar extensions.



## 1.5.0

New features:

- The new `MKAnnotation+DefaultView` contains an new extension that provides the
default view for an annotation given a certain map view instance.

- For `Codable` there is now a new `customISO8601` `JsonDecoder` that uses a new
date decoding strategy that uses new date formatters to handle dates.

- I have added two `StringEncoder` and `StringDecoder` protocols together with a
`Base64StringCoder` implementation.

Breaking changes:

- `MKMapView+CenterCoordinate` has been renamed and its syntax refactored to use
modern Swift naming conventions.



## 1.4.4 - 1.4.6

I have added a new `UIViewController` `alertTextInput` extension, which lets you
provide a list of placeholders that are used to create text fields.



## 1.4.1 - 1.4.3

These versions increase the width of the floating menu buttons and add MKMapView
extensions that let you find the annotation that is closest to the user.



## 1.4.0

This version is adjusted to conform to `Swift 4.1` and thus requires Xcode 9.4.1
or later.

New features:

- I have added a `UINavigationController+Completions` extensions file, that lets
you use push and pop with completion blocks.

Breaking changes:

- I have adjusted the source code to conform to `Swift 4.1`. This means that any
`flatMap` occurences have been replaced with `compactMap` plus some other tweaks.



## 1.3.1

New features:

- I have added a bunch of new extensions to the library. Instead of listing them
here, just have a look at the commits for this version.

- I have added a new `NavigationBarTriggerViewController` protocol that makes it
very easy to work with navigation bars that should fade/animate in after a while,
depending on the scrollview's offset. You can use it to setup triggers that will
be activated under certain conditions, then style the navigation bar accordingly.



## 1.3.0

New features:

- The `ThinSeparator` class is now `open` instead of `public`, so subclass it as
much as you like.


Bug fixes:

- The `UIView+Fade` extension had a bug that messed up fading in a view that had
been faded out previously.

- The `ThemedButton` class previously didn't apply its appearance when movind to
a window, which could cause bugs. This has been solved.


Removed features:

- I have removed the `setBackgroundColor(for state:...)` `UIButton` extension. I
added it long ago and regret it deeply, since it's image-based and messes up any
round corners and shadows applied to the button.



## 1.2.6

New features:

- I have added a `capitalizedFirst` `StringProtocol` extension, that capitalizes
the first character and leaves the remaining characters unchanged.

- I have added a new `calculateAverageColor` `UIImage` extension that calculates
the average color of an image.

- I have added a `UITextField+Placeholder` extension that lets you set a colored
text field placeholder text.

- `UISearchBar+Style` has been etended with more extensions, like setting custom
colors for search icons, clear buttons etc.

- The `setupAsyncTag` extension has been made public, and extends UIView instead
of UIImageView. It's nice for when async operations completions may become stale,
e.g. when loading images while scrolling through a collection of cells.


Bug fixes:

- I have also fixed a rotation bug for the `startRotation` UIView extension, which
only rotated with PI, instead of a full revolution.



## 1.2.5

This version contains new corner radius and shadow extensions for `UIView`. They
are protocol-based, which means that they can be specified as e.g. enums in apps
that use them.

I have also adjusted the rotation extension and made the optional completion nil
by default.



## 1.2.4

This version contains `UIView` animation extensions, e.g. tap, press and release,
fade to alpha and rotate animations.

It also contains a custom back button extension that I use until I've managed to
find a way to adjust image insets when using the standard appearance approach.



## 1.2.3

This version of iExtra only contains nonfunctional Swiftlint conformance changes.



## 1.2.2

`MainBundleFileFinder` and `MainBundleImageFileFinder` have been rewritten. This
fixes a bug in the image file finder as well.

`MapAnnotation` has a new initializer that lets you create a complete instance.



## 1.2.1

I have added a new `ThemedLabel` class, which lets you set label appearane fonts
more easily, instead of having to add a theme font property extension on UILabel.



## 1.2.0

I have begun adding theme components to the library. For now, this namespace has
a `Theme` protocol, a themed button class and an extension to reapply the global
appearance of an app.

I have added two commented-out `IoCContainer` implementations - `DipIoCContainer`
and `SwinjectIoCContainer`. You can copy and paste the commented out code into a
project where you use these libraries for IoC. I hope it saves you some time.

Breaking changes:

* The block-based gesture recognizer extensions have been renamed. The block now
  completes with the gesture that triggered the action.

* The `IoCContainer` protocol has been extended with more resolve functions. You
  have to implement these functions in your container implementation from now on.
