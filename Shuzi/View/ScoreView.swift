//
//  ScoreView.swift
//  Shuzi
//
//  Created by Weerawut Chaiyasomboon on 7/3/2567 BE.
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    let maxTurns: Int
    
    var body: some View {
        Text("Score: \(score) out of \(maxTurns)")
            .font(.largeTitle)
            .bold()
    }
}

#Preview {
    ScoreView(score: 2, maxTurns: 5)
}
