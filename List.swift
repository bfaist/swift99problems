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
       if index == 0 {
          return self.value
       }
       var nodeCounter: Int = 0

       var currNode = self
       while(currNode.nextItem != nil && nodeCounter != index) {
          currNode = currNode.nextItem!
          nodeCounter += 1
       }
       return currNode.value
    }
}

// TESTS

if let a = List(1,2,3,4,5) {
   print("P01 TEST \(a.last!)")
   print("P02 TEST \(a.pennultimate!)")
   print("P03 TEST \(a[1]!) \(a[3]!)")
}

if let b = List(99,98,97,96,95,94,93,92,91,90) {
    print("P01 TEST \(b.last!)")
    print("P02 TEST \(b.pennultimate!)")
    print("P03 TEST \(b[1]!) \(b[6]!)")
}

if let c = List(99) {
    print("P01 TEST \(c.last!)")
    print("P02 TEST \(c.pennultimate!)")
    print("P03 TEST \(c[0]!)")
}

