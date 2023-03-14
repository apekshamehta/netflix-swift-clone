//
//  FetchTopMovies.swift
//  NetflixDemo
//
//  Created by Apeksha Ghiya on 07/03/23.
//

import Foundation
import UIKit


func merge2Country(l1:inout LinkedListNode?,l2:inout LinkedListNode?) -> LinkedListNode  {
    let dummy:LinkedListNode = LinkedListNode.init(data: -1)
    
    var prev:LinkedListNode = dummy
    while l1 != nil && l2 != nil {
        
        if l1!.data <= l2!.data {
            prev.next = l1
            l1 = l1!.next
        }else{
            prev.next = l2
            l2 = l2!.next
        }
        
        prev = prev.next!
    }
    
    if l1 == nil{
        prev.next = l2!
    }else{
        prev.next = l1!
    }
    
    return dummy.next!
}


func mergeKCountry(lists:inout Set<LinkedListNode>) -> LinkedListNode {
    if lists.count > 0 {
        var res:LinkedListNode? = lists[lists.index(lists.startIndex, offsetBy: 0)]
        var i = 1
        
        while i < lists.count {
            var subList:LinkedListNode? = lists[lists.index(lists.startIndex, offsetBy: i)]
            res = merge2Country(l1: &res, l2: &subList)
            i = i + 1
        }
        return res!
    }
    return LinkedListNode.init(data: -1)
}


//Execution start

class FetchTopMovies: UIViewController {
    
    var a: LinkedListNode = LinkedList.createLinkedList(lst: [11,41,51])

    var b: LinkedListNode = LinkedList.createLinkedList(lst: [21,23,42])

    var c: LinkedListNode = LinkedList.createLinkedList(lst: [25,56,66,72])

    var list1:Set<LinkedListNode> = Set<LinkedListNode>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list1.insert(a)
        list1.insert(b)
        list1.insert(c)

        LinkedList.display(head: mergeKCountry(lists: &list1))

    }
}




