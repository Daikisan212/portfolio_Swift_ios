//
//  NakamiViewController.swift
//  swift_ws1
//
//  Created by 19247019 on 2020/07/09.
//  Copyright © 2020 19247019. All rights reserved.
//

import UIKit

class NakamiViewController: UIViewController {
    
    @IBOutlet weak var memoTextView: UITextView!
    
    
    var selectedRow:Int!
    var selectedMemo : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = selectedMemo
    }
    
    @IBAction func deleteMemo(_ sender: Any) {
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            /*var saveMemoArray = ud.array(forKey: "memoArray") as![String]
            saveMemoArray.remove(at: selectedRow)
 ud.set(saveMemoArray, forKey: "memoArray" )*/
            ud.synchronize()
            
            self.navigationController?.popViewController(animated: true)
            
        }
        
        
    }
    

}
