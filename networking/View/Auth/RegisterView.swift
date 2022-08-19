//
//  RegisterView.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 16/08/22.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var registerVM = RegisterViewModel()
    
    @Binding var login : UserSession?
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()

                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .padding()
                            .background(.white)
                    })
                }
                .padding()
                
                VStack(spacing: 15) {
                    HStack(spacing: 15) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .foregroundColor(.gray)
                                        
                        CustomerTextField(placeholder: Text("Nome").foregroundColor(.gray), text: $registerVM.name)
                    }
                    .frame(height: 30)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.purple, lineWidth: 1)
                    )
                    .padding(.horizontal)
                    
                    HStack(spacing: 15) {
                        Image(systemName: "envelope")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .foregroundColor(.gray)
                                        
                        CustomerTextField(placeholder: Text("E-mail").foregroundColor(.gray), text: $registerVM.email)
                    }
                    .frame(height: 30)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.purple, lineWidth: 1)
                    )
                    .padding(.horizontal)
                                    
                    HStack(spacing: 15) {
                        Image(systemName: "key")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.gray)
                                        
                        CustomerSecureField(placeholder: Text("Senha").foregroundColor(.gray), text: $registerVM.password)
                    }
                    .frame(height: 30)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.purple, lineWidth: 1)
                    )
                    .padding(.horizontal)
                        
                    Button (action: {
                        Task {
                            login = await registerVM.createNewUser() // revisar pq não está fazendo login
                            
                            print("Eu sou login: \(String(describing: login))")
                            presentation.wrappedValue.dismiss()
                        }
                    }, label: {
                        Text("Registrar-se")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                    })
                    .padding(.top)
                }
            }
        }
    }
}
