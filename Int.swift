extension Int {
    // P31
    func isPrime() -> Bool {
        let n = self
        if(n <= 1) {
            return false
        } else if(n <= 3) {
            return true
        } else if(n % 2 == 0 || n % 3 == 0) {
            return false
        } else {
            var i = 5
            while (i * i <= n) {
                if n % i == 0 || n % (i + 2) == 0 {
                   return false
                }
                i += 6
            }
            return true
        }
    }
    // P32
    static func gcd(_ first: Int, _ second: Int) -> Int {
        if second == 0 {
            return first
        }
        return Int.gcd(second, first % second)
    }
    // P33
    func isCoprimeTo(_ other: Int) -> Bool {
        if Int.gcd(self, other) == 1 {
             return true 
        }

        return false
    }
}

// Tests

for i in 1...100 {
   if i.isPrime() {
      print("PRIME: \(i)")
   }
}

print(Int.gcd(36,63))
print(Int.gcd(104,20))

print(35.isCoprimeTo(64))
print(35.isCoprimeTo(65))
print(3.isCoprimeTo(2))
