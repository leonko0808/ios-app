//
//  VedioViewController.swift
//  EstherAndLeon
//
//  Created by 葛洪亮 on 2022/7/27.
//

import UIKit
import AVFoundation
import AVKit
class VedioViewController: UIViewController {
    
    let player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileUrl = Bundle.main.url(forResource: "淡水行", withExtension: "MP4")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        playerViewController.player = player
        playerViewController.view.frame = view.bounds
        playerViewController.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        
        playerViewController.player?.play()
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
      if motion == .motionShake{
            guard let controller = storyboard?.instantiateViewController(withIdentifier: "AlertViewController") else { return }
            controller.modalTransitionStyle = .crossDissolve
            controller.modalPresentationStyle = .overCurrentContext
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBSegueAction func showVideo(_ coder: NSCoder) -> AVPlayerViewController? {
        playerViewController.player?.pause()
            let controller = AVPlayerViewController(coder: coder)
        let url = Bundle.main.url(forResource: "淡水行", withExtension: "MP4")
        controller?.player = AVPlayer(url: url!)
        controller?.player?.play()
        return controller
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
