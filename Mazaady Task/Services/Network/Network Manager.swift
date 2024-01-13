//
//  Network Manager.swift
//  Mazaady Task
//
//  Created by Mustafa on 12/01/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    //MARK: - Single Shared Instance
    static let sharedNetworkManager = NetworkManager()
    private init(){}
    

    private let headerPrivateKey:HTTPHeaders = [
        "private-key" : "3%o8i}_;3D4bF]G5@22r2)Et1&mLJ4?$@+16",
        "Content-Type": "application/json"
    ]
    
    

    //MARK: - Fetching Data From ApI
    func fetchData<T:Decodable>(url:BaseURL , decodingModel:T.Type , completion: @escaping (Result<T,Error>)->Void){
        
        AF.request(url.endpoint,headers: headerPrivateKey).validate().responseDecodable(of: T.self) { response in
            switch response.result{
            case .success(let DecodedData):
                completion(.success(DecodedData))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
        
    }
    
    
}
