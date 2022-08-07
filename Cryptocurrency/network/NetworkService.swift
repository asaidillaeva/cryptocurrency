//
//  NetworkService.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }
    
    func sendRequest<SuccessModel: Codable> (
        router: BaseRouter,
        successModel: SuccessModel.Type,
        completion: @escaping (Result<SuccessModel, Error>) -> ()
    ) {
        urlSession.dataTask(with: router.getUrlRequest()) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code is: " + response.statusCode.description)
                print(response.url!)
            }
            
            guard let data = data else { return }
            guard
                let object = try? JSONSerialization.jsonObject(with: data, options: []),
                let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
                let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            else { return }
            print(#function, prettyPrintedString)
            
            if let parsedModel = self.transform(data: data, model: successModel) {
                DispatchQueue.main.async {
                    
                    
                    print("parsedModel is \(parsedModel)")
                    completion(.success(parsedModel))
                }
            } else {
                print("Invalid Model")
            }
        }.resume()
    }
    
    private func transform<SuccessModel: Codable>(data: Data?, model: SuccessModel.Type) -> SuccessModel? {
        var res: SuccessModel?
        do {
            try res =  JSONDecoder().decode(model, from: data!)
        
        } catch let DecodingError.dataCorrupted(context) {
            print( "Data currupted \(context)")
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        return res
    }
    
}
