//
//  ViewController.swift
//  DropDownList
//
//  Created by anjani on 15/05/2018.
//  Copyright © 2018 anjani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TableVieww: UITableView!
    @IBOutlet weak var Btn: UIButton!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var Btn2: UIButton!
    var array = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
       array = ["Iphonex","Iphone8","Iphone7","Iphone6"]
        TableVieww.isHidden = true
        lbl.isHidden = true
        lbl.text = "This is sample of dropdown button and label for ios in swift 4 using xcode"
    }

   
    @IBAction func MenuBtn(_ sender: Any) {
        if TableVieww.isHidden {
            
            animateListMenu(toogle: true, btnType: Btn)
        } else {
            animateListMenu(toogle: false, btnType: Btn)
        }
        
    }
    
    @IBAction func MenuBtn2(_ sender: Any) {
        if lbl.isHidden {
            
            animateListMenu(toogle: true, btnType: Btn2)
        } else {
            animateListMenu(toogle: false, btnType: Btn2)
        }
    }
    func animateListMenu(toogle:Bool,btnType:UIButton){
        if btnType == Btn {
            if toogle {
                UIView.animate(withDuration: 0.3) {
                    self.TableVieww.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.TableVieww.isHidden = true
                }
            }
        } else {
            if toogle {
                UIView.animate(withDuration: 0.3) {
                    self.lbl.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.lbl.isHidden = true
                }
            }
            
        }
        
        
    }
    
}

extension ViewController :UITableViewDelegate,UITableViewDataSource {
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = array[indexPath.row] as? String
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Btn.setTitle("\(array[indexPath.row])", for: .normal)
        animateListMenu(toogle: false, btnType: Btn)
    }
}
