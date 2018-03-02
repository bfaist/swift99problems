class List<T> {
    var value: T
    var nextItem: List<T>?

    convenience init?(_ values: T...) {
        self.init(Array(values))
    }

    init?(_ values: [T]) {
        guard let first = values.first else {
            return nil
        }
        value = first
        nextItem = List(Array(values.suffix(from: 1)))
    }
}

extension List {
    // P01
    var last: T? {
       var currNode = self
       while(currNode.nextItem != nil) {
          currNode = currNode.nextItem!
       }
       return currNode.value
    }
    // P02
    var pennultimate: T? {
       var currNode = self
       while(currNode.nextItem != nil && currNode.nextItem!.nextItem != nil) {
          currNode = currNode.nextItem!
       }
       return currNode.value
    }
    // P03
    subscript(index: Int) -> T? {
       var nodeCounter: Int = 0

       var currNode = self
       while(currNode.nextItem != nil && nodeCounter != index) {
          currNode = currNode.nextItem!
          nodeCounter += 1
       }
       return currNode.value
    }
    // P04
    var length: Int {
       var currNode = self
       var nodeCounter: Int = 1
       while(currNode.nextItem != nil) {
           nodeCounter += 1
           currNode = currNode.nextItem!
       }
       return nodeCounter
    }
    // P05
    func reverse() -> List<T> {
       var currNode = self;
       var data: [T] = []
       data.append(currNode.value)
       while(currNode.nextItem != nil) {
          currNode = currNode.nextItem!
          data.append(currNode.value)
       }
       let r = List<T>.init(data.reversed())
       return r!
    }
}

// TESTS

if let a = List(1,2,3,4,5) {
   print("P01 TEST \(a.last!)")
   print("P02 TEST \(a.pennultimate!)")
   print("P03 TEST \(a[1]!) \(a[3]!)")
   print("P04 TEST \(a.length)")
   print("P05 TEST \(a.reverse().last!)")
}

if let b = List(99,98,97,96,95,94,93,92,91,90) {
    print("P01 TEST \(b.last!)")
    print("P02 TEST \(b.pennultimate!)")
    print("P03 TEST \(b[1]!) \(b[6]!)")
    print("P04 TEST \(b.length)")
    print("P05 TEST \(b.reverse().last!)")
}

if let c = List(99) {
    print("P01 TEST \(c.last!)")
    print("P02 TEST \(c.pennultimate!)")
    print("P03 TEST \(c[0]!)")
    print("P04 TEST \(c.length)")
    print("P05 TEST \(c.reverse().last!)")
}

