//
//  SecondViewController.swift
//  Japanese Inn List
//
//  Created by 小林由知 on 2017/11/16.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    //plistの読み込み01--------------------------------------------------------
    //選択されたエリア名を保存するメンバ変数
    var selectedName = ""
    var keyList:[String] = []
    var dataList:[NSDictionary] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //はじめの世界地図表示----------------------------------------------------------------------------
        // 1.中心となる場所の座標オブジェクトを作成
        let coodineate = CLLocationCoordinate2DMake(35.658581,139.745433)
        // 2.縮尺を設定    (0.1, 0.1)で縮尺を指示(1, 1)が国全体
        let span = MKCoordinateSpanMake(50, 50)
        // 3.範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coodineate, span)
        // 4.MapViewに範囲オブジェクトを設定
        mapView.setRegion(region, animated: true)
        
        //plistの読み込み02--------------------------------------------------------
        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
        let path = Bundle.main.path(forResource: "hotel_list_Detail", ofType: "plist")
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile: path!)
        
        //TableView で扱いやすい配列の形(エリア名の入っている配列)を作成
        for (key,data) in dic! {
            
            print(key)
            print(data)
            keyList.append(key as! String)
            let detailInfo = dic![key] as! NSDictionary
            /* NSDictionaryからキー指定で取り出すと必ずAnyになるので、Dictionary型だと教えてやらないといけないので、ダウンキャスト必須 */
            
            dataList.append(detailInfo)
            
        }
        
        //今画面に表示したいデータの取得
        let detailInfo = dic![selectedName] as! NSDictionary
        
        //Dictionaryからキー指定で取り出すと必ずAny型になるので、ダウンキャスト変換が必要

        print(detailInfo["hotelName"]as! String)
        print(detailInfo["comment"]as! String)
        print(detailInfo["latitude"]as! String)
        print(detailInfo["longitude"]as! String)
        
        //ピン打ち作業------------------------------------------------------------
        //地図
        let hotelName = dic!["hotelName"] as! String
        let comment = dic!["comment"] as! String
        let latitude = dic!["latitude"] as! String
        let longitude = dic!["longitude"] as! String

        // 座標オブジェクト
        //型変換が必要。String型〜Double型へ。atof()でくくると変わる。
//        let coodineate = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))
        _ = CLLocationCoordinate2DMake(atof(latitude), atof(longitude))

        //地図にセット
        mapView.setRegion(region,animated: true)

        // 1.pinオブシェクトを生成（）内は不要
        let myPin = MKPointAnnotation()

        // 2.pinの座標を設定
        myPin.coordinate = coodineate

        // 3.タイトル、サブタイトルを設定（タップした時に出る、吹き出しの情報）
        myPin.title = "\(hotelName)"
        myPin.subtitle = "\(comment)"

        // 4.mapViewにPinを追加
        mapView.addAnnotation(myPin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

