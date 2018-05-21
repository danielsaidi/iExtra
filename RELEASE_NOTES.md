# Release Notes

There are no release notes before v`1.2.0`. For these versions, please check the
git tags.

Note that iExtra doesn't use semver. Breaking changes can occur on minor version
bumps, but not on revision bumps.



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