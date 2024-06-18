//
//  CompleteSignUpView.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/10/24.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
        var body: some View {
            VStack(spacing: 12) {
                Spacer()
                Text("Welcome to Instagram,   @m.yang3108")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                    .multilineTextAlignment(.center)
                
                Text("Click below to complete registration and start using Instagram")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                
                Button {
                    print("Complete Signup")
                } label: {
                    Text("Complete Signup")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                
                .padding(.vertical)
               
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
}

#Preview {
    CompleteSignUpView()
}
