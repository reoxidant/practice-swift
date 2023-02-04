
/*:
 [Previous Challenge](@previous)
 
 ## #2. Balance Parentheses
 
 Check for balanced parentheses. Given a string, check if there are `(` and `)` characters, and return `true` if the parentheses in the string are balanced.
 ```
 // 1
 h((e))llo(world)() // balanced parentheses
 // 2
 (hello world // unbalanced parentheses
 ```
 */
var testString1 = "((h((e))llo)(world))()"

print(checkParentheses(testString1)) // should be true
print("Right example:")
print(rightCheckParentheses(testString1))

func checkParentheses(_ string: String) -> Bool {

    var countLeftParenthese = 0
    var countRightPerenthese = 0

    for char in string {
        if "(" == char {
            countLeftParenthese += 1
        }

        if ")" == char {
            countRightPerenthese += 1
        }
    }

    if countLeftParenthese == countRightPerenthese {
        return true
    } else {
        return false
    }
}

func rightCheckParentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()

    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }

    return stack.isEmpty
}
