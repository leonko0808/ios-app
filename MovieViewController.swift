//
//  MovieViewController.swift
//  EstherAndLeon
//
//  Created by 葛洪亮 on 2022/7/28.
//

import UIKit
import AVKit
class MovieViewController: UIViewController {
    var movieController:AVPlayerViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "淡水行"
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    fileprivate func setupView(){
        if let path = Bundle.main.path(forResource: "淡水行", ofType: "MP4"){
            let movieURL = URL(fileURLWithPath: path)
            let player  = AVPlayer(url: movieURL)
            player.actionAtItemEnd = .none
            
            movieController = AVPlayerViewController()
            movieController?.player = player
            movieController?.view.frame = view.bounds
            movieController?.showsPlaybackControls = false
            movieController?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            movieController?.player?.play()
            movieController?.view.alpha = 0
            view.addSubview(movieController!.view)
            UIView.animate(withDuration: 3, animations: {self.movieController?.view.alpha = 1})
            
        }
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
