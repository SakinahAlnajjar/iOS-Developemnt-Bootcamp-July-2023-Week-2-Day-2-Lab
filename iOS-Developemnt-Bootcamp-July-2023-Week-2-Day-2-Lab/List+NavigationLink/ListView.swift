//
//  ListView.swift
//  iOS-Developemnt-Bootcamp-July-2023-Week-2-Day-2-Lab
//
//  Created by سكينه النجار on 06/08/2023.
//

import SwiftUI

struct Details : Hashable  {
    var title: String
    var itemImg: String
}


struct ListView: View {
    var menueTitle : String
    var type: CategoryType
    
    var foodList: [Details] = [
        Details(title: "Water", itemImg: "img2"),
        Details(title: "Juice", itemImg: "img3"),
        Details(title: "Fruit", itemImg: "img1"),
        Details(title: "Pop Corn", itemImg: "img4")]
    
    var marketList: [Details] = [
        Details(title: "Basket", itemImg: "basket"),
        Details(title: "toothPaste", itemImg: "toothpaste"),
        Details(title: "Shampoo", itemImg: "shampoo")]
    
    var packegeList: [Details] = [
        Details(title: "Cartoons", itemImg: "cartoon"),
        Details(title: "Bags", itemImg: "bags")]
    
    var body: some View {
        Form{
            Section(menueTitle){
                switch type {
                case .food:
                    List(foodList , id: \.self) { item in
                        rowStyle(item: item)
                    }
                case .market:
                    List(marketList , id: \.self) { item in
                        rowStyle(item: item)

                    }
                case .packages:
                    List(packegeList , id: \.self) { item in
                        rowStyle(item: item)
                    }
                }
            }
        }
    }
    
    func rowStyle(item: Details) -> some View {
        HStack{
            Image(systemName: "star.fill")
                .foregroundColor(.purple)
            NavigationLink {
                ItemDetails(itemImg: item.itemImg, title: item.title)
            } label: {
                Text(item.title)
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(menueTitle: "title", type: .food)
    }
}
