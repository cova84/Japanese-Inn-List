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
    
//json値参考
//{ ""ID"" :  ""001"",  ""kind"" : ""ホームステイ"",  ""continent"" : ""北アメリカ"",  ""country"" : ""アメリカ"",  ""hotelName"" : ""LAオレンジグローブ"",  ""image"" : 5,  ""address"" : ""住所などはご予約時お知らせ。（※地図は参考程度にお使いください。）"",  ""map"" : ""だいたい"",  ""latitude"" : """",  ""longitude"" : """",  ""accommodation"" : ""鍵付き個室　""限定１部屋のみ\n1名様目　$98/日\n2名様目　$39/日\n3名様目　$19/日\n※３連泊以上の料金",  ""room"" : ""1"",  ""wifi"" : ""あり"",  ""pickup"" : ""無料"",  ""equipment"" : ""バス、トイレ、キッチン、洗濯機、乾燥機など"",  ""reservation"" : ""メール"",  ""reservation_URL"" : """",  ""tel"" : ""アメリカ国内：（８８８）２３２ー１０８９ 海外より：（８０２）８７５ー２３４６"",  ""email"" : ""booking@losnioideyo.com or tom8hiro@yahoo.co.jp"",  ""url"" : ""http://www.losnioideyo.com"",  ""comment"" : ""鍵付き個室＋専用バス・トイレのパーソナルな空間を優先したホームステイ。治安がちょっと心配なロサンゼルスでも駅から徒歩１分の安全な駅前滞在。"",  ""red"" : ""248"",  ""green"" : ""49"",  ""blue"" : ""98"" }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //HotelListMacro.jsonを読み込み、取得したデータを使ってデバックアリアに表示
//        @IBAction func HotelListMacro(_ sender: UIButton) {
        
            //HotelListMacro.jsonを読み込む
            var filePath = Bundle.main.path(forResource: "HotelListMacro", ofType: "json")
            
            //Data型（人が読めない形式）でデータを取得
            var jsondata = NSData(contentsOfFile: filePath!)
            
            //配列データに変換
            var jsonDictionary = (try! JSONSerialization.jsonObject(with:Data.init(referencing: HotelListMacro!))) as! Array<Any>
            
            //配列の中身を高速
            for dat in jsonDictionary{
                
                //Any型からDictionary型へ変換　！！超重要！！
                var dic = dat as! NSDictionary
                
                //辞書の中身を取り出す
                var name = dic["name"] as! String
                var price = dic["price"] as! Int
                
                print("\(name)の値段は\(price)ペソです")
                //print("\(dat["name"])の値段は\(dat["price"])ペソです")
            }
        }
        
//        //ホテル名
//        hotelName.text = "hotelName"
//        //紹介コメント
//        hotelComment.text = detailInfo["comment"] as! String
//        hotelComment.sizeToFit() // 文字数に合わせて縦に伸びます。
//        //画像
//        hotelImageView.image = UIImage(named:detailInfo["image"] as! String)
//        //お気に入りに追加のコード必要^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
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
//
    
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
