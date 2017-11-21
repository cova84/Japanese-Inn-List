//  DetailView.swift
//  Japanese Inn List
//
//  Created by 小林由知 on 2017/11/16.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//


////コピー済み/////////////////////////////////////////////////////
import UIKit
import MapKit
import Foundation

class DetailView: UIViewController {
    //前の画面から受け取る為のプロパティ
    var getAreaName = ""
    
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelComment: UITextView!
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBAction func tapFacorites(_ sender: UIButton) {
    }
    @IBOutlet weak var hotelMap: MKMapView!
    @IBOutlet weak var hotelAddress: UITextView!
    @IBOutlet weak var hotelDetail: UITableView!
    @IBOutlet weak var hotelReservationWay: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("getAreaName:\(getAreaName)")
//        
//        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
//        let filePath = Bundle.main.path(forResource: "areaList", ofType: "plist")
//
//        //ファイルの内容を読み込んでディクショナリー型に格納(文字列や数値をキーにして値を格納したり参照できる型)
//        let dic = NSDictionary(contentsOfFile: filePath!)
//
//        //今画面に表示したいデータの取得
//        let detailInfo = dic![getAreaName] as! NSDictionary
//
//        //Dictionaryからキー指定で取り出すと必ずAny型になるので、ダウンキャスト変換が必要
//        print(detailInfo["description"]as! String)
//        print(detailInfo["image"]as! String)
//        print(detailInfo["latitude"]as! String)
//        print(detailInfo["longitude"]as! String)
//
//        //タイトル
//        hotelName.text = getAreaName
//
//        //タイトルを、ナビゲーションバーの真ん中に表示
//        navigationItem.title = getAreaName
//
//        //説明
//        hotelComment.text = detailInfo["description"] as! String
//        hotelComment.sizeToFit() // 文字数に合わせて縦に伸びます。
//
//
//        //画像
//        hotelImageView.image = UIImage(named:detailInfo["image"] as! String)
//
//        //地図
//        let latitude = detailInfo["latitude"] as! String
//        let longitude = detailInfo["longitude"] as! String
//
//        // 座標オブジェクト
//        //型変換が必要。String型〜Double型へ。atof()でくくると変わる。
//        let coodineate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
//
//        //縮尺を設定
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//
//        //範囲オブジェクトを作成
//        let region = MKCoordinateRegionMake(coodineate, span)
//
//        //地図にセット
//        hotelMap.setRegion(region,animated: true)
//
//        // 1.pinオブシェクトを生成（）内は不要
//        let myPin = MKPointAnnotation()
//
//        // 2.pinの座標を設定
//        myPin.coordinate = coodineate
//
//        // 3.タイトル、サブタイトルを設定（タップした時に出る、吹き出しの情報）
//        myPin.title = "\(getAreaName)"
//        myPin.subtitle = "\(description)"
//
//        // 4.mapViewにPinを追加
//        hotelMap.addAnnotation(myPin)
        
    }
    
    //myTextViewの表示を一番上から始めるコート
    var contentOffset = CGPoint.zero
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        hotelComment.contentOffset = contentOffset //set
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        contentOffset = hotelComment.contentOffset //keep
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
