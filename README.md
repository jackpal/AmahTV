# Amah TV

An easy-to-use player for playing a pre-configured list of YouTube videos.

By default, this app shows a set of Taiwan TV channels.

The list of videos can be edited to substitute your own list of preferred videos.

# Building

+ Build using Xcode 13.0 or newer.
+ Runs on iOS 15 or later.
+ Optimized for iPad, but runs on iPhone.
+ You will have to update the "Team" and "Bundle Identifier".

# Running

The app has two tabs:

+ TV - used to watch the videos.
+ Settings - used to set up a list of videos.


## TV tab

The TV tab, lets you choose a video to watch from a list of videos.

You can choose which video to watch by tapping on the video name in the "video bar" at the top of the screen. (If there is exactly one video in the list, then the video bar will not be shown.)

You can edit the list of videos using the Settings tab.

## Settings tab

The settings tab lets you add, edit, remove, and rearrange the list of videos available to your app.

### Adding a video

To add a video, tap on the [+] icon in the upper left corner. This displays an "Add Video" sheet with several fields and buttons:

+ "Add" is a button that will add the new video to the list of videos. The Add button will be greyed out until you have entered a name and a link.

+ "Cancel" is a button that will dismiss the "Add video" sheet without adding a video.

+ "Name" is a text field for the name of the video. The name can be anything you like. Keep the name short. Short names are easier to read in the user interface.

+ "YouTube link or video ID" is a text field for the "link" or "video ID" of the YouTube video. You can paste or type the desired link or Video ID of the channel here.

### Editing a video

To edit a video, tap on the video's name in the list of videos. This displays the "Edit video" form for that video.

+ "Name" is a text field for the name of the video. The name can be anything you like. Keep the name short. Short names are easier to read in the user interface.

+ "YouTube link or video ID" is a text field for the "link" or "video ID" of the YouTube video. You can paste or type the desired link or Video ID of the channel here.

### Removing a video

To remove a video, swipe left on the video's name in the list of videos, then tap on the revealed "Delete" button.

### Rearranging videos.

To rearrange the list of videos, tap on the "Edit" button at the top of the list of videos. Then drag the video names to the desired order, then tap the "Done" button.

# Hiding and showing the Settings Tab

You can hide or show the settings tab using the Settings application:

1. Launch the standard iOS "Settings" application.
2. Scroll down to the "Amah TV" entry.
3. Tap on the "Amah TV" entry.
4. Tap on the "Hide advanced features" toggle.

# FAQ

Q: What is the purpose of this app?

A: This app provides an easy-to-use video viewing experience for users who are not comfortable with the full YouTube user interface. An example would be someone like my mother-in-law, who has never used a computer or a smart phone, but who is interested in watching a specific set of YouTube channels. When she uses the regular YouTube app, she is frustrated by the complicated user inteface. By simplifying the user interface, this app makes it easier for her to watch just the content she wants to.

Q: Why the app name "Amah TV"?

A: Amah means grandmother in Mandarin Chinese. I wrote this app for my Chinese-American mother-in-law, who is called Amah by my kids.  She uses it to watch Taiwan cable TV channels that are streamed live on YouTube.

Q: Can I use this app to watch something besides Taiwan cable TV channels?

A: Yes, you can use the Settings tab to edit the list of videos. You can add any embeddable YouTube video.

Q: Can I use this app to watch US TV channels?

A: You cannot use this app to watch US TV channels. US TV channels are not currently available as plain embeddable YouTube videos. You will have to use a different app to watch them.

Q: How can I find YouTube videos to watch?

A: Use the regular YouTube app or the youtube.com web site to search for interesting videos. When you find a video you like, copy the link. Then use the Settings tab to edit the list of videos. You can paste the link into the "YouTube Link or Video ID" text field of the "Add video" and/or "Edit video" forms.

Q: How can I prevent "ads" from being shown?

A: Ads are a part of the YouTube embedded player, and cannot be disabled.

Q: How can I prevent "recommendations" from being shown at the end of videos?

A: Recommendations are a part of the YouTube embedded player, and cannot be disabled.

Q: Is this app compliant with the YouTube Terms of Service?

A: Yes, this app is compliant with the YouTube terms of service. It uses the standard YouTube embedded video player in a WebView.

# Open Source Software

The SwiftUI YouTube player wrapper code comes from https://github.com/SvenTiigi/YouTubePlayerKit
