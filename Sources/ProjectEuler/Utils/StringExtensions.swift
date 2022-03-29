import Foundation

public extension String {
    func at(idx: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: idx)]
    }

    /**
     Determines if the string is a palindrome.

     - returns:
     `true` if the string is a palindrome, else `false`.

     - Version:
     0.1

     I normalize the string value by converting it to lowercase and removing
     all spaces.
     */
    func isPalindrome() -> Bool {
        let ans = self.lowercased().replacingOccurrences(of: " ", with: "")
        return ans == String(ans.reversed())
    }
}
