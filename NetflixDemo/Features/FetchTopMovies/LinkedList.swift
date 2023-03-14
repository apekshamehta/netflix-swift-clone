//
//  LinkedList.swift
//  NetflixDemo
//
//  Created by Apeksha Ghiya on 09/03/23.
//

import Foundation

class LinkedListNode:Equatable, Hashable
{
    var data:Int = 0
    
    static func == (lhs: LinkedListNode, rhs: LinkedListNode) -> Bool {
        return (lhs.data == rhs.data)
    }
    
    func hash(into hasher:inout Hasher)  {
        hasher.combine(data)
    }
   
    var key:Int = 0
    var next:LinkedListNode?
    var arbitraryPointer:LinkedListNode?
    
    init(data:Int)
    {
        self.data = data
        self.next = nil
    }
    
    init(key:Int,data:Int) {
        self.key = key
        self.data = data
        self.next = nil
    }
    
        
    init(data:Int,next:LinkedListNode) {
        self.data = data
        self.next = nil
    }
    
    init(data: Int, next: LinkedListNode, arbitraryPointer: LinkedListNode) {
        self.data = data
        self.next = nil
        self.arbitraryPointer = arbitraryPointer
    }
    
    deinit{
        self.next = nil
        self.arbitraryPointer = nil
    }
    
    
}


class LinkedList {
    static func insertAtHead(head:LinkedListNode?,data:Int) -> LinkedListNode {
        let newNode = LinkedListNode.init(data: data)
        newNode.next = head
        return newNode
        
    }
    
    static func insertAtTail(head:LinkedListNode?,data:Int) -> LinkedListNode {
        let newNode = LinkedListNode.init(data: data)
        if head == nil {
            return newNode
        }
        var temp:LinkedListNode = head!
        while temp.next != nil {
            temp = temp.next!
        }
        temp.next = newNode
        return head!
    }
    
    static func insertAtTail(head:LinkedListNode?,node:LinkedListNode) -> LinkedListNode {
        if head == nil {
            return node
        }
        var temp:LinkedListNode = head!
        while temp.next != nil {
            temp = temp.next!
        }
        temp.next = node
        return head!
    }
    
    static func createLinkedList(lst : [Int]) -> LinkedListNode
    {
        var head:LinkedListNode? = nil
        var tail:LinkedListNode? = nil
        
        for data in lst
        {
            let newNode = LinkedListNode.init(data: data)
            if head == nil {
                head = newNode
            }else{
                tail!.next = newNode
            }
            
            tail = newNode
        }
        
        return head!
    }
    
    static func createRandomList(length:Int) -> LinkedListNode {
        var head:LinkedListNode? = nil
        
        
        let randomValue:Int = Int.random(in: 0...100)
        var iterator:Int = 0
        
        while iterator < length {
            head = insertAtHead(head: head, data: randomValue)
            iterator = iterator + 1
        }
        
        return head!
        
    }
    
    
    static func toList(head:LinkedListNode?,lst: inout Set<Int>)  {
        var temp:LinkedListNode? = head
        while temp != nil {
            lst.insert(temp!.data)
            temp = temp!.next!
        }
        
    }
    
    static func display(head:LinkedListNode?)  {
        var temp:LinkedListNode? = head
        var outputStr:String = ""
        while temp != nil {
            outputStr += String(temp!.data)
            temp = temp?.next
            if temp != nil{
                outputStr += " ,"
            }
        }
        outputStr += "\n"
        print(outputStr)
    }
    
    static func mergeAlternating(l1:inout LinkedListNode?,l2:inout LinkedListNode?) -> LinkedListNode{
        if l1 == nil && l2 == nil {
            return LinkedListNode.init(data: -1)
        }
        if l1 == nil {
            return l2!
        }
        
        if l2 == nil {
            return l1!
        }
        
        let head:LinkedListNode = l1!
        
        while l1?.next != nil && l2 != nil {
            let temp = l2
            l2 = l2?.next
            
            temp?.next = l1?.next
            l1?.next = temp
            l1 = temp?.next
            
        }
        
        if l1?.next == nil {
            l1?.next = l2
        }
        
        return head
    }

    static func isEqual(l1:inout LinkedListNode?,l2:inout LinkedListNode?) -> Bool{
        if l1 == l2 {
            return true
        }
        
        while (l1 != nil && l2 != nil) {
            if l1?.data != l2?.data {
                return false
            }
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return (l1 == l2)
    }
    
}
