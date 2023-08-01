//
//  CustomView.swift
//  iOS-Developemnt-Bootcamp-July-2023-Week-2-Day-2-Lab
//
//  Created by سكينه النجار on 02/08/2023.
//

import SwiftUI

struct CustomView: View {
    @State var category : String
    @State var time : String
    @State var img : String

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.1))
                .frame(height: 120)
                .cornerRadius(20)
            VStack(alignment: .leading){
                Text(category)
                    .bold()
                Text(time)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            
            Image(img)
                .resizable()
                .frame(width: 50, height: 50)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(3)
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView(category: "", time: "", img: "")
    }
}
