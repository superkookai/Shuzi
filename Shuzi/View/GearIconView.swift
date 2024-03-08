//
//  GearIconView.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 7/3/2567 BE.
//

import SwiftUI

struct GearIconView: View {
    @Binding var showSettingsView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation{
                        showSettingsView.toggle()
                    }
                }, label: {
                    Image(systemName: "gear")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                .padding()
                
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color
            .blue.opacity(0.3)
            .ignoresSafeArea()
        
        GearIconView(showSettingsView: .constant(false))
    }
}
