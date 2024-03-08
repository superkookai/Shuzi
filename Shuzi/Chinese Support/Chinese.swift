//
//  Chinese.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 7/3/2567 BE.
//

import Foundation

class Chinese{
    static func num99ToChinese(num: Int) -> (chinese: String, pinyin: String)?{
        
        let chineseDigitsWithPinyin: [(chinese: String, pinyin: String) ] = [
            ("零", "líng"),  // 0
            ("一", "yī"),    // 1
            ("二", "èr"),    // 2
            ("三", "sān"),
            ("四", "sì"),
            ("五", "wǔ"),
            ("六", "liù"),
            ("七", "qī"),
            ("八", "bā"),
            ("九", "jiǔ"),
            ("十", "shí")    // 10
        ]
//        let chineseDigitsWithPinyinEmptyZero: [(chinese: String, pinyin: String)] = [
//            ("", ""),
//            ("一", "yī"),
//            ("二", "èr"),
//            ("三", "sān"),
//            ("四", "sì"),
//            ("五", "wǔ"),
//            ("六", "liù"),
//            ("七", "qī"),
//            ("八", "bā"),
//            ("九", "jiǔ"),
//            ("十", "shí")
//        ]
        
        var chinese = ""
        var pinyin = ""
        
        if num < 0 || num > 99{
            return nil
        }
        
        switch num{
        case 0...10:
            chinese = chineseDigitsWithPinyin[num].chinese
            pinyin = chineseDigitsWithPinyin[num].pinyin
        case 11...19:
            chinese = chineseDigitsWithPinyin[10].chinese
            pinyin = chineseDigitsWithPinyin[10].pinyin
            chinese += chineseDigitsWithPinyin[num % 10].chinese
            pinyin += " " + chineseDigitsWithPinyin[num % 10].pinyin
        case 20...99:
            let digit = num % 10
            let tenths = num / 10
            
            chinese = chineseDigitsWithPinyin[tenths].chinese
            pinyin = chineseDigitsWithPinyin[tenths].pinyin
            
            chinese += chineseDigitsWithPinyin[10].chinese
            pinyin += " " + chineseDigitsWithPinyin[10].pinyin
            
            if digit != 0{
                chinese += chineseDigitsWithPinyin[digit].chinese
                pinyin += " " + chineseDigitsWithPinyin[digit].pinyin
            }
        default:
            return nil
        }
        
        return (chinese: chinese, pinyin: pinyin)
    }
}
