//
//  AnswerController.swift
//  EightBall
//
//  Created by Yurii on 18.10.2021.
//

import Foundation
import UIKit

class AnswerController{
    
    enum AnswerControllerError: Error, LocalizedError {
    case badInternetConnection
    }
   
    func fetchAnswer (completion: @escaping (Result<Magic, Error>) -> Void){
        let urlComponents = URLComponents(string: "https://8ball.delegator.com/magic/JSON/q")!
        
        URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(AnswerControllerError.badInternetConnection))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            if let data = data {
                print(data)
                do {
                    let requestResponse = try jsonDecoder.decode(Magic.self, from: data)
                    completion(.success(requestResponse.self))
                } catch  {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
}


