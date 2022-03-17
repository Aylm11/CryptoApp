//
//  ViewModel.swift
//  CryptoApp
//
//  Created by Ali YILMAZ on 16.03.2022.
//

import Foundation
import Combine

class ViewModel : ObservableObject {
    
    @Published var cryptoList = [cryptoViewModel]()
    
    let service = Service()
    
    func downloadData(url : URL){
        
        service.fetchData(url: url) { result in
            switch result {
                
            case .failure(let error):
                print(error)
                
            case .success(let cryptos):
                if let cryptos = cryptos {
                    
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(cryptoViewModel.init)
                    }
                    
                }
                
                
            }
        }
        
    }
    
    
    
    
}


struct cryptoViewModel{
    
    let crypto : cryptoModel
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String{
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
   
}
