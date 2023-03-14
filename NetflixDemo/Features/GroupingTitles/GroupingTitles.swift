//
//  ViewController.swift
//  NetflixDemo
//
//  Created by Apeksha Ghiya on 07/03/23.
//

import UIKit

class GroupingTitles: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var scrView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblVwSearchResult: UITableView!
    @IBOutlet weak var consHeightForTblSearchResult: NSLayoutConstraint!
    
    // MARK: - Variables
    var searchResults:[String] = []
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        var titles:Set<String> = ["duel","duel","dule","speed","spede","cars"]
        var output = Set<Set<String>>()
        
        let query = "speed"
        
        groupTitles(&titles, &output)
        
        for o in output
        {
            if o.contains(query)
            {
                print(o)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Custom Methods
    
    func groupTitles(_ strs:inout Set<String>,_ output:inout Set<Set<String>>){
        
        if strs.count == 0
        {
            return
        }
        
        var count:[Int] = Array(repeating: 0, count: 26)
        var dict:[String:Set<String>] = [:]

        for s in strs
        {
            for ch:Character in s
            {
                let c:Character = "a"
                let index = (Int)(ch.asciiValue! - c.asciiValue!)
                count[index] += 1
            }
            
            var key:String = ""
            
            for i in count
            {
                key += "#"
                key += String(i)
            }
            
            if dict[key] == nil {
                dict[key] = Set<String>()
            }
            
            dict[key]!.insert(s)
            count = Array(repeating: 0, count: 26)
        }
        
        let allKeys = dict.keys
        
        for k in allKeys
        {
            output.insert(dict[k]!)
        }
        
    }

    

}

extension GroupingTitles:UITableViewDelegate,UITableViewDataSource{
    
    // MARK: - TableView Delegate and Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        return cell!
        
    }
    
    
}
