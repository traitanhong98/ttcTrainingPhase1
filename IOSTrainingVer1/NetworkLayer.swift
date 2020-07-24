//
//  NetworkLayer.swift
//  IOSTrainingVer1
//
//  Created by Trung Nguyen on 7/13/20.
//  Copyright © 2020 Trung Nguyen. All rights reserved.
//

import UIKit
import ObjectMapper

class NetworkLayer {    
    static func callAPI<T: Mappable>(type: T.Type, completionHandler: @escaping (T) -> Void) {
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



