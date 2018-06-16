# Usage

### Call simple functions without boilerplate code of capture list and guard check (yay!) 

```swift
import ReferenceValet

class MyObject: NSObject {
    var name: String
    
    func oldSchoolAsync() {
        DispatchQueue.main.async { [weak self] in
            guard let myObject = self else {
                return
            }
            print(myObject.name)
        }
    }

    func minimalisticAsync() {
        async { print($0.name) }
    }
}

```
