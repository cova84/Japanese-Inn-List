//
//  FourthViewController.swift
//  Japanese Inn List
//
//  Created by 小林由知 on 2017/11/16.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBAction func tapLifeofLink(_ sender: UIButton) {
        print("https://www.google.co.jp/")
        
//        let url = URL(string: "https://www.google.co.jp/")!
//        if UIApplication.shared.canOpenURL(url) {
//            UIApplication.shared.open(url)
//        }
    }
    
//    @available(iOS 10.0, *)
//    open func open(_ url: URL, options: [String : Any] = [:], completionHandler completion: ((Bool) -> Swift.Void)? = nil){}
//    
//    let url = URL(string: "https://www.google.co.jp/")!
//    if UIApplication.shared.canOpenURL(url) {
//        UIApplication.shared.open(url, options: [:], completionHandler: {(isOpenSuccess) in
//            if isOpenSuccess {
//                print("\(url) を正常に開けました") //https://www.google.co.jp/ を正常に開けました
//            }
//        })
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

