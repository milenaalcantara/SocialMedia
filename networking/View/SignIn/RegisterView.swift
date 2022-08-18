//
//  RegisterView.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 16/08/22.
//

import SwiftUI

struct RegisterView: View {
    var userVM: UserViewModel = UserViewModel()
    var loginVM: LoginViewModel = LoginViewModel()
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var passwordAgain = ""
    
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
//                            .clipShape(Circle())
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
                                        
                        CustomerTextField(placeholder: Text("Nome").foregroundColor(.gray), text: $name)
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
                                        
                        CustomerTextField(placeholder: Text("E-mail").foregroundColor(.gray), text: $email)
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
                                        
                        CustomerSecureField(placeholder: Text("Senha").foregroundColor(.gray), text: $password)
                    }
                    .frame(height: 30)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.purple, lineWidth: 1)
                    )
                    .padding(.horizontal)
                        
                    Button (action: {
                        let newUser = NewUser(name: name, email: email, password: password)
                        Task {
                            let createdUser =  await userVM.createNewUser(newUser: newUser)
                            
                            let session = await loginVM.initSession(
                                isNewUser: true,
                                email: (createdUser?.user.email)!,
                                password: password
                            )
                            
                            presentation.wrappedValue.dismiss()
                            
                            if (!(session?.token.isEmpty)!) {
                                print("entrou aqui")
                                PostList()
                            } else {
                                print("Não entrou, acho que nao cadastrou nada...")
                            }
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
