//
//  IGTextFieldModifier.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/6/24.
//
import SwiftUI
import Foundation

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
