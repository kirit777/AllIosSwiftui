//
//  HomeScreen.swift
//  Finance
//
//  Created by Kirit on 07/07/23.
//

import SwiftUI

struct HomeScreen: View {
    
    let items = (1...20).map { "Item \($0)" }
    let gridItems = [GridItem(.flexible())]
    @State var itemArr:NSMutableArray!
    @State var isPresentedDetail:Bool = false
    @State var currentTitle:String = ""
    func createDict(index:String,title:String,desc:String,price:String,per:String)  -> NSMutableDictionary {
        
        let dict = NSMutableDictionary()
        dict["index"] = index
        dict["title"] = title
        dict["desc"] = desc
        dict["per"] = per
        dict["price"] = price
        return dict
    }
    
    func addData(){
        
        itemArr = NSMutableArray()
        
        itemArr.add(createDict(index: "0", title: "Sales", desc: "Total sales today", price: "$500", per: "59%"))
        itemArr.add(createDict(index: "1", title: "Profite", desc: "per day ratio", price: "$150", per: "45%"))
        itemArr.add(createDict(index: "2", title: "Orders", desc: "total orders today", price: "1000", per: "92%"))
        itemArr.add(createDict(index: "3", title: "Return", desc: "returns this month", price: "120", per: "10%"))
        
    }
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20,height: 40)
                })
                .frame(width: 50,height: 50)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 3,x: 1,y: 1)
                .padding(.leading , 30)
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image("imgProfile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .cornerRadius(20)
                        .padding(.all , 10)
                })
                .background(.white)
                .frame(width: 50,height: 50)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.5), radius: 3,x: 1,y: 1)
                .padding(.trailing , 30)
            }
            .padding(.top , 10)
            
            
            ScrollView(showsIndicators: false) {
                if (itemArr != nil) {
                    Section(header: headerView()) {
                        LazyVGrid(columns: gridItems, spacing: 16) {
                            
                            ForEach(0..<itemArr.count) { index in
                                if let dict = itemArr.object(at: index) as? NSMutableDictionary{
                                    ListCell(currentTitle: $currentTitle, dict: dict, isPresentedDetail: $isPresentedDetail)
                                }
                            }
                        }.padding()
                    }
                }
                
            }
            
          //  Spacer()
        }
        .onAppear(){
            self.addData()
        }
        .fullScreenCover(isPresented: $isPresentedDetail) {
            DetailScreen( title: $currentTitle, isPresentedDetail: $isPresentedDetail)
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

private struct headerView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Hello Favid")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    
                Text("Well come back")
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .padding(.top , -10)
            }
            .frame(alignment: .leading)
            .padding(.leading , 30)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "line.horizontal.3.decrease")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 40)
            })
            .frame(width: 50,height: 50)
            .background(.white)
            .padding(.trailing , 30)
        }
        .padding(.top , 50)
    }
}

private struct ListCell: View {
    @Binding var currentTitle:String
    @State var title:String = ""
    @State var desc:String = ""
    @State var price:String = ""
    @State var per:String = ""
    var dict:NSMutableDictionary!
    @State var currentColor:Color = Color.yellow
    @Binding var isPresentedDetail:Bool
    var body: some View {
        VStack{
            HStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(title)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        
                        Text(desc)
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .padding(.top,-4)
                        
                        Text(price)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.top,-4)
                    }.padding(.leading , 15)
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(currentColor.opacity(0.3))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Circle()
                                    .stroke(currentColor.opacity(1.0), lineWidth: 4)
                            )
                        Text(per)
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                    }.padding(.trailing , 15)
                    
                    Image(systemName: "arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15,height: 15)
                        .rotationEffect(.degrees(45))
                        .padding(.trailing , 15)
                    
                }.padding(.all ,10)
                    .background(currentColor.opacity(0.0))
                    
                
            }
            .frame(height: 150)
            .background(currentColor.opacity(0.5))
            .cornerRadius(30.0)
            .padding(.all ,5)
            .onTapGesture {
                currentTitle = title
                isPresentedDetail.toggle()
            }
        }
        .onAppear(){
            
            
            
            if let strIndex = dict["index"] as? String{
                if strIndex == "0"{
                    currentColor = Color.purple
                }else if strIndex == "1"{
                    currentColor = Color.pink
                }else if strIndex == "2"{
                    currentColor = Color.green
                }else if strIndex == "3"{
                    currentColor = Color.blue
                }
            }
            
            if let strTitle = dict["title"] as? String{
                title = strTitle
            }
            
            if let strDesc = dict["desc"] as? String{
             desc = strDesc
            }
            
            if let strPrice = dict["price"] as? String{
                price = strPrice
            }
            
            if let strPer = dict["per"] as? String{
                per = strPer
            }
        }
    }
    
}



