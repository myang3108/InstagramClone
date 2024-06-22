//
//  StatView.swift
//  InstagramClone
//
//  Created by Michael Yang on 5/19/24.
//

import SwiftUI

struct StatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text("\(title)")
                .font(.footnote)
            
        }
        .frame(width:76)
    }
}

#Preview {
    StatView(value:12, title:"Posts")
}
