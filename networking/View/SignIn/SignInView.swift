//
//  SignInView.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 16/08/22.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Image(systemName: "envelope")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                        .foregroundColor(.gray)
                                            
                    CustomerTextField(placeholder: Text("Email").foregroundColor(.gray), text: $email)
                }
                .frame(height: 20)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.purple, lineWidth: 1)
                )
                .padding(.horizontal)
                
                HStack(spacing: 15) {
                    Image(systemName: "key")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25).foregroundColor(.gray)
                    
                    CustomerSecureField(
                        placeholder: Text("Password").foregroundColor(.gray),
                        text: $password)
                }
                .frame(height: 20)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.purple, lineWidth: 1)
                )
                .padding(.horizontal)
                
//                Button (action: {
//                   return
//
//                    }
//                }, label: {
//                    Text("Entrar")
//                    .font(.title)
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 60)
//                    .background(Color.purple)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//                    .padding(.horizontal)
//                })
//                .padding(.top)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
