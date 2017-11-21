//
//  ThirdViewController.swift
//  Japanese Inn List
//
//  Created by 小林由知 on 2017/11/16.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//

import UIKit
import CoreData

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var favoriteTabeleView: UITableView!
    
    //Favorite（内容を）格納する配列TabelViewを準備
    var contentHotel:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //CoreDataからDataを読み込む処理
        read()
    }
    
    
    //すでに存在するデータやの読み込み処理
    func read() {
        
        //一旦からにする（初期化）
        contentHotel = []
        
        //AppDelegateを使う用意をしておく
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //エンティティを操作する為のオブジェクトを作成
        let viewContext = appDelegate.persistentContainer.viewContext
        
        //どのエンティティからデータを取得してくるか設定（Favoriteエンティティ）
        let query:NSFetchRequest<Favorite> = Favorite.fetchRequest()
        
        do{
            //データを一括取得
            let fetchResults = try viewContext.fetch(query)
            
            //きちんと保存できてるか、１行ずつ表示（デバックエリア）
            for result: AnyObject in fetchResults{
                let hotel :String? = result.value(forKey:"hotel") as? String
                let country :String? = result.value(forKey:"country") as? String
                
                print("hotel:\(hotel!) country:\(country!) ")
                
                contentHotel.append(hotel!)
            }
        }catch{
        }
    }
    
    
//お気に入りに追加ボタンを押された時、発動^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//    @IBAction func tapSave(_ sender: Any) {
//        //AppDelegateを使う用意をしておく（インスタンス化）
//        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        //エンティティを操作する為のオブジェクト作成
//        let viewContext = appDelegate.persistentContainer.viewContext
//
//        //Favoriteエンティティオブジェクトを作成
//        let Favorite = NSEntityDescription.entity(forEntityName: "Favorite", in: viewContext)
//
//        //Favoriteエンティティにレコード（行）を挿入する為のオブジェクトを作成
//        let newRecord = NSManagedObject(entity: Favorite!, insertInto: viewContext)
//
//        //値のセット
//        newRecord.setValue(txtHotel.text, forKey: "hotel")  //hotel列に文字列をセット
//        newRecord.setValue(txtCountry.text, forKey: "country")      //country列に現在日時をセット
//
//        //レコード（行）の即時保存
//        do{
//            try viewContext.save()
//        }catch{
//            //エラーが出た時に行う処理を書いておく場所
//        }
//        //countryからDataを読み込む
//        read()
//
//        //TabeleViewの再読み込み
//        favoriteTabeleView.reloadData()
//    }
    
    
//削除方法^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//    @IBAction func tapDelete(_ sender: UIButton) {
//
//        //AppDelegate使う準備をする（インスタンス化）
//        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        //エンティティを操作する為のオブジェクトを作成
//        let viewContext = appDelegate.persistentContainer.viewContext
//
//        //どのエンティティからデータを取得するか設定（Favoriteエンティティ）
//        let query:NSFetchRequest<Favorite> = Favorite.fetchRequest()
//
//
//        //削除したデータを取得（今回は全て取得）
//        do{
//            //削除するデータを取得(今回は全て)
//            let fetchResulte = try viewContext.fetch(query)
//
//            //１行ずつ（取り出した上で）削除
//            for result:AnyObject in fetchResulte{
//
//                //削除処理を行うために型変換
//                let record = result as! NSManagedObject
//                viewContext.delete(record)
//            }
//
//            //削除した状態を保存
//            try viewContext.save()
//
//        }catch{
//
//        }
//
//        //再読み込み
//        read()
//        favoriteTabeleView.reloadData()
//        //１行ずつ削除
//
//        //削除した状態
//
//    }
    
    //MARK:TabelView用処理
    //行数の決定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentHotel.count
    }
    
    //リストに表示する文字列を決定し、表示（cellForRowAtを検索）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //文字列を表示するセルの取得（セルの再利用）
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_Favorite", for: indexPath)
        
        //表示したい文字の設定（セルの中には文字、画像も入る）
        cell.textLabel?.text = contentHotel[indexPath.row]
        
        //文字を設定したセルを返す
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


