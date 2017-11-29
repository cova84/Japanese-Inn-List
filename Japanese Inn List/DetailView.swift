//  DetailView.swift
//  Japanese Inn List
//
//  Created by 小林由知 on 2017/11/16.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.


import UIKit
import MapKit
import Foundation

class DetailView:UIViewController {//, UITableViewDataSource, UITableViewDelegateここのエラーはテーブルビュー設定後消えるはず。。。。
    //前の画面から受け取る為のプロパティ
    var getKeyDic = ""

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
        
//        print("getKeyDic:\(getKeyDic)")
        
        
//        //plistの読み込み02--------------------------------------------------------
//        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
//        let path = Bundle.main.path(forResource: "hotel_list_Detail", ofType: "plist")
//        //ファイルの内容を読み込んでディクショナリー型に格納
//        let dic = NSDictionary(contentsOfFile: path!)
//        //今画面に表示したいデータの取得
//        let detailInfo = dic![getKeyDic] as! NSDictionary
//        
//        //Dictionaryからキー指定で取り出すと必ずAny型になるので、ダウンキャスト変換が必要
//        print(detailInfo["description"]as! String)
//        print(detailInfo["image"]as! String)
//        print(detailInfo["latitude"]as! String)
//        print(detailInfo["longitude"]as! String)
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
