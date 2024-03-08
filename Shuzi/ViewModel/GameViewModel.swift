//
//  GameViewModel.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 7/3/2567 BE.
//

import Foundation
import Observation
import AVFoundation

@Observable
class GameViewModel{
    var gameModel: GameModel = .defaultGameModel
    private var audioPlayer: AVAudioPlayer?
    
    func randomExpressionOfJoy(){
        playSound(name: ["awesome","bell","correct","whoop","yes"].randomElement() ?? "whoop")
    }
    
    func incorrectSound() {
        playSound(name: ["incorrectAnswer","OhNo","weak"].randomElement() ?? "incorrectAnswer")
    }
    
    //Play number sound between 0 - 99
    func playNumber(num: Int){
        switch num{
        case 0...10:
            playDigit(digit: num)
        case 11...19:
            playDigit(digit: 10)
            playDigit(digit: num % 10)
        case 20...99:
            let digit = num % 10
            let tenths = num / 10
            playDigit(digit: tenths)
            playDigit(digit: 10)
            if digit != 0{
                playDigit(digit: digit)
            }
        default:
            playSound(name: "bell")
        }
    }
    
    private func playDigit(digit: Int){
        playSound(name: digitToName(digit: digit) ?? "bell")
    }
    
    private func digitToName(digit: Int) -> String?{
        let digitNames = [
            "zero", "one", "two", "three", "four",
            "five", "six", "seven", "eight", "nine", "ten"
        ]

        if digit >= 0 && digit <= 10 {
            return digitNames[digit]
        } else {
            return nil
        }
    }
    
    //Play sounds and digits
    private func playSound(name: String, ext: String = "aiff"){
        guard let soundURL = Bundle.main.url(forResource: name, withExtension: ext) else {
            return
        }
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = gameModel.volume
            audioPlayer?.play()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    

}
