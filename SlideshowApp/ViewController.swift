//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Tomohiro Kouketsu on 2017/05/16.
//  Copyright © 2017年 tomo_nos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageNum: UILabel!
    @IBOutlet weak var ShopInfo: UILabel!
    @IBOutlet weak var StartStopButtonLabel: UIButton!
    
    //変数:ボタン周り
    var timer: Timer!
    var timer_sec:Int = 0
    var timer_tmp:Int = 0
    var image_num:Int = 0
    
    //変数:画像呼び出し番号
    var iNum:Int = 0
    var image: UIImage?
    var tmp:Int = 0
    
    //変数:画像,店名の名前
    let imageName = ["rs_rmn_tanakaya.png", "rs_rmn_rokkando.png", "rs_rmn_hululu.png"]
    let shopInfo = ["支那そば 田中屋＠東池袋","麺屋 六感堂＠池袋","麺屋Hulu-lu(フルル)＠池袋"]
    
    //関数1:画像表示
    func imageShow(){
        //バンドルした画像ファイルの読み込み
        image = UIImage(named: imageName[timer_sec])
        //Image View に画像を表示
        //ImageView.contentModeScaleToFill = UIViewContentMode.center
        ImageView.image = image
    }
    //関数2:店舗情報表示
    func shopNameShow(){
        self.ShopInfo.text = String(shopInfo[timer_sec])
    }
    //関数3:画像枚数表示
    func shopNumber(){
        self.ImageNum.text =  String(timer_sec+1) + "/" + String(imageName.count)
    }
    //関数1+2+3:表示周りまとめ
    func Shows(){
        imageShow()
        shopNameShow()
        shopNumber()
    }
    
    //関数4:スライドショー用カウントアップ
    func updateTimer(timer: Timer) {
        if self.timer_sec < 2 {
            self.timer_sec += 1
            Shows()
        } else {
            self.timer_sec = 0
            Shows()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer_sec = timer_tmp
        Shows()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "tapResult" {
            //segueから遷移先SecondViewControllerを取得
            let result1:SecondViewController = segue.destination as! SecondViewController
            //遷移先SecondViewCont~で宣言のimageに代入
            result1.image = ImageView.image
            //result1.imageNum = timer_sec
            //timer_tmp = timer_sec
            
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
            if self.timer != nil {
                self.timer.invalidate()   // 現在のタイマーを破棄する
                self.timer = nil
                StartStopButtonLabel.setTitle("再生", for: .normal)
            }
        }
    }

    //画像タップ
    @IBAction func Tapimage(_ sender: Any) {
        //セグエを使用して画面を遷移
        performSegue(withIdentifier: "tapResult",sender: nil)
    }
    //戻るボタン
    @IBAction func BackButton(_ sender: Any) {
        if self.timer_sec > 0 && self.timer == nil {
            self.timer_sec -= 1
            Shows()
        } else if self.timer_sec == 0  && self.timer == nil {
            self.timer_sec = 2
            Shows()
        }
    }

    //再生/停止ボタン
    @IBAction func StartStopButton(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            StartStopButtonLabel.setTitle("停止", for: .normal)
        } else {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil
            StartStopButtonLabel.setTitle("再生", for: .normal)
        }
    }
    
    //進むボタン
    @IBAction func NextButton(_ sender: Any) {
        if self.timer_sec < 2 && self.timer == nil {
            self.timer_sec += 1
            Shows()
        } else if self.timer_sec == 2 && self.timer == nil {
            self.timer_sec = 0
            Shows()
        }
    }
    @IBAction func unwind(segue: UIStoryboardSegue){
    }
}

