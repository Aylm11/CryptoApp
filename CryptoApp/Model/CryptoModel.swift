//
//  CryptoModel.swift
//  CryptoApp
//
//  Created by Ali YILMAZ on 16.03.2022.
//

import Foundation



struct cryptoModel : Hashable, Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    
    
    private enum CodingKeys : String, CodingKey {
        
        case currency = "currency"
        case price = "price"
    }
    
}
