//
//  ViewController.swift
//  NetflixDemo
//
//  Created by Apeksha Ghiya on 07/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
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

