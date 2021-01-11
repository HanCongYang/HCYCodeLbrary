//
//  HPCommonTableViewController.swift
//  HYHotPotForSwift
//
//  Created by 韩丛旸 on 2020/12/23.
//

import UIKit
import QMUIKit

class HPCommonTableViewController: QMUICommonTableViewController {
    
    
    var dataSource: Array<Any>?
    var dataSourceWithDetailText: QMUIOrderedDictionary<NSString, NSString>?
    var didSelectTitleBlock : ((_ title : NSString) -> Void)?
    
    
    convenience init (_ fuckingWord : String) {
        
        self.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func initDataSource() {
        
    }
    
    func didSelectCellWithTitle(title : NSString) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.dataSourceWithDetailText != nil  {
            return Int(self.dataSourceWithDetailText!.count)
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView .dequeueReusableCell(withIdentifier: "cell") ?? nil
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
            cell?.textLabel?.text = self.dataSourceWithDetailText?.allKeys[indexPath.row] as String?
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.didSelectCellWithTitle(title: (self.dataSourceWithDetailText?.allKeys[indexPath.row])!)
    }
    
}
