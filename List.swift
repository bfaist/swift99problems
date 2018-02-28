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
}

// TESTS

if let a = List(1,2,3,4,5) {
    print(a.last!)
}

if let b = List(99,98,97,96,95,94,93,92,91,90) {
    print(b.last!)
}

