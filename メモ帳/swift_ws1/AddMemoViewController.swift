//
//  AddMemoViewController.swift
//  swift_ws1
//
//  Created by 19247019 on 2020/07/09.
//  Copyright © 2020 19247019. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        let inputText = memoTextView.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            if inputText != nil{
                saveMemoArray.append(inputText!)
            }else{
                print("何も入力されていません。")
            }
            ud.set(saveMemoArray, forKey: "memoArray")
        }else{
            var newMemoArray = [String]()
            if inputText != nil{
                newMemoArray.append(inputText!)
            }else{
                print("何も入っていません。")
            }
            ud.set(newMemoArray, forKey: "memoArray")
        }
        ud.synchronize()
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
