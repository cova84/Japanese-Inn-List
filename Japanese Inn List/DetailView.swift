//  DetailView.swift
//  Japanese Inn List
//
//  Created by 小林由知 on 2017/11/16.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//


import UIKit
import MapKit
import Foundation

class DetailView:UIViewController {//ここのエラーはテーブルビュー設定後消えるはず。。。。
//, UITableViewDataSource, UITableViewDelegate
    
//    //前の画面から受け取る為のプロパティ
//    var getAreaName = ""
    
    var sampleHotekDic = [ "ID" :  "002",  "kind" : "ホテル",  "continent" : "北アメリカ",  "country" : "アメリカ",  "hotelName" : "The One Hundred",  "image" : "5",  "address" : "100 Fort Greene Pl, Brooklyn, NY 11217-1419",  "map" : "40.686535, -73.976661",  "latitude" : "40.686535",  "longitude" : "-73.976661",  "accommodation" : "スタンダード・タイプ\nお一人様ご利用◆140ドル\nお二人様ご利用◆180ドル\n\nスイート・タイプ\nお一人様ご利用◆210ドル\nお二人様ご利用◆250ドル",  "rooms" : "5",  "wifi" : "あり",  "pickup" : "車両の手配を依頼可能",  "equipment" : "バス、トイレ、キッチン、ランドリー、無料電話など",  "reservation" : "HP",  "reservation_URL" : "http://www.theonehundred.com/request.htm",  "tel" : "日本コールセンター : 06-6850-1319\nザ・ワンハンドレト：718-624-8313",  "email" : "info@theonehundred.com",  "url" : "http://www.theonehundred.com/index.htm",  "comment" : "ザ･ワンハンドレッドは、ホテルのようなクオリティーを保ちながら おしゃれな友人宅を訪れているような安心感と快適さのある滞在をしていただこうという考えではじめた ベッド・アンド・ブレックファーストです。 ",  "red" : "246",  "green" : "49",  "blue" : "241" ]

    
//宿情報タイトル〜住所-----------------------------------------------------------------------
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelComment: UITextView!
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBAction func tapFacorites(_ sender: UIButton) {
    }
    @IBOutlet weak var hotelMap: MKMapView!
    @IBOutlet weak var hotelAddress: UITextView!
    @IBOutlet weak var hotelDetail: UITableView!
    @IBOutlet weak var hotelReservationWay: UITableView!
////詳細情報-----------------------------------------------------------------------
    @IBOutlet weak var detailedInfoTableView: UITableView!
////予約方法-----------------------------------------------------------------------
    @IBOutlet weak var resavationTabelView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//        //ホテル名
//        hotelName.text = "hotelName"
//        //紹介コメント
//        hotelComment.text = detailInfo["comment"] as! String
//        hotelComment.sizeToFit()          // 文字数に合わせて縦に伸びます。
//        //画像
//        hotelImageView.image = UIImage(named:detailInfo["image"] as! String)
    
    //TODO:02お気に入りに追加のコード必要-------------------------------------------------
    
//        //地図
//        let latitude = detailInfo["latitude"] as! String
//        let longitude = detailInfo["longitude"] as! String
//        //住所
//        hotelAddress.text = detailInfo["address"] as! String
//        hotelAddress.sizeToFit() // 文字数に合わせて縦に伸びます。

    
//        // 座標オブジェクト
//        //型変換が必要。String型〜Double型へ。atof()でくくると変わる。
//        let coodineate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
//        //縮尺を設定
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        //範囲オブジェクトを作成
//        let region = MKCoordinateRegionMake(coodineate, span)
//        //地図にセット
//        hotelMap.setRegion(region,animated: true)
//        // 1.pinオブシェクトを生成（）内は不要
//        let myPin = MKPointAnnotation()
//        // 2.pinの座標を設定
//        myPin.coordinate = coodineate
//        // 3.タイトル、サブタイトルを設定（タップした時に出る、吹き出しの情報）
//        myPin.title = "\(getAreaName)"
//        myPin.subtitle = "\(description)"
//        // 4.mapViewにPinを追加
//        hotelMap.addAnnotation(myPin)

    //TODO:03テーブルビューの設定--------------------------------------------------------------------
//    //2.行数の設定無しにする？？？？
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //okayu　１行追加したので、ここに１を足さないといけない
//        return (proArray.count + 1)
//    }
//
//    //3.リストに表示する文字列
//    //indexPath 行番号とかいろいろ入っている　セルを指定する時によく使う
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //文字列を表示するせるの取得（セルの再利用)
//
//        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell_red", for: indexPath)
//        cell1.textLabel?.text = "プログラム配列の表示"
//
//        //表示したい文字の設定（セルの中には文字、画像も入る）
//        cell1.textLabel?.font = UIFont(name: "Futura", size: 10)
//        cell1.textLabel?.textColor = UIColor.black
//    }

//myTextViewの表示を一番上から始める
//    var contentOffset = CGPoint.zero
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        hotelComment.contentOffset = contentOffset //set
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        contentOffset = hotelComment.contentOffset //keep
//    }
    
    
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
