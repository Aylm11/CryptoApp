//
//  ContentView.swift
//  CryptoApp
//
//  Created by Ali YILMAZ on 16.03.2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel : ViewModel
    
    init(){
        self.viewModel = ViewModel()
    }
    
    var body: some View {
        NavigationView{
            List(viewModel.cryptoList, id : \.id){ crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        
                    Text(crypto.price)
                        .foregroundColor(.yellow)
                    
                    
                }
                
                
            }
            
            
            .navigationBarTitle("CryptoApp")
        }.onAppear{
            viewModel.downloadData(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
