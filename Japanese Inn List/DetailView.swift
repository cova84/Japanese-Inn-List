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

    //テーブルビュー２つ
    //    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //
    //        if tableView.tag == 1 {
    //            return 2
    //        }
    //
    //        return 1
    //    }

    
    //3.リストに表示する文字列
    //indexPath 行番号とかいろいろ入っている　セルを指定する時によく使う
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //文字列を表示するせるの取得（セルの再利用)
        //okayu indexPath.rowが0からproArray.countまで、１行ずつ設定されるメソッド
        //okayu　　　今回はindexPath.rowで切りかえしてみたけれど、セクションで分ける手もあるかも
        
        switch indexPath.row {
        case 1:
            let cell_G01 = tableView.dequeueReusableCell(withIdentifier: "Cell_G01", for: indexPath)
            cell_G01.textLabel?.text = "宿泊費（詳細の金額プランはHPからご確認ください。）"
            return cell_G01
        
        default:
            let cell_W01 = tableView.dequeueReusableCell(withIdentifier: "Cell_W01", for: indexPath)
            cell_W01.textLabel?.text = getKeyDic["accommodation"] as! String
            return cell_W01

//            let cell_G01 = tableView.dequeueReusableCell(withIdentifier: "Cell_G01", for: indexPath)
//            cell_G01.textLabel?.text = ""
//
//            let cell_W01 = tableView.dequeueReusableCell(withIdentifier: "Cell_W01", for: indexPath)
//            cell_W01.textLabel?.font = UIFont(name: "Futura", size: 10)
//            cell_W01.textLabel?.textColor = UIColor.black
//            cell_W01.textLabel?.text = getKeyDic["accommodation"] as! String
//
//            let cell_G02 = tableView.dequeueReusableCell(withIdentifier: "Cell_G02", for: indexPath)
//            cell_G02.textLabel?.text = ""
//
//            let cell_W02 = tableView.dequeueReusableCell(withIdentifier: "Cell_W02", for: indexPath)
//            cell_W02.textLabel?.text = getKeyDic["rooms"] as! String
//
//            let cell_G03 = tableView.dequeueReusableCell(withIdentifier: "Cell_G03", for: indexPath)
//            cell_G03.textLabel?.text = ""
//
//            let cell_W03 = tableView.dequeueReusableCell(withIdentifier: "Cell_W03", for: indexPath)
//            cell_W03.textLabel?.text = getKeyDic["wifi"] as! String
//
//            let cell_G04 = tableView.dequeueReusableCell(withIdentifier: "Cell_G04", for: indexPath)
//            cell_G04.textLabel?.text = ""
//
//            let cell_W04 = tableView.dequeueReusableCell(withIdentifier: "Cell_W04", for: indexPath)
//            cell_W04.textLabel?.text = getKeyDic["pickup"] as! String
//
//            let cell_G05 = tableView.dequeueReusableCell(withIdentifier: "Cell_G05", for: indexPath)
//            cell_G05.textLabel?.text = ""
//
//            let cell_W05 = tableView.dequeueReusableCell(withIdentifier: "Cell_W05", for: indexPath)
//            cell_W05.textLabel?.text = getKeyDic["equipment"] as! String
            
        }
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
