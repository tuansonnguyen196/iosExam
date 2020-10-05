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
        //        AF.request("https://my-json-server.typicode.com/vantrung8794/ttcTrainingRepo/db", method: .get).responseString(completionHandler: { (response) in
        ////            print(response)
        ////            guard let jsonData = response.data else {
        ////                return
        ////            }
        ////            if let jsonString = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? Sring {
        //            switch response.result {
        //            case .success(result):
        ////                var result:EmployeeBO?
        //                var result1 = Mapper<EmployeeBO>().map(JSONString: response.result)
        //                print(result1)
        //            case .failure(_):
        //
        //            }
        //
        ////            }
        //        })
        guard let url = URL(string: "https://my-json-server.typicode.com/vantrung8794/ttcTrainingRepo/db") else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
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
