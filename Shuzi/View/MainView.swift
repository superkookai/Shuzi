//
//  ContentView.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 7/3/2567 BE.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gVM
    @State private var showSettingsView: Bool = false
    @State private var showPinyin: Bool = true
    @State private var done: Bool = false
    
    var gameOver: Bool {
        gVM.gameModel.gameOver
    }
    
    var body: some View {
        ZStack {
            GearIconView(showSettingsView: $showSettingsView)
            
            VStack {
                ScoreView(score: gVM.gameModel.score, maxTurns: gVM.gameModel.maxTurns)
                
                Toggle(isOn: $showPinyin.animation(), label: {
                    Text(showPinyin ? "Hide Pinyin" : "Show Pinyin")
                })
                
                if let chineseNum = Chinese.num99ToChinese(num: gVM.gameModel.answer){
                    Spacer()
                    
                    Text(chineseNum.chinese)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text(chineseNum.pinyin)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .opacity(showPinyin ? 1.0 : 0.0)
                }
                
                
                Spacer()
                
                NumberOptionsView(numbers: gVM.gameModel.alternatives, answer: gVM.gameModel.answer)
                    .onChange(of: gVM.gameModel.turns) { _, _ in
                        gVM.gameModel.generateNewProblem()
                    }
                
                
            }
            .padding()
        }
        .fullScreenCover(isPresented: $done, content: {
            GameOverView(color: .green.opacity(0.8))
        })
        .fullScreenCover(isPresented: $showSettingsView, content: {
            SettingsView(showSettingsView: $showSettingsView, volume: gVM.gameModel.volume)
        })
        .onChange(of: gameOver) { oldValue, newValue in
            done = gameOver
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
