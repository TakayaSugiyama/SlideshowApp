//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 杉山貴哉 on 2020/09/01.
//  Copyright © 2020 TakayaSugiyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideImage: UIImageView!
    
    var count = 0
    var timer: Timer!
    
    //画像を定義した配列
    let images: [String] = ["neko.png", "pien1.png", "pien2.png"]
    
    //進むボタン
    @IBOutlet weak var nextButtonLabel: UIButton!
    //戻るボタン
    @IBOutlet weak var backButtonLabel: UIButton!
    //再生/停止ボタン
    @IBOutlet weak var buttonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 呼び出した時に初期画像をセットする
        slideImage.image = UIImage(named: images[0])
    }
    
    //画像をスライドさせるボタン
    @IBAction func slideButton(_ sender: Any) {
        if self.timer == nil {
          //進むボタンと戻るボタンを無効化する
          nextButtonLabel.isEnabled = false
          backButtonLabel.isEnabled = false
          buttonLabel.setTitle("停止", for: .normal)
          self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage(_:)), userInfo: nil, repeats: true)
        }else{
          self.timer.invalidate()
          //進むボタンと戻るボタンを有効化にする
          nextButtonLabel.isEnabled = true
          backButtonLabel.isEnabled = true
          buttonLabel.setTitle("再生", for: .normal)
          self.timer = nil
        }
    }
    
   //スライドして画像を変更する
    @objc func changeImage(_ timer: Timer){
        count += 1
        if count > 2 {
           //初期化
           count = 0
        }
        slideImage.image = UIImage(named: images[count % 3])
    }

    //画像を進めるボタン
    @IBAction func nextButton(_ sender: Any) {
        count += 1
        if count > 2 {
           //初期化
           count = 0
        }
        slideImage.image = UIImage(named: images[count % 3])
    }
    
    //画像を戻すボタン
    @IBAction func backButton(_ sender: Any) {
        buttonLabel.isEnabled = true
        count -= 1
        if count < 0 {
          count = 2
        }
        slideImage.image = UIImage(named: images[count % 3])
    }
    
    //戻ってきた時に呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
    //画面を離れたら呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if timer != nil {
            self.timer.invalidate()
           //進むボタンと戻るボタンを有効化にする
            nextButtonLabel.isEnabled = true
            backButtonLabel.isEnabled = true
            buttonLabel.setTitle("再生", for: .normal)
            self.timer = nil
        }
        let nextVC:NextViewController = segue.destination as! NextViewController
        //画像の文字列を渡す
        nextVC.imageString = images[count % 3]
    }
    
    @IBAction func onTapAction(_ sender: Any) {
         performSegue(withIdentifier: "toNext", sender: nil)
    }
}

