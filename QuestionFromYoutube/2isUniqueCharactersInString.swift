import Foundation

func containUnique(of str: String) -> Bool? {
    guard str.isEmpty == false else { return nil }
    var containsChars = [Character]()
    for char in str {
        if containsChars.contains(char) == true {
            return false
        } else {
            containsChars.append(char)
        }
    }
    return true
}

func testOfContainUnique() {
    let args = ["Chars", "Characters", ""]
    args.forEach {
        if let result = containUnique(of: $0){
            print("String '\($0)'", result ? "is unique." : "isn't unique.")
        } else {
            print("This string is empty.")
        }
    }
}

testOfContainUnique()