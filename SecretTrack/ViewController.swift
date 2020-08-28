//
//  ViewController.swift
//  SecretTrack
//
//  Created by Takeru Yufune on 2020/08/28.
//  Copyright © 2020 Takeru Yufune. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {
    
    var player: MPMusicPlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = MPMusicPlayerController.systemMusicPlayer
        
        /* リピートしない時
        player.repeatMode = .none
        player.stop()
        */
        
        
    }
    
    @IBAction func selectButton(_ sender: Any) {
        
        let select = MPMediaPickerController()
        // delegate設定
        select.delegate = self
        // 複数選択不可に設定
        select.allowsPickingMultipleItems = false
        // View
        present(select, animated: true, completion: nil)
    }
    
    // ピッカーでアイテムを選択完了した時呼ばれる
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        
        // 選択した曲をplayerにセット
        player.setQueue(with: mediaItemCollection)
        // 再生
        player.play()
        // ピッカーを閉じて破棄
        dismiss(animated: true, completion: nil)
    }
 
    
    // 選択がキャンセルされた時呼ばれる
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        dismiss(animated: true, completion: nil)
    }
 
    
    @IBAction func playButton(_ sender: Any) {
        player.play()
    }
    @IBAction func pauseButton(_ sender: Any) {
        player.pause()
    }
    @IBAction func stopButton(_ sender: Any) {
        player.stop()
    }


}

