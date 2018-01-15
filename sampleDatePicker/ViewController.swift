//
//  ViewController.swift
//  sampleDatePicker
//
//  Created by Eriko Ichinohe on 2018/01/15.
//  Copyright © 2018年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    //アプリが起動して画面が表示される時1回実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //選択肢の範囲を設定
        // DateFormatterを使って文字型から日付型に変換する
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        
        //選択可能な最小値（最も日付が過去のもの）を決定（2018/01/01)
        myDatePicker.minimumDate = df.date(from: "2018/01/01")
        
        //選択可能な最大値（最も日付が未来のもの）を決定（2018/12/31)
        myDatePicker.maximumDate = df.date(from: "2018/12/31")
        
        //初期値を設定
        myDatePicker.date = df.date(from: "2018/01/21")!
        
    }

//    DatePickerの選択された日付が変更された時発動
    @IBAction func changeDate(_ sender: UIDatePicker) {
        
        //選択されている日付をデバッグエリアに表示
        print(sender.date)
        
        //日付のフォーマットを設定
        //初期化
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        
//        df = DateFormatter() 定数そのものに再代入はエラー
        
        //時差補正（日本時間に設定）
        //identifierの部分はSwiftで定義されている地域コード
        df.locale = Locale(identifier: "ja_JP")
        
        let strDate = df.string(from: sender.date)
        
        print("フォーマット変換後:\(strDate)")
        
    }
    
    // メモリ不足を感知したときに呼ばれるメソッド
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

