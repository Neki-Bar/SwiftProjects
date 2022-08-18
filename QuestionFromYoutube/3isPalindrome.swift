import Foundation

func isPalindrome(string: String) -> Bool? {
    guard string != "" else { return nil }
    for count in 0..<(string.count / 2) {
        if string[string.index(string.startIndex, offsetBy: count)] != 
            string[string.index(string.endIndex, offsetBy: (count - 1))] {
            return false
        }
    }
    return true
}

func isPalindromeTest() {
    let args = ["char", "pop", ""]
    for str in args {
        if let res = isPalindrome(string: str) {
            print("String '\(str)'", res ? "is palindrome" : "isn't palindrome")
        } else {
            print("This is empty string")
        }
    }
}

isPalindromeTest()

/*String 'char' isn't palindrome
String 'pop' is palindrome
This is empty string
*/