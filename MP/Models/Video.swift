

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

    class func mp4Videos() ->[Video] {
 
        var videos: [Video] = []
        let names = ["alternative", "jazz", "rock", "top-40", "dance"]
        let titles = ["Alternative", "Jazz", "Rock", "Top-40", "Dance"]
        let subtitles = ["Alternative Hits Radio Station",
                         "Smooth Jazz Radio",
                         "Rock-on Rock Music Radio",
                         "Top-40 Pop Radio Station", "Club Dance Music"]
        let urls = ["https://djtonya.net/v/mv/bsa.mp4", "https://djtonya.net/v/mv/city.mp4",  "https://djtonya.net/v/mv/cod.mp4", "https://djtonya.net/v/mv/cool.mp4", "https://djtonya.net/v/mv/fly.mp4"]
        
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
        
    class func playlistVideos() -> [Video] {
        let file = "https://djtonya.net/v/mv/dance.m3u"
        let fileURL = URL(fileURLWithPath: file)
        
        //reading
        do {
            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            print(text2)
        }
        catch {/* error handling here */}
        
        
            
        let videos = testmp4()
        
        return videos
    }
    
    
    
    class func testmp4() ->[Video] {
        
        var videos: [Video] = []
        let names = ["madonna", "blue", "tomorrowland", "pages", "city", "makeba", "cola", "offshore", "batman", "goliath", "raging", "superman"]
        let titles = ["Madonna & Maluma", "Above & Beyond", "TomorrowLand", "ATB Feat Haliene", "Alesso & Dirty South", "Jain", "CamelPhat & Elderbrook", "Stereojackers", "Batman The Ride", "Goliath", "Raging Bull", "Superman Ultimate Flight"]
        let subtitles = ["Medellin",
                         "Blue Sky Action",
                         "TomorrowLand After Movie",
                         "Pages", "City of Dreams", "Makeba", "Cola", "Offshore", "Front Row", "Back Row", "Front Row", "Front Row"]
        let urls = ["https://djtonya.net/v/mv/madonna.mp4", "https://djtonya.net/v/mv/blue.mp4",  "https://djtonya.net/v/mv/tomorrowland.mp4", "https://djtonya.net/v/mv/pages.mp4", "https://djtonya.net/v/mv/city.mp4", "https://djtonya.net/v/mv/makeba.mp4", "https://djtonya.net/v/mv/cola.mp4", "https://djtonya.net/v/mv/offshore.mp4", "https://djtonya.net/v/mv/rollercoasters/batman.mp4", "https://djtonya.net/v/mv/rollercoasters/goliath.mp4", "https://djtonya.net/v/mv/rollercoasters/raging.mp4", "https://djtonya.net/v/mv/rollercoasters/superman.mp4"]
        
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
//        let videos1 = videoStations()
//        let videos2 = localVideos()
        let videos = testmp4()
//        let videos = tonya
//        let videos = videos1 + videos2
//        let videos = playlistVideos()
        return videos
    }
    
    
    
}

