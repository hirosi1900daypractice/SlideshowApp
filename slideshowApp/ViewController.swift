//
//  ViewController.swift
//  slideshowApp
//
//  Created by 徳富博 on 2021/02/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    var selectedImage : UIImage?
    
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "1.jpg")!,
        UIImage(named: "2.jpg")!,
        UIImage(named: "3.jpg")!,
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageArray[nowIndex]
        if(timer == nil){
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }else{
            nextButton.isEnabled = false
            backButton.isEnabled = false
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toSecondController"){
            // segueから遷移先のResultViewControllerを取得する
            let secondController:SecondController = segue.destination as! SecondController
            // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
            selectedImage = imageArray[nowIndex]
            secondController.selectedImg = selectedImage
           
            
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        if(timer == nil){
            print(nowIndex)
            
            // indexが表示予定の画像の数と同じ場合
            if (nowIndex == 0) {
                nowIndex = imageArray.count
            }
            nowIndex -= 1
            
       
            // indexを増やして表示する画像を切り替える
            
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
            
        }else{
            return
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if (timer == nil){
            // indexを増やして表示する画像を切り替える
            nowIndex += 1
            
            // indexが表示予定の画像の数と同じ場合
            if (nowIndex == imageArray.count) {
                // indexを一番最初の数字に戻す
                nowIndex = 0
            }
            // indexの画像をstoryboardの画像にセットする
            imageView.image = imageArray[nowIndex]
        }else{
            return
        }
    }
    @IBAction func startButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            
            // タイマーをセットする
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            self.timer.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            self.timer = nil
            
            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
        }
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        
    }
    
    
}

