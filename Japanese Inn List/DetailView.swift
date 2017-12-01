//  DetailView.swift
//  Japanese Inn List
//
//  Created by 小林由知 on 2017/11/16.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.


import UIKit
import MapKit
import Foundation

class DetailView:UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //plistの読み込み01--------------------------------------------------------
    //選択されたエリア名を保存するメンバ変数。前の画面から受け取る為のプロパティ
    var getKeyDic = NSDictionary()
    var keyList:[String] = []
    var dataList:[NSDictionary] = []

//宿情報タイトル〜住所-----------------------------------------------------------------------
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelComment: UITextView!
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBAction func tapFacorites(_ sender: UIButton) {
    }
    @IBOutlet weak var hotelMap: MKMapView!
    @IBOutlet weak var hotelAddress: UITextView!

////詳細情報-----------------------------------------------------------------------
    @IBOutlet weak var detailedInfoTableView: UITableView!
////予約方法-----------------------------------------------------------------------
    //@IBOutlet weak var resavationTabelView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("getKeyDic:\(getKeyDic)")
        
        //plistの読み込み02--------------------------------------------------------
        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
        let path = Bundle.main.path(forResource: "hotel_list_Detail", ofType: "plist")
        
        //ホテル名
        hotelName.text = getKeyDic["hotelName"] as! String
        //紹介コメント
        hotelComment.text = getKeyDic["comment"] as! String
        hotelComment.sizeToFit()          // 文字数に合わせて縦に伸びます。
        //TODO:01 画像を５枚入れてスワイプで切り替えたい(ライブラリ探し中)
//        hotelImageView.image = UIImage(named:getKeyDic["image"] as! String)
        

    //TODO:02 お気に入りに追加のコード必要-------------------------------------------------
        //地図
        let latitude = getKeyDic["latitude"] as! String
        let longitude = getKeyDic["longitude"] as! String

        // 座標オブジェクト
        //型変換が必要。String型〜Double型へ。atof()でくくると変わる。
        let coodineate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.05, 0.05)
        //範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coodineate, span)
        //地図にセット
        hotelMap.setRegion(region,animated: true)
        // 1.pinオブシェクトを生成（）内は不要
        let myPin = MKPointAnnotation()
        // 2.pinの座標を設定
        myPin.coordinate = coodineate
        // 3.タイトル、サブタイトルを設定（タップした時に出る、吹き出しの情報）
        myPin.title = "\(hotelName)"
        // 4.mapViewにPinを追加
        hotelMap.addAnnotation(myPin)

        //住所
        hotelAddress.text = getKeyDic["address"] as! String
        hotelAddress.sizeToFit() // 文字数に合わせて縦に伸びます。

    }

    //TODO:03テーブルビューの設定--------------------------------------------------------------------
    //2.行数の設定無しにする？？？？
    var detailedInfoTableView_cell = 10
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailedInfoTableView_cell

        //okayu　１行追加したので、ここに１を足さないといけない
        //return (proArray.count + 1)
    }

    //3.リストに表示する文字列
    //indexPath 行番号とかいろいろ入っている　セルを指定する時によく使う
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //文字列を表示するせるの取得（セルの再利用)
        //okayu indexPath.rowが0からproArray.countまで、１行ずつ設定されるメソッド
        //okayu　　　今回はindexPath.rowで切りかえしてみたけれど、セクションで分ける手もあるかも
        
        switch indexPath.row {
        case 0:
            //okayu １行目はindexPath.row=0 なので、0の時に、.textをプログラム配列の表示
            //okayu このすぐ下の行は、caseでわけなくても良いけれどヒントで出してしまったので入れておく。
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell_red", for: indexPath)
            cell1.textLabel?.text = "プログラム配列の表示"
            
            //表示したい文字の設定（セルの中には文字、画像も入る）
            cell1.textLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
            cell1.textLabel?.textColor = UIColor.white
            return cell1
            
        default:
            //okayu　２行目以降はproArrayをはめる。
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell_blue", for: indexPath)
            cell1.textLabel?.text = proArray[indexPath.row - 1]
            
            //表示したい文字の設定（セルの中には文字、画像も入る）
            cell1.textLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
            cell1.textLabel?.textColor = UIColor.white
            return cell1
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1 {
            return 2
        }
        
        return 1
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
