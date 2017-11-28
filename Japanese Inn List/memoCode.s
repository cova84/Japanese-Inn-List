    //plistの読み込み01--------------------------------------------------------
    //選択されたエリア名を保存するメンバ変数
    var selectedName = ""
    var keyList:[String] = []
    var dataList:[NSDictionary] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ディクショナリーから、RGBの取り出し
        //plistの読み込み02--------------------------------------------------------
        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
        let path = Bundle.main.path(forResource: "hotel_list_Detail", ofType: "plist")
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile: path!)
        let dic001 = dic!["001"]! as! NSDictionary
        //座標オブジェクト //地図
        let red = dic001["red"] as! String
        let green = dic001["green"] as! String
        let blue = dic001["blue"] as! String
        
        //色を変更する
        imageviewBackground.backgroundColor = UIColor(
        red:CGFloat(atof(red)/255.0)
        , green:CGFloat(atof(green)/255.0)
        , blue:CGFloat(atof(blue)/255.0)
        , alpha: 1.0
        )
    }


    
    
    //plistの読み込み01--------------------------------------------------------
    //選択されたエリア名を保存するメンバ変数
    var selectedName = ""
    var keyList:[String] = []
    var dataList:[NSDictionary] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //plistの読み込み02--------------------------------------------------------
        //ファイルパスを取得（エリア名が格納されているプロパティリスト）
        let path = Bundle.main.path(forResource: "hotel_list_Detail", ofType: "plist")
        //ファイルの内容を読み込んでディクショナリー型に格納
        let dic = NSDictionary(contentsOfFile: path!)
        
        //TableView で扱いやすい配列の形(エリア名の入っている配列)を作成
        for (key,data) in dic! {
            
            //            print(key)
            //            print(data)
            keyList.append(key as! String)
            let detailInfo = dic![key] as! NSDictionary
            /* NSDictionaryからキー指定で取り出すと必ずAnyになるので、Dictionary型だと教えてやらないといけないので、ダウンキャスト必須 */
            
            dataList.append(detailInfo)
            
        }
    }




//ピンを画像に変更
//MKPinAnnotationViewをMKAnnotationViewに変えると画像に変更可能
//pinView.image = [UIImage imageNamed: "infoLink.jpg"];

//ピンをテキストに変更
//MKAnnotationViewをMKPinAnnotationViewに変えるとピン編集可能
//pinView?.image = UIImage(named: "Laugh")

