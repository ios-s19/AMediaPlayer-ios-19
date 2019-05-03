

import UIKit
import AVKit

class VideoFeedViewController: UIViewController {
  var videos: [Video] = []
  
  let VideoCellReuseIdentifier = "VideoCell"
  let tableView = UITableView()
  
  let videoPreviewLooper = VideoLooperView(clips: VideoClip.allClips())
  
  override func viewWillAppear(_ animated: Bool) {
    
    super.viewWillAppear(animated)

    videoPreviewLooper.play()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    

    super.viewWillDisappear(animated)
    videoPreviewLooper.pause()
    
  }
}

extension VideoFeedViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoCellReuseIdentifier, for: indexPath) as? VideoTableViewCell else {
      return VideoTableViewCell()
    }
    cell.video = videos[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let video = videos[indexPath.row]
    return VideoTableViewCell.height(for: video)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
    // 1 from tutorial

    let video = videos[indexPath.row]
    
    // 2 from tutorial
    let videoURL = video.url
    let playerType = video.playerType
    
    
    if (playerType == "mp4") {
        print ("mp4 video selected")
    let player = AVPlayer(url: videoURL)
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player
    present(playerViewController, animated: true) {
        player.play()
    }
    }
    
    
    if (playerType == "youtube"){
        print("Youtube selection pressed")
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            present(playerViewController, animated: true) {
                player.play()
            }
        
    }
    
        
    }
    
    
    
    
  }


extension VideoFeedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videos.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}
