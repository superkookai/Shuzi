//
//  NumberOptionsView.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 8/3/2567 BE.
//

import SwiftUI

struct NumberOptionsView: View {
    let numbers: [Int]
    let answer: Int
    
    var body: some View {
        VStack {
            HStack{
                CirecleView(value: numbers[0], answer: answer, color: .blue)
                CirecleView(value: numbers[1], answer: answer, color: .green)
            }
            
            HStack{
                CirecleView(value: numbers[2], answer: answer, color: .red)
                CirecleView(value: numbers[3], answer: answer, color: .orange)
            }

        }
    }
}

struct CirecleView: View {
    @Environment(GameViewModel.self) var gVM
    
    let value: Int
    let answer: Int
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(color.gradient)
            
            Text("\(value)")
                .foregroundStyle(.white)
                .font(.title)
        }
        .onTapGesture {
            if answer == value{
                gVM.gameModel.increaseScore()
                gVM.playNumber(num: answer)
            }else{
                gVM.incorrectSound()
            }
            
            gVM.gameModel.nextTurn()
        }
    }
}

#Preview {
    NumberOptionsView(numbers: [42,13,10,28], answer: 10)
        .padding()
        .environment(GameViewModel())
}
