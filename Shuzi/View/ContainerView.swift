//
//  ContainerView.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 8/3/2567 BE.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenPresented: Bool = true
    
    var body: some View {
        if isSplashScreenPresented{
            SplashScreenView(isPresented: $isSplashScreenPresented)
        }else{
            MainView()
        }
    }
}

#Preview {
    ContainerView()
        .environment(GameViewModel())
}
