//  AMediaPlayer
//
//  Created by Tony Aiello on 5/4/19.
//  Copyright © 2019 Tony Aiello. All rights reserved.
//




import UIKit
import AVFoundation

class VideoLooperView: UIView {
    
    
    // private let player = AVQueuePlayer()
    
    @objc private let player = AVQueuePlayer()

    private var token: NSKeyValueObservation?

    
    let clips: [VideoClip]
    let videoPlayerView = VideoPlayerView()
  
    init(clips: [VideoClip]) {
    self.clips = clips
    
    super.init(frame: .zero)
    
    initializePlayer()
        
        
  }
  
    //
  
    required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
    
    private func initializePlayer() {
        videoPlayerView.player = player
        addAllVideosToPlayer()
        
        player.volume = 0.0
        player.play()
        
        token = player.observe(\.currentItem) { [weak self] player, _ in
            if player.items().count == 1 {
                self?.addAllVideosToPlayer()
            }
        }

    }
    
    
    private func addAllVideosToPlayer() {
        for video in clips {
            //1
            let asset = AVURLAsset(url: video.url)
            let item = AVPlayerItem(asset: asset)
            
            //2
            player.insert(item, after: player.items().last)
            
            
        }
    }
    
    
    
    func pause() {
        player.pause()
    }
    
    func play() {
        player.play()
    }

}
