//
//  VeryCoolTextView.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 8/3/2567 BE.
//

import SwiftUI

struct VeryCoolTextView: View {
    let spacing: Double
    let text1: String
    let text2: String
    let text3: String
    let scale: CGSize
    let angle: Double
    let opacity: Double
    
    var body: some View {
        VStack(spacing: spacing, content: {
            Text(text1)
                .foregroundStyle(.red)
            Text(text2)
                .foregroundStyle(.yellow)
            Text(text3)
                .foregroundStyle(.red)
        })
        .font(.title)
        .fontWeight(.semibold)
        .multilineTextAlignment(.center)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    LinearGradient(colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .opacity(opacity)
        )
        .padding()
        .scaleEffect(scale)
        .rotation3DEffect(
            Angle(degrees: angle),
            axis: (x: 1.0, y: 0.0, z: 0.0)
        )
    }
}

#Preview {
    VStack {
        VeryCoolTextView(spacing: 25, text1: "Line 1", text2: "Line 2", text3: "Line 3", scale: CGSize(width: 1, height: 1), angle: 0, opacity: 1)
        
        VeryCoolTextView(spacing: 5, text1: "Line 1", text2: "Line 2", text3: "Line 3", scale: CGSize(width: 0.5, height: 0.5), angle: 45, opacity: 0)
    }
}
