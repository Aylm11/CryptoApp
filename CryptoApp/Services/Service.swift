//
//  Service.swift
//  CryptoApp
//
//  Created by Ali YILMAZ on 16.03.2022.
//

import Foundation

class Service {
    
    
    
    func fetchData(url : URL, completion : @escaping(Result<[cryptoModel]?,DownloaderError>) -> Void ){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.initalError))
                
            }
            
            guard let data = data , error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([cryptoModel].self, from : data) else {
                
                return completion(.failure(.ParseError))
                
            }
            
            completion(.success(currencies))
        }.resume()
        
        
    }
    
    
    enum DownloaderError : Error {
        
        case initalError
        case noData
        case ParseError
    }
}
