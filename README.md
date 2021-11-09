# Amah TV

An easy-to-use iOS app for playing a pre-configured list of YouTube videos.

By default, the release version of this app contains no built-in videos, but the debug version comes with a set of Taiwan TV channels.

The list of videos can be edited, both at compile time and by the user, to substitute your own list of preferred videos.

## Building

+ Build using Xcode 13.0 or newer.
+ Runs on iOS 15 or later.
+ Optimized for iPad, but runs on iPhone.
+ You will have to update the "Team" and "Bundle Identifier".

## Running

Instructions for running the app can be found at https://jackpal.github.io/AmahTV/

## Open Source Software

The SwiftUI YouTube player wrapper code comes from https://github.com/SvenTiigi/YouTubePlayerKit

## Why isn't this app available in the App Store?

Apple App Store Review rejected the app because it allowed end users to embed arbitrary third-party YouTube videos.

Presumably Apple would approve a version of this app that contained a hard-coded list of videos, where permission had been obtained to embed each of the embedded videos.
