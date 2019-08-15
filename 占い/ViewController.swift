//
//  ViewController.swift
//  HEIZITUKADAI4
//
//  Created by VERTEX21 on 2019/08/12.
//  Copyright © 2019 k-kougi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
@IBOutlet weak var dataPicker: UIDatePicker!

@IBOutlet weak var numLabel: UILabel!
    
@IBOutlet weak var resultTextView: UITextView!
    
@IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
//スライダー変数
var likeNum = 0
    
//関数
var yearText = ""
var monthText = ""
var dateText = ""
var bloodTypeText = ""
var likeNumText = ""
    
var bloodTypeNum = 0

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
}
    
//スライダー
@IBAction func numSlider(_ sender: UISlider) {
    let sliderValue:Int = Int(sender.value)
    numLabel.text = String(sliderValue)
    likeNum = sliderValue
}
    
  //占うボタンを押した後の処理
  func checkResult() {
                
    // datePicker の値を yyyymmddのフォーマットで取得。
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    // print("\(formatter.string(from: datePicker.date))")
        
    let yyyymmdd = "\(formatter.string(from: dataPicker.date))"
    // print(yyyymmdd)
        
        
    // 「年」の値を取得
    let year = yyyymmdd.prefix(4)
    let yearType = year.suffix(1)
        
    // ケース
    switch yearType {
    case "0":
        yearText = "牛"
    case "1":
        yearText = "猫"
    case "2":
        yearText = "犬"
    case "3":
        yearText = "猿"
    case "4":
        yearText = "蛇"
    case "5":
        yearText = "虎"
    case "6":
        yearText = "蟻"
    case "7":
        yearText = "蛾"
    case "8":
        yearText = "鳥"
    case "9":
        yearText = "ゴリラ"
    default:
        print("エラー")
        return
}
    
 // 「月」の値を取得
 let month =  yyyymmdd[yyyymmdd.index(yyyymmdd.startIndex, offsetBy: 4)..<yyyymmdd.index(yyyymmdd.startIndex, offsetBy: 6)]
    
 let monthType = month.suffix(1)
        
    // ケース
    switch monthType {
    case "0":
        monthText = "光"
    case "1":
        monthText = "闇"
    case "2":
        monthText = "火"
    case "3":
        monthText = "水"
    case "4":
        monthText = "風"
    case "5":
        monthText = "雷"
    case "6":
        monthText = "天"
    case "7":
        monthText = "氷"
    case "8":
        monthText = "土"
    case "9":
        monthText = "無"
    default:
        print("エラー")
        return
    }
        
    // 「日」の値を取得
    let date = yyyymmdd.suffix(2)
    let dateType = date.suffix(1)
    // ケース
    switch dateType {
    case "0":
        dateText = "不思議な雰囲気"
    case "1":
        dateText = "粘り強さ"
    case "2":
        dateText = "意思の強さ"
    case "3":
        dateText = "明るい雰囲気"
    case "4":
        dateText = "メンヘラ"
    case "5":
        dateText = "芯の強さ"
    case "6":
        dateText = "神がかっているオーラ"
    case "7":
        dateText = "自由人"
    case "8":
        dateText = "経験を糧にする意思"
    case "9":
        dateText = "自分を貫き通す意思"
    default:
        print("エラー")
        return
    }

    let selectedIndex = segmentedControl.selectedSegmentIndex
        
        switch selectedIndex{
        case 0:
            bloodTypeText = "几帳面な"
            
        case 1:
            bloodTypeText = "優しい"
            
        case 2:
            bloodTypeText = "穏やかな"
            
        case 3:
            bloodTypeText = "真面目な"
            
        default:
            return
   }
    switch likeNum % 5 {
    case 0:
        likeNumText = "スポーツ"
    case 1:
        likeNumText = "読書"
    case 2:
        likeNumText = "旅"
    case 3:
        likeNumText = "散歩"
    case 4:
        likeNumText = "食べること"
    default:
        return
    }
    
// 6. 呼び出し
resultTextView.text = "あなたは\(yearText)に愛されています。属性は「\(monthText)」です。あなたからは\(dateText)が感じられます。\(bloodTypeText)性格です。\(likeNumText)が吉。"

    }
    // 占うボタンを押した後の処理
    @IBAction func actionButton(_ sender: Any) {
        checkResult()
    }
}
