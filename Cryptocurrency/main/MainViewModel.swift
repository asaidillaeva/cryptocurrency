//
//  MainViewModel.swift
//  Cryptocurrency
//
//  Created by Aliia Saidillaeva  on 2/8/22.
//

import Foundation

protocol IMainViewModel {
    var data: [Crypto] { get }
    func getAllData(completion: @escaping (Result<[Crypto], Error>) -> ())
    func getCoinLogo(id: Int, completion: @escaping (Result<String, Error>) -> ())
}

class MainViewModel: IMainViewModel {
    var data: [Crypto] = []
    
    func getAllData(completion: @escaping (Result<[Crypto], Error>) -> ()) {
        NetworkService.shared.sendRequest(
            router: CryptoRouter.getAll,
            successModel: CryptoResponse.self) { result in
                switch result {
                case .success(let response):
                    self.data = response.crypto!
                    completion(.success(self.data))

                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func getCoinLogo(id: Int, completion: @escaping (Result<String, Error>) -> ()) {
        NetworkService.shared.sendRequest(
            router: CryptoRouter.getLogo(id: id),
            successModel: LogoResponse.self) { result in
                switch result {
                case .success(let data):
                    completion(.success(data.data?.logoModel?.logo ?? ""))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
