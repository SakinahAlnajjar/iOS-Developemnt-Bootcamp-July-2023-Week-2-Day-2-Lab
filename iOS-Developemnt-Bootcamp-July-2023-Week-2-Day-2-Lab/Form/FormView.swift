//
//  FormView.swift
//  iOS-Developemnt-Bootcamp-July-2023-Week-2-Day-2-Lab
//
//  Created by سكينه النجار on 06/08/2023.
//

import SwiftUI

struct FormView: View {
    @State var name: String = ""
    @State var password : String = ""
    @State var isEmailValid : Bool = true
    @State var isPasswordValid : Bool = true
    @State var email: String = ""
    
    var body: some View {
        VStack{
            Text("Register")
                .font(.largeTitle)
                .bold()
            Form {
                Group {
                    TextField("name", text: .constant(""))
                    
                    SecureField("Enter a password", text: $password)
                    
                    TextField("email...", text: $email, onEditingChanged: { (isChanged) in
                        if !isChanged {
                            if textFieldValidatorEmail(self.email) {
                                self.isEmailValid = true
                            } else {
                                self.isEmailValid = false
                                self.email = ""
                            }
                        }
                    })
                }
                .font(.headline)
                .padding(10)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(20)
                .autocapitalization(.none)
            }
        }
        
        if !self.isEmailValid {
            Text("Email is Not Valid")
                .font(.callout)
                .foregroundColor(Color.red)
        }
        
        if validatePassword(self.password) {
            Text("Password is Not Valid")
                .font(.callout)
                .foregroundColor(Color.red)
        }
    }
    
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    func validatePassword(_ string: String) -> Bool {
        if string.count > 6 {
            return true
        } else {
            return false
        }
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
        
    }
}

