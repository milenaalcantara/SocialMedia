//
//  SignInView.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 16/08/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    
    @State var presentSignUp = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 15) {
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
                        let session = await loginVM.initSession(isNewUser: false)
                        
                        if ((session?.token.isEmpty)!) {
                            print("token vazio")
                        } else {
                            PostList()
                        }
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
//                .disabled(loginVM.loginDisabled)
//                .padding(.bottom,20)
                .padding(.top, 30)
                
//                Image("LaunchScreen")
//                    .onTapGesture {
//                        UIApplication.shared.endEditing()
//                    }
                Spacer()
                
                Button(action: {
                    presentSignUp.toggle()
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
        .sheet(isPresented: $presentSignUp, content: {
            RegisterView()
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
