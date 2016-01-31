//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//func quickSort(inout arr: [Int], first: Int, last: Int) {
//    // base case
//    if first > last { return }
//    // partition
//    let splitPoint = partition(&arr, first: first, last: last)
//    // quickSort on leftHalf
//    quickSort(&arr, first: first, last: splitPoint - 1)
//    // quickSort on rightHalf
//    quickSort(&arr, first: splitPoint + 1, last: last)
//}
//
//func quickSort(inout arr: [Int]) {
//    quickSort(&arr, first: 0, last: arr.count - 1)
//}
//
//func partition(inout arr: [Int], first: Int, last: Int) -> Int {
//    // set pivotValue to firstElement
//    let pivotValue = arr[first]
//    // set leftMark
//    var leftMark = first
//    // set rightMark
//    var rightMark = last
//    
//    /*
//    as leftMark and rightMark close in on each other,
//    swap the items that are greater than the pivot value
//    on the left side with the items that are less than the pivot
//    value on the right side. Stop when rightMark crosses leftMark
//    */
//    
//    while leftMark <= rightMark {
//        while arr[leftMark] <= pivotValue && leftMark <= rightMark {
//            leftMark += 1
//        }
//        while arr[rightMark] >= pivotValue && leftMark <= rightMark {
//            rightMark -= 1
//        }
//        if leftMark < rightMark {
//            swap(&arr[leftMark], &arr[rightMark])
//        }
//    }
//    
//    // set the correct value at the splitPoint
//    if first != rightMark {
//        swap(&arr[first], &arr[rightMark])
//    }
//    
//    return rightMark  // return the splitPoint
//}

func quickSort(inout arr: [Int], firstIdx: Int, lastIdx: Int) {
    // base case
    if firstIdx >= lastIdx { return }
    // partition
    let splitPoint = partition(&arr, firstIdx: firstIdx, lastIdx: lastIdx)
    // quickSort on leftHalf
    quickSort(&arr, firstIdx: firstIdx, lastIdx: splitPoint - 1)
    // quickSort on rightHalf
    quickSort(&arr, firstIdx: splitPoint + 1, lastIdx: lastIdx)
}

func quickSort(inout arr: [Int]) {
    quickSort(&arr, firstIdx: 0, lastIdx: arr.count-1)
}

func partition(inout arr: [Int], firstIdx: Int, lastIdx: Int) -> Int {
    // set pivotValue to firstElement
    let pivotValue = arr[firstIdx]
    // set leftMark
    var leftMark = firstIdx + 1
    // set rightMark
    var rightMark = lastIdx
    /*
    as leftMark and rightMark close in on each other,
    swap the items that are greater than the pivot value
    on the left side with the items that are less than the pivot
    value on the right side. Stop when rightMark crosses leftMark
    */
    while leftMark <= rightMark {
        while arr[leftMark] < pivotValue && leftMark <= rightMark {
            leftMark += 1
        }
        while arr[rightMark] > pivotValue && leftMark <= rightMark{
            rightMark -= 1
        }
        if leftMark < rightMark {
            swap(&arr[leftMark], &arr[rightMark])
        }
    }
    // set the correct value at the splitPoint
    if firstIdx != rightMark {
        swap(&arr[firstIdx], &arr[rightMark])
    }
    return rightMark  // return the splitPoint
}

var numbers = [22, 59, 38, 93,95, 0, 34, 58, 72, 15]

quickSort(&numbers)


struct Stack<T> {
    var items:[T]
    //push
    mutating func push(element:T) {
        items.append(element)
    }
    
    //pop
    mutating func pop() -> T? {
        if items.count == 0 {return nil}
        return items.removeLast()
    }
    
    //peek
    func peek() -> T? {
        return items.last
    }
    
    //size
    func size() -> Int {
        return items.count
    }
}


struct Queue<T> {
    var items:[T]
    
    //enqueue
    mutating func enqueue(element: T) {
        items.append(element)
    }
    
    //dequeue 
    mutating func dequeue() -> T? {
        if items.count == 0 {return nil}
        return items.removeFirst()
    }
    
    //size
    func size() -> Int {
        return items.count
    }
}

struct StackQ<T> {
    var items: Queue<T>
    
    mutating func push(element: T) {
        items.enqueue(element)
    }
    
    mutating func pop() -> T? {
        if items.size() <= 0 {return nil}
        for _ in 0..<items.size() - 1 {
            let x = items.dequeue()
            items.enqueue(x!)
        }
        return items.dequeue()
    }
    
    mutating func peek() -> T? {
        if items.size() <= 0 {return nil}
        for _ in 0..<items.size() - 1 {
            let x = items.dequeue()
            items.enqueue(x!)
        }
        let ans = items.dequeue()
        items.enqueue(ans!)
        return ans
    }
    
    mutating func size() -> Int {
        return items.size()
    }
}


