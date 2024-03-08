//
//  ShuziApp.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 7/3/2567 BE.
//

import SwiftUI

@main
struct ShuziApp: App {
    @State private var gVM: GameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContainerView()
                .environment(gVM)
        }
    }
}
