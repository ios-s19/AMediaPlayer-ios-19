//  AMediaPlayer
//
//  Created by Tony Aiello on 5/4/19.
//  Copyright © 2019 Tony Aiello. All rights reserved.
//

// I researched a few media player tutorials, some very old, some new, some with Youtube
// In addition to the concepts we learned in class (i.e. cell reuse, table views, etc)
// one of the informative utils came from this tutorial
//
// raywenderlich.com/5191-video-streaming-tutorial-for-ios-getting-started
//
// With that tutorial, I continued to build out the app using the AVFoundation package
// and the AVPlayer to manage the playback of an AV source.
// I started with a streaming radio app idea using genres. We did that in the previous android class.
// I wanted to make this a little more exciting. At first, I wanted album art, then playing a radio
// stream or mp3 file seemed ridiculously easy with what I was building.  So, I decided to incorporate
// video and make it more of a challenge.
//
//

// I found other helpful information at  appcoda.com/youtube-api-ios-tutorial/
//
//    and
// developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/MediaPlaybackGuide/Contents/Resources/en.lproj/GettingStarted/GettingStarted.html#//apple_ref/doc/uid/TP40016757-CH10-SW2


// It should be noted a different viewer is required to embed YouTube videos
//
// Instead of streaming from YouTube, I hosted my own remote videos on my server
// and streamed them under an https protocol inside of the AVPlayer.
// I was surprised at how the AVFoundation's player managed the stream
// and it's buffering.  It's a very nice library to use to build a media player.
//
// There is also a helper library for handling YouTube videos. But, I didn't have time to
// fix the bugs to incorporate that.
//
// For this project, I made class variables to hold information about a video or audio object
// its thumbnail location, it's filename or streaming resource location, and the media type, and such.
//
//
// Ideally, I wanted to store the list of video objects as a JSON in a remote file.  This way, the
// app could read the list from the remote server, or a cloud or Google Drive file, and display a totally different
// playlist, controlled remotely with this file.
//
// For now, the music playlist and other video information and URLs are stored locally and hard coded in.
//
// Clips and artwork for the remote videos are included locally, but this could be pulled from a URL also.
// 
// 


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    
    let feed = VideoFeedViewController()
    feed.videos = Video.allVideos()
    // feed.videos = Video.localVideos()
    feed.title = "Streaming Media Player"
    
    let nav = UINavigationController(rootViewController: feed)
    nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 22)!]

    // Make this view the root view
    // Everything is going to be done programmatically
    
    window?.rootViewController = nav
    window?.makeKeyAndVisible()

    return true
  }
}

