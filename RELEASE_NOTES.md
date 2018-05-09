# Release Notes

There are no release notes before v`1.2.0`. For these versions, please check the
git tags.

Note that iExtra doesn't use semver. Breaking changes can occur on minor version
bumps, but not on revision bumps.


## 1.2.0

The action block-based gesture recognizer view extensions have been renamed. The
action block now completes with the gesture that triggered the action. This is a
breaking change.

I have begun adding theme components to the library. For now, this namespace has
a `Theme` protocol, a themed button class and an extension to reapply the global
appearance of an app.
