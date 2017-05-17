//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by Tomohiro Kouketsu on 2017/05/17.
//  Copyright © 2017年 tomo_nos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var ImageView: UIImageView!

    //変数:画面1とやりとりするための画像,変数宣言
    var image: UIImage?
    var imageNum: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //ここで1枚目の画像,画像番号を渡したい
        //let imageNum2 = imageNum
        let image2 = image
        //Image View に画像を設定
        ImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5);
        ImageView.image = image2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
