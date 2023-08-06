//
//  ItemDetails.swift
//  iOS-Developemnt-Bootcamp-July-2023-Week-2-Day-2-Lab
//
//  Created by سكينه النجار on 06/08/2023.
//

import SwiftUI

struct ItemDetails: View {
    var itemImg: String
    var title: String
    @State private var iaAnimate = false
    
    var body: some View {
        Image(itemImg)
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 400, alignment: .center)
            .navigationTitle(title)
            .scaleEffect(iaAnimate ? 1.0 : 0.5)
            .onAppear{
                withAnimation {
                    iaAnimate = true
                }
            }
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(itemImg: "person", title: "title")
    }
}
