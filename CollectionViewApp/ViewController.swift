//
//  ViewController.swift
//  CollectionViewApp
//
//  Created by PC-SYSKAI551 on 2021/05/01.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var colortext: [String] = ["赤","マゼンタ","青","黄","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤",
        "赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤",
        "赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤","赤"]

    var colorNum: [Int] =
        [0,1,2,3,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        switch PickerViewController.pullcolor {
        case 0:
            colorNum[PickerViewController.tappedcolorArray] = 0
            colortext[PickerViewController.tappedcolorArray] = "赤"
        case 1:
            colorNum[PickerViewController.tappedcolorArray] = 1
            colortext[PickerViewController.tappedcolorArray] = "マゼンタ"
        case 2:
            colorNum[PickerViewController.tappedcolorArray] = 2
            colortext[PickerViewController.tappedcolorArray] = "青"
        case 3:
            colorNum[PickerViewController.tappedcolorArray] = 3
            colortext[PickerViewController.tappedcolorArray] = "紫"
        case 4:
            colorNum[PickerViewController.tappedcolorArray] = 4
            colortext[PickerViewController.tappedcolorArray] = "黄"
        case 5:
            colorNum[PickerViewController.tappedcolorArray] = 5
            colortext[PickerViewController.tappedcolorArray] = "緑"
        case 6:
            colorNum[PickerViewController.tappedcolorArray] = 6
            colortext[PickerViewController.tappedcolorArray] = "桃"
        case 7:
            colorNum[PickerViewController.tappedcolorArray] = 7
            colortext[PickerViewController.tappedcolorArray] = "灰色"
        default:
            colorNum[PickerViewController.tappedcolorArray] = 1
            colortext[PickerViewController.tappedcolorArray] = "赤"
        }
        collectionView.reloadData()
    }
    // セクションヘッダのサイズ
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colortext.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as!
            ColorCollectionViewCell
        cell.textLabel.text = self.colortext[indexPath.row]
        
        switch colorNum[indexPath.row] {
        case 0:
            cell.backgroundColor = .red
        case 1:
            cell.backgroundColor = .magenta
        case 2:
            cell.backgroundColor = .blue
        case 3:
            cell.backgroundColor = .purple
        case 4:
            cell.backgroundColor = .yellow
        case 5:
            cell.backgroundColor = .green
        case 6:
            cell.backgroundColor = .systemPink
        case 7:
            cell.backgroundColor = .gray
        default:
            cell.backgroundColor = .red
        }
        cell.layer.cornerRadius = 10
        return cell
    }
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 配列からタップされたインデックスのデータを取り出す
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PickerViewController") as! PickerViewController
        vc.modalPresentationStyle = .fullScreen
        PickerViewController.tappedcolor = colortext[indexPath.row]
        PickerViewController.tappedcolorArray = indexPath.row
        self.present(vc, animated: true, completion: nil)
    }
}
