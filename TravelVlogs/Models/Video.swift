

import UIKit

class Video: NSObject {
  let url: URL
  let thumbURL: URL
  let title: String
  let subtitle: String

  init(url: URL, thumbURL: URL, title: String, subtitle: String) {
    self.url = url
    self.thumbURL = thumbURL
    self.title = title
    self.subtitle = subtitle
    super.init()
  }
  
  class func localVideos() -> [Video] {
    var videos: [Video] = []
    let names = ["newYorkFlip", "bulletTrain", "monkey", "shark"]
    let titles = ["New York Flip", "Bullet Train Adventure", "Monkey Village", "Robot Battles"]
    let subtitles = ["Can this guys really flip all of his bros? You'll never believe what happens!",
                     "Enjoying the soothing view of passing towns in Japan",
                     "Watch as a roving gang of monkeys terrorizes the top of this mountain!",
                     "Have you ever seen a robot shark try to eat another robot?"]
    
    for (index, name) in names.enumerated() {
      let urlPath = Bundle.main.path(forResource: name, ofType: "mp4")!
      let url = URL(fileURLWithPath: urlPath)
      let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
      let thumbURL = URL(fileURLWithPath: thumbURLPath)
      
      let video = Video(url: url, thumbURL: thumbURL, title: titles[index], subtitle: subtitles[index])
      videos.append(video)
    }
    return videos
  }

    class func radioStations() ->[Video] {
 
        var videos: [Video] = []
        let names = ["alternative", "jazz", "rock", "top-40", "dance"]
        let titles = ["Alternative", "Jazz", "Rock", "Top-40", "Dance"]
        let subtitles = ["Alternative Hits Radio Station",
                         "Smooth Jazz Radio",
                         "Rock-on Rock Music Radio",
                         "Top-40 Pop Radio Station", "Club Dance Music"]
        let urls = ["alternativeURL", "JazzURL", "RockURL", "Top-40URL", "DanceURL"]
        
        for (index, name) in names.enumerated() {
            let videoURLString = urls[index]
            let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
            let thumbURL = URL(fileURLWithPath: thumbURLPath)
            if let url = URL(string: videoURLString) {
                let remoteVideo = Video(url: url, thumbURL: thumbURL, title: titles[index] , subtitle: subtitles[index])
                    videos.append(remoteVideo)
                }
        }
        
    return videos
    }
        
    
    class func allVideos() ->[Video] {
        var videos1 = radioStations()
        var videos2 = localVideos()
        var videos = videos1 + videos2
        return videos
    }
    
    
    
}

