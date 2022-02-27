//
//  NetworkService.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/25/22.
//

import Foundation
import Alamofire

final class NetworkService {
    func forecast(sign: HoroscopeSign) async -> Forecast? {
        return await withCheckedContinuation { resume in
            AF.request("https://aztro.sameerkumar.website?sign=\(sign.description.lowercased)&day=today", method: .post, parameters: Array<String>(), encoder: JSONParameterEncoder(encoder: JSONEncoder()), headers: nil, interceptor: nil, requestModifier: nil).responseData { response in
                if let data = response.data, let forecast = try? JSONDecoder().decode(Forecast.self, from: data) {
                    resume.resume(returning: forecast)
                }
                else {
                    resume.resume(returning: nil)
                }
            }
        }
    }
}
