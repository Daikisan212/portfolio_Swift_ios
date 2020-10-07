//
//  ViewController.swift
//  swift_ws1
//
//  Created by 19247019 on 2020/06/18.
//  Copyright © 2020 19247019. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var memoTableView: UITableView!
    var memoArray = [String]()
    
    let ud = UserDefaults.standard
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
        cell.textLabel?.text = memoArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTableView.delegate = self
        memoTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //destinationのクラッシュ防ぐ
        if segue.identifier == "toDetail"{
            let detailViewController = segue.destination as! NakamiViewController
            let selectedIndexPath = memoTableView.indexPathForSelectedRow!
            detailViewController.selectedMemo = memoArray[selectedIndexPath.row]
            detailViewController.selectedRow = selectedIndexPath.row
        }
    }
    func loadMemo(){
        if ud.array(forKey: "memoArray") != nil{
            memoArray = ud.array(forKey: "memoArray") as![String]
            memoTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            memoArray.remove(at: indexPath.row)
            ud.set(memoArray, forKey: "memoArray")
            
            tableView.reloadData()
        }
    }
}
