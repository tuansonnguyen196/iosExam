//
//  RequestModel.swift
//  sonnt.trainingTTC
//
//  Created by Nero on 10/5/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import Foundation
import ObjectMapper

class RequestModel{
     static func getData<T: Mappable>(type: T.Type, completionHandler: @escaping (T) -> Void) {
        guard let url = URL(string: "https://my-json-server.typicode.com/vantrung8794/ttcTrainingRepo/db") else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data ?? Data(), options: []) as? [String: Any], let obj = T(JSON: json){
                    completionHandler(obj)
                }
            }catch {}
        })
        task.resume()
    }
}
