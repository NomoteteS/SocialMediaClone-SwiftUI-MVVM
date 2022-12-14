//
//  UserStatsView.swift
//  TwitterCloneSwiftUI
//
//  Created by NomoteteS on 25.11.2022.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack(spacing: 4) {
                Text("1000")
                    .font(.subheadline).bold()
                
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("2223").bold()
                    .font(.subheadline).bold()
                
                Text("Follows")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
