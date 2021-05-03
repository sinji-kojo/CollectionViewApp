//
//  PickerViewController.swift
//  CollectionViewApp
//
//  Created by PC-SYSKAI551 on 2021/05/02.
//

import UIKit

class PickerViewController: UIViewController {
   
    @IBOutlet weak var pickerView: UIPickerView!
    
    static var tappedcolorArray: Int = 0
    static var tappedcolor: String = ""
    static var pullcolor: Int = 0
    var indexcolor: Int = 0
    let pickerList = ["赤","マゼンタ","青","紫","黄","緑","桃","グレー"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
    
        switch PickerViewController.tappedcolor {
        case "赤":
            view.backgroundColor = .red
            indexcolor = 0
        case "マゼンタ":
            view.backgroundColor = .magenta
            indexcolor = 1
        case "青":
            view.backgroundColor = .blue
            indexcolor = 2
        case "紫":
            view.backgroundColor = .purple
            indexcolor = 3
        case "黄":
            view.backgroundColor = .yellow
            indexcolor = 4
        case "緑":
            view.backgroundColor = .green
            indexcolor = 5
        case "桃":
            view.backgroundColor = .systemPink
            indexcolor = 6
        case "灰色":
            view.backgroundColor = .gray
            indexcolor = 7
        default:
            view.backgroundColor = .red
            indexcolor = 8
        }
        pickerView.selectRow(indexcolor, inComponent: 0, animated: true)
    }
    
    @IBAction func okButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch row {
        case 0:
            view.backgroundColor = .red
        case 1:
            view.backgroundColor = .magenta
        case 2:
            view.backgroundColor = .blue
        case 3:
            view.backgroundColor = .purple
        case 4:
            view.backgroundColor = .yellow
        case 5:
            view.backgroundColor = .green
        case 6:
            view.backgroundColor = .systemPink
        case 7:
            view.backgroundColor = .gray
        default:
            view.backgroundColor = .red
        }
        PickerViewController.pullcolor = row
     }
}
