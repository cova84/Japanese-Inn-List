//
//  ThirdViewController.swift
//  Japanese Inn List
//
//  Created by 小林由知 on 2017/11/16.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//

import UIKit
import CoreData

class ThirdViewController: UIViewController {
    //,UITableViewDelegate,UITableViewDataSource
    
    //前の画面から受け取る為のプロパティ
    var getHotel = ""
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    //Favorite（内容を）格納する配列TabelViewを準備
    var contentHotel:[NSDictionary] = []  //Stringを修正
    var selectedCountry = String ()  //TODO:おそらくstring
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        //CoreDataを読み込む処理
//        read()
//    }
//    //すでに存在するデータの読み込み処理
//    func read() {
//
//        //一旦からにする（初期化）
//        contentHotel = []
//
//        //AppDelegateを使う用意をしておく
//        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        //エンティティを操作する為のオブジェクトを作成
//        let viewContext = appDelegate.persistentContainer.viewContext
//
//        //どのエンティティからデータを取得してくるか設定（Favoriteエンティティ）
//        let query:NSFetchRequest<Favorite> = Favorite.fetchRequest()
//
//        do{
//            //データを一括取得
//            let fetchResults = try viewContext.fetch(query)
//
//            //きちんと保存できてるか、１行ずつ表示（デバックエリア）
//            for result: AnyObject in fetchResults{
//                let hotel :String? = result.value(forKey:"hotel") as? String
//                let hotel :String? = result.value(forKey:"hotel") as? String
//
//                print("hotel:\(hotel!) hotel:\(hotel!) ")
//
//                let dic = ["hotel":hotel,"hotel":hotel] as [String : Any]
//
//                contentHotel.append(dic as NSDictionary)
//            }
//        }catch{
//        }
//        favoriteTabeleView.reloadData()
//    }
//
//
//    //リターンキーが押された時に発動
//    @IBAction func tapReturn(_ sender: UITextField) {
//    }
//
//    //追加ボタンを押された時発動
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
//        newRecord.setValue(getHotel.text, forKey: "hotel")  //hotel列に文字列をセット
//        newRecord.setValue(getHotel.text, forKey: "country")  //country列に文字列をセット
//
//        //レコード（行）の即時保存
//        do{
//            try viewContext.save()
//        }catch{
//            //エラーが出た時に行う処理を書いておく場所
//        }
//        //CoreDateからDataを読み込む
//        read()
//
//        //TabeleViewの再読み込み
//        favoriteTabeleView.reloadData()
//    }
//
//
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
//        }
//
//        //再読み込み
//        read()
//
//    }
//
//    //MARK:TabelView用処理
//    //行数の決定
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return contentHotel.count
//    }
//
//    //リストに表示する文字列を決定し、表示（cellForRowAtを検索）
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        //文字列を表示するセルの取得（セルの再利用）
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! customCellTableViewCell
//
//        //表示したい文字の設定（セルの中には文字、画像も入る）
//        var dic = contentHotel[indexPath.row] as! NSDictionary
//        cell.favoriteLabel.text = dic["hotel"] as! String
//
//        //文字を設定したセルを返す
//        return cell
//    }
//
//    //セルがタップされた時
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        var dic = contentHotel[indexPath.row] as! NSDictionary
//
//        selectedSaveDate = dic["saveDate"] as! Date
//
//        performSegue(withIdentifier: "showDetail", sender: nil)
//    }
//
//    //セグエのidentifierを指定して、画面移動
//    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
//
//        var dvc:DateViewController = segue.destination as! DateViewController
//        dvc.favoriteDate = selectedSaveDate
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
}

