//
//  ViewController.swift
//  PickerView
//
//  Created by 원종우 on 2023/04/16.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 10 //이미지의 파일명을 저장할 배열의 최대 크기를 지정합니다
    let PICKER_VIEW_COLUMN = 1 // 피커 뷰의 열의 개수를 지정합니다
    let PICKER_VIEW_HEIGT: CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["1.png", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.JPG", ]
    
    @IBOutlet var pickerImage: UIPickerView!
    
    
    @IBOutlet var lblImageFileName: UILabel!
    
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0..<MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGT
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent componet: Int) -> Int {
        return imageFileName.count
    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
}

