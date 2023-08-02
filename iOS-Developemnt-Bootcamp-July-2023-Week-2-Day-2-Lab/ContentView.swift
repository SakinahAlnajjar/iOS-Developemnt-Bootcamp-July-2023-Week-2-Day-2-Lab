//
//  ContentView.swift
//  iOS-Developemnt-Bootcamp-July-2023-Week-2-Day-2-Lab
//
//  Created by سكينه النجار on 02/08/2023.
//

import SwiftUI



struct FoodData: Identifiable{
    var id: UUID = UUID()
    var category : String
    var time : String
    var cat_image: String
}


struct ContentView: View {
    
    @State var searchTxt : String = ""
    
    var data: [FoodData] = [
        FoodData(category: "Food", time: "25 min", cat_image: "food"),
        FoodData(category: "Maket", time: "20 min", cat_image: "SuperMarket"),
        FoodData(category: "Package", time: "15 min", cat_image: "package")]
    
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView(.vertical) {
                    HStack{
                        Text("Ninja")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .foregroundColor(.indigo)
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                    }
                    
                    HStack{
                        TextField("search", text: $searchTxt)
                            .padding()
                            .frame(height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth:1))
                        
                        NavigationLink {
                            OrderView(searchTxt: $searchTxt)
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .padding()
                                .foregroundColor(.gray)
                        }
                    }
                    
                    HStack(spacing: 15){
                        ForEach(data) { item in
                            CustomView(category: item.category, time: item.time, img: item.cat_image)
                        }
                    }
                    .padding(.bottom)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.yellow.opacity(0.1))
                            .frame(height: 120)
                            .cornerRadius(20)
                        VStack(alignment: .leading){
                            Text("Get up to")
                                .font(.system(size: 14))
                            Text("25% off")
                                .bold()
                                .font(.system(size: 19))
                            Text("item.time")
                                .font(.system(size: 14))
                            Button {
                                // no action
                            } label: {
                                Text("Order now")
                                    .foregroundColor(Color.white)
                                    .frame(width: 100, height: 30)
                                    .background(.brown)
                                    .cornerRadius(10)
                            }
                        }
                        .foregroundColor(Color.brown)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                        
                        Image("food")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        
                    }
                    
                }
            }
            .padding()
        }
    }
}

struct OrderView: View {
    @Binding var searchTxt: String
    var body: some View {
        VStack {
            Text("search for \(searchTxt)")
                .foregroundColor(.brown)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
