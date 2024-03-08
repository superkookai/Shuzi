//
//  Randomness.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 7/3/2567 BE.
//

import Foundation

extension Int {
    
    // random int in the range lower...upper
    // Ex: lower == 1, upper == 2
    // Random number from 1...2
    // if count == 1:
    // possible output is [2]
    // if count == 2:
    // possible output is [2,1] or [1,2]
    // if count == 3:
    // Impossible. upper - lower + 1 = 2 < 3
    static func generateUniqueRandomIntegers(count: Int, lower: Int = 0, upper: Int = 99) -> [Int] {
        // In case the task is impossible
        if count > upper - lower + 1 || lower > upper {
            return []
        }
        
        var result = [Int]()
        
        while result.count < count {
            let randomInt = Int.random(in: lower...upper)
            
            // Check for uniqueness
            if !result.contains(randomInt) {
                // Good, so we can append
                result.append(randomInt)
            }
        }
        
        return result
    }
}
