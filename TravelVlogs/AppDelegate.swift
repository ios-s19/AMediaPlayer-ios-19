

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    
    let feed = VideoFeedViewController()
    feed.videos = Video.allVideos()
    // feed.videos = Video.localVideos()
    feed.title = "Videos"
    
    let nav = UINavigationController(rootViewController: feed)
    nav.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.red,
                                             NSAttributedStringKey.font: UIFont(name: "Roboto-Bold", size: 21)!]
    

    window?.rootViewController = nav
    window?.makeKeyAndVisible()
    
    return true
  }
}

