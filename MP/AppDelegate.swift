//  AMediaPlayer
//
//  Created by Tony Aiello on 5/4/19.
//  Copyright © 2019 Tony Aiello. All rights reserved.
//

// I researched several tutorials, some very old, some new, some with Youtube
// The base one I learned a lot from started with this tutorial
// raywenderlich.com/5191-video-streaming-tutorial-for-ios-getting-started

// other tutorials includes appcoda.com/youtube-api-ios-tutorial/  and
// developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/MediaPlaybackGuide/Contents/Resources/en.lproj/GettingStarted/GettingStarted.html#//apple_ref/doc/uid/TP40016757-CH10-SW2


// It should be noted a different viewer is required to embed YouTube videos
//
// Instead, I hosted my own remote videos on my server
// and stream them under an https protocol
//
// Only the original tutorial travel blog videos are included in the local videos
// folder.  Clips and artwork for the remote videos are included locally.
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

