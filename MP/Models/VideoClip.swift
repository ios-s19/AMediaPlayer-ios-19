//  AMediaPlayer
//
//  Created by Tony Aiello on 5/4/19.
//  Copyright © 2019 Tony Aiello. All rights reserved.
//




import UIKit

class VideoClip: NSObject {
  let url: URL
  
  init(url: URL) {
    self.url = url
    super.init()
  }
  
  class func allClips() -> [VideoClip] {
    var clips: [VideoClip] = []
    
    // Add HLS Stream to the beginning of clip show
    
    
    let names = ["newYorkFlip-clip", "bulletTrain-clip", "monkey-clip", "shark-clip", "makebaclipiphone", "ragingclipiphone", "pagesclipiphone", "goliathclipiphone", "tomorrowclipiphone"]
    for name in names {
      let urlPath = Bundle.main.path(forResource: name, ofType: "mp4")!
      let url = URL(fileURLWithPath: urlPath)
      
      let clip = VideoClip(url: url)
      clips.append(clip)
    }

    return clips
  }
}
