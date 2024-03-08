//
//  GameOverView.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 8/3/2567 BE.
//

import SwiftUI

struct GameOverView: View {
    @Environment(GameViewModel.self) var gVM
    
    let color: Color
    
    var body: some View {
        ZStack{
            Image([.china1, .china2, .china3, .china4, .china5, .china6, .china7].randomElement() ?? .china1)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                VStack{
                    Text("Game Over!")
                    Text("You solved \(gVM.gameModel.score) out of \(gVM.gameModel.maxTurns)")
                    Text("Tap for a new game")
                        .fontWeight(.thin)
                }
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(color)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Material.ultraThin)
                        .stroke(color,lineWidth: 5)
                )
                
                Spacer()
            }
        }
        .onTapGesture {
            gVM.gameModel.resetGame()
        }
    }
}

#Preview {
    GameOverView(color: .green)
        .environment(GameViewModel())
}
