//
//  SettingsView.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 8/3/2567 BE.
//

import SwiftUI

struct SettingsView: View {
    @Environment(GameViewModel.self) var gVM
    @Binding var showSettingsView: Bool
    @State var volume: Float
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section {
                        Text("Volume")
                        Slider(value: $volume, in: 0...1, step: 0.1)
                    } header: {
                        Text("Audio Settings")
                    }

                }
                
                Button(action: {
                    gVM.gameModel.volume = volume
                    showSettingsView.toggle()
                }, label: {
                    Text("OK")
                })
            }
            .navigationTitle("Game Settings")
        }
    }
}

#Preview {
    SettingsView(showSettingsView: .constant(true), volume: 0.7)
        .environment(GameViewModel())
}
