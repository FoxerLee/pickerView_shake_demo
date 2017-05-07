//
//  ViewController.swift
//  shakeDemo
//
//  Created by 李源 on 17/5/3.
//  Copyright © 2017年 李源. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var musicPickerView: UIPickerView!
    
    //list列表初始化
    
    let list = ["Table lamp", "Bedside lamp", "Ceiling light", "Television", "Air conditioner"
        , "Bedroom curtains", "Wi-fi" , "Access control", "Computer"]
    var now = "Air conditioner"

    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //开启摇动感应
        UIApplication.shared.applicationSupportsShakeToEdit = true
        becomeFirstResponder()
        
        

        musicPickerView.delegate = self
        musicPickerView.dataSource = self
        
        musicPickerView.selectRow(16384/2, inComponent: 0, animated: false)
        
    }

 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 16384
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row%9]
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        now = list[row]
//    }

    /**
     开始摇动
     */
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        print("开始摇动")
        
        /// 设置音效
//        let path1 = Bundle.main.path(forResource: "rock", ofType:"mp3")
//        let data1 = try? Data(contentsOf: URL(fileURLWithPath: path1!))
//        self.player = try? AVAudioPlayer(data: data1!)
//        self.player?.delegate = self
//        self.player?.updateMeters()//更新数据
//        self.player?.prepareToPlay()//准备数据
//        self.player?.play()
        
    }
    
    /**
     取消摇动
     */
    override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        print("取消摇动")
     
    }
    
    
    /**
     摇动结束
     
     */
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        print("摇动结束")
        ///此处设置摇一摇需要实现的功能
       
        
        /// 设置音效
        let path = Bundle.main.path(forResource: "shot", ofType:"mp3")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        self.player = try? AVAudioPlayer(data: data!)
        self.player?.delegate = self
        self.player?.updateMeters()//更新数据
        self.player?.prepareToPlay()//准备数据
        self.player?.play()
    }
}

