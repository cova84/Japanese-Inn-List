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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アヤラを中心にした地図を表示（宿題にて３点の中心に変更）
        // 1.中心となる場所の座標オブジェクト（緯度経度の情報が必要）を作成
        let coodineate = CLLocationCoordinate2DMake(10.323429,123.924266)
        // 2.縮尺を設定    (0.1, 0.1)で縮尺を指示(1, 1)が国全体
        let span = MKCoordinateSpanMake(0.05, 0.05)
        // 3.範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coodineate, span)
        // 4.MapViewに範囲オブジェクトを設定
        mapView.setRegion(region, animated: true)
        
        
        //TODOここを関数で表現。Pリスト設定後///////////////////////////////////////////
        // アヤラの座標にピンを立てる
        let ayara = CLLocationCoordinate2DMake(10.317347,123.905759)
        // 1.pinオブシェクトを生成
        let centerPin1 = MKPointAnnotation()
        // 2.pinの座標を設定
        centerPin1.coordinate = ayara
        // 3.タイトル、サブタイトルを設定（タップした時に出る、吹き出しの情報）
        centerPin1.title = "アヤラ"
        // 4.mapViewにPinを追加
        mapView.addAnnotation(centerPin1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

