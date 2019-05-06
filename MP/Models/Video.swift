//  AMediaPlayer
//
//  Created by Tony Aiello on 5/4/19.
//  Copyright © 2019 Tony Aiello. All rights reserved.
//






import UIKit



class Video: NSObject {
    let url: URL
    let thumbURL: URL
    let title: String
    let subtitle: String
    let playerType: String
 

    init(url: URL, thumbURL: URL, title: String, subtitle: String, playerType: String) {
    self.url = url
    self.thumbURL = thumbURL
    self.title = title
    self.subtitle = subtitle
    self.playerType = playerType
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
      let playerType = "mp4"

      let url = URL(fileURLWithPath: urlPath)
      let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
      let thumbURL = URL(fileURLWithPath: thumbURLPath)
      
        let video = Video(url: url, thumbURL: thumbURL, title: titles[index], subtitle: subtitles[index], playerType: playerType)
        
      videos.append(video)
    }
    return videos
  }

        
    class func playlistVideos() -> [Video] {
        let file = "https://djtonya.net/v/mv/dance.m3u"
        let fileURL = URL(fileURLWithPath: file)
        
        // This section will probably not be written
        // So I am leaving this for future me to have fun with later
        //reading
        do {
            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            print(text2)
        }
        catch {/* error handling here */}
        
        
        // send something with an array of videos back - tmp placeholder
        
        let videos = remoteVideos()
        return videos
    }
    

    
    class func remoteVideos() ->[Video] {
        
        var videos: [Video] = []
        let names = ["tomorrowland", "blue",  "pages", "city", "makeba", "cola", "offshore", "madonna", "batman", "goliath", "raging", "superman"]
        let titles = ["TomorrowLand", "Above & Beyond",  "ATB Feat Haliene", "Alesso & Dirty South", "Jain", "CamelPhat & Elderbrook", "Stereojackers", "Madonna & Maluma", "Batman The Ride", "Goliath", "Raging Bull", "Superman Ultimate Flight"]
        let subtitles = ["TomorrowLand After Movie", "Blue Sky Action", "Pages", "City of Dreams", "Makeba", "Cola", "Offshore", "Medellin", "Front Row", "Back Row", "Front Row", "Front Row"]
        let urls = ["https://djtonya.net/v/mv/tomorrowland.mp4", "https://djtonya.net/v/mv/blue.mp4",   "https://djtonya.net/v/mv/pages.mp4", "https://djtonya.net/v/mv/city.mp4", "https://djtonya.net/v/mv/makeba.mp4", "https://djtonya.net/v/mv/cola.mp4", "https://djtonya.net/v/mv/offshore.mp4","https://djtonya.net/v/mv/madonna.mp4",  "https://djtonya.net/v/mv/rollercoasters/batmaniphone.mp4", "https://djtonya.net/v/mv/rollercoasters/goliathiphone.mp4", "https://djtonya.net/v/mv/rollercoasters/ragingiphone.mp4", "https://djtonya.net/v/mv/rollercoasters/supermaniphone.mp4"]
        
        for (index, name) in names.enumerated() {
            let videoURLString = urls[index]
            let playerType = "mp4"
            
            let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
            let thumbURL = URL(fileURLWithPath: thumbURLPath)
            if let url = URL(string: videoURLString) {
                let remoteVideo = Video(url: url, thumbURL: thumbURL, title: titles[index], subtitle: subtitles[index], playerType: playerType)
                videos.append(remoteVideo)
            }
        }
        
        return videos
    }
    
    class func allVideos() ->[Video] {
        let videos2 = localVideos()
        let videos1 = remoteVideos()
        let videos = videos1 + videos2
//        let videos = playlistVideos()
        return videos
    }
    
    
    
}

