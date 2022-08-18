//
//  SignInView.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 16/08/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginVM : LoginViewModel
    @Binding var login : UserSession?
    @State var isPresented : Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                Spacer()
                
                HStack(spacing: 15) {
                    Image(systemName: "envelope")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                        .foregroundColor(.purple)
                                            
                    CustomerTextField(placeholder: Text("Email").foregroundColor(.gray), text: $loginVM.credentials.email)
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
                        .frame(width: 25, height: 25).foregroundColor(.purple)
                    
                    CustomerSecureField(
                        placeholder: Text("Password").foregroundColor(.gray),
                        text: $loginVM.credentials.password)
                }
                .frame(height: 20)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.purple, lineWidth: 1)
                )
                .padding(.horizontal)
                
                Button(action: {
                    Task {
                        login = await loginVM.initSession()
                    }
                }, label: {
                    Text("Entrar")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                })
                .padding(.top, 30)
                
                Spacer()
                
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("Ainda não possui uma conta? \nRegistre-se agora.")
                        .underline()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                })
                .padding(.top)
            }
        }
        .padding()
        .sheet(isPresented: $isPresented, content: {
            RegisterView(login: $login)
        })
        .task {
            print("estou entrando aqui no login...")
        }
    }
}
