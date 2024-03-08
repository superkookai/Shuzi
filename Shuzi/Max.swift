//
//  Max.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 7/3/2567 BE.
//

import Foundation

func myMax(x: Int, y: Int, z: Int) -> Int{
    if x >= y && x >= z{
        return x
    }else if y >= x && y >= z{
        return y
    }else{
        return z
    }
}
