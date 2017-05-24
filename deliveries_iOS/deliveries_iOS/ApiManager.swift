//
//  ApiManager.swift
//  deliveries_iOS
//
//  Created by XCodeClub on 2017-05-23.
//  Copyright © 2017 Ben Liong. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SwiftyJSON

enum ApiError: Error {
    case unknownError
    case connectionError
    case invalidCredentials
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    case unsuppotedURL
}

typealias CompletionClosure = (AnyObject?, Error?) -> Void
//typealias ArrayCompletionClosure = ([AnyObject], city:City?, ErrorType?) -> Void
typealias PaginatedArrayCompletionClosure = (_ objects:[Any]?, _ next:Int?, _ error:Error?) -> Void



class ApiManager: NSObject {
    static let googleMapsAPIKey = "AIzaSyB40OFEYp8XCstAsg9U6R6uKRgaYnDG9co"
    static let shared = ApiManager()
    var baseURLString = "http://192.168.1.100:8080/"
    func getDeliveries(atOffset offset:Int = 0, completionHandler:@escaping PaginatedArrayCompletionClosure) {
        let urlString = baseURLString.appending("deliveries")
        let parameters = ["offset" : offset]
        Alamofire.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default).validate().responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completionHandler(nil, nil, error)
            case .success(let value):
                let json = JSON(value)
                guard   let jsonString = json.rawString(),
                        let deliveries:Array<Delivery> = Mapper<Delivery>().mapArray(JSONString: jsonString) else {
                    completionHandler(nil, nil, ApiError.invalidResponse)
                    return
                }
                completionHandler(deliveries, offset + deliveries.count, nil)
            }
        }
    }
}
