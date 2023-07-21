import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList {
    private var head: Node?
    
    // O(1)
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }

    // O(1)
    func getFirst() -> Int? {
        return head?.data
    }

    // O(n)
    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        
        node.next = newNode
    }

    //O(n)
    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        
        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        
        return node.data
    }

    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        
        for _ in 0..<position - 1 {
            currentNode = currentNode?.next
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    func insertWhile(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        var insertionPoint = position - 1
        var index = 0
        var node = head
        let newNode = Node(data)
        
        while index != insertionPoint {
            node = node?.next
            index += 1
        }
        
        newNode.next = node?.next
        node?.next = newNode
    }
    
    func deleteFirst() {
        head = head?.next
    }

    func deleteLast() {
        if head == nil {
            return
        }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head!
        while(node.next?.next != nil) {
            node = node.next!
        }
        
        node.next = nil
    }
    
    func delete(at position: Int) {
        if position == 0 {
            deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        
        previousNode?.next = nextNode?.next
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    func clear() {
        head = nil
    }
    
    func printLinkedList() {
        if head == nil {
            print("Empty List")
            return
        }
        
        var result = [Int]()
        var node = head
        result.append(node!.data)
        
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        
        print(result)
    }
}

let linkedList = LinkList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()

linkedList.addBack(4)
linkedList.printLinkedList()

print(linkedList.getLast() ?? 0)

linkedList.insertWhile(position: 2, data: 5)
linkedList.printLinkedList()

linkedList.deleteFirst()
linkedList.printLinkedList()

linkedList.deleteLast()
linkedList.printLinkedList()

linkedList.delete(at: 1)
linkedList.printLinkedList()

linkedList.isEmpty

linkedList.clear()
linkedList.printLinkedList()
