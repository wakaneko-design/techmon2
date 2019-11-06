//
//  LobbyViewController.swift
//  techmon2
//
//  Created by Yuto Wakabayashi on 2019/11/06.
//  Copyright © 2019 com.litech. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var sutaminaLabel: UILabel!
    
    let techMonManager = TechMonManager.shared
    
    var sutamina: Int = 100
    var sutaminaTimer: Timer!
    
    //アプリが起動した時に一度だけ呼ばれる
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //UI設定
        nameLabel.text = "勇者"
        sutaminaLabel.text = "\(sutamina) / 100"
        
        //タイマーの設定
        sutaminaTimer = Timer.scheduledTimer(
            timeInterval: 3,
            target: self,
            selector: #selector(updateSutaminaVaue),
            userInfo: nil,
            repeats: true)
        sutaminaTimer.fire()
        
    }
    
    //ロビー画面が見えるようになると呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        techMonManager.playBGM(fileName: "lobby")
    }
    //ロビー画面が見えなくなると呼ばれる
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        techMonManager.stopBGM()
    }
    
    @IBAction func toBattle() {
        //スタミナが50以上あれば50消費してバトルへ
        if sutamina >= 50 {
            sutamina -= 50
            sutaminaLabel.text = "\(sutamina) / 100"
            performSegue(withIdentifier: "toBattle", sender: nil)
        } else {
            let alert = UIAlertController(
                title: "バトルに行けません",
                message: "スタミナを貯めてください",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
    }
    
    @objc func updateSutaminaVaue(){
        if sutamina < 100 {
            sutamina += 1
            sutaminaLabel.text = "\(sutamina) / 100"
        }
    }
    
    
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
