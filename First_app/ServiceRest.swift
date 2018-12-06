//
//  ServiceRest.swift
//  First_app
//
//  Created by Roman IamRoman on 10/18/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

import Foundation
import Alamofire
//import ObjectMapper
//import RealmSwift

class ServiceRest: NSObject {
    private static let BASE_URL = "https://sensum-api.tk/api/";
    private static let HEADER_AUTH = "Authorization"
    private static let DEFAULT_HEADERS: HTTPHeaders = [
        "Accept": "application/json",
        "Content-type": "application/json"
    ];
    private static let GET_INBOX_MESSAGE_URL = "message-inbox/";
    
    static func getInboxMessage() {
        makeRequest(urlString: GET_INBOX_MESSAGE_URL, method: .get, addAuthHeader: true, parameters: DEFAULT_HEADERS, completion: {
            response in
//            let user = Mapper<User>().map(JSONObject: response.value! as! [String : Any])
//            let json: JSONObject = response.value;
            print("parse user success, users count", response.value ?? "nil")
        })
    }
    
    static func makeRequest(urlString: String, method: HTTPMethod, addAuthHeader: Bool, parameters: HTTPHeaders, completion:  @escaping (DataResponse<Any>) -> Void) {
        
        let encoding: ParameterEncoding = (method == .get || method == .delete ? URLEncoding.default : JSONEncoding.default)
        
        makeRequest(urlString: urlString, method: method, addAuthHeader: addAuthHeader, parameters: parameters, encoding: encoding, completion: completion)
    }
    
    static func makeRequest(urlString: String, method: HTTPMethod, addAuthHeader: Bool, parameters: HTTPHeaders, encoding: ParameterEncoding, completion:  @escaping (DataResponse<Any>) -> Void) {
        
        let fullUrl = urlString.starts(with: "https") ? urlString : BASE_URL + urlString;
        
        var headers : HTTPHeaders = parameters
        
        if (parameters != nil) {
            print("request parameters ", parameters.count)
        }
        
        if (addAuthHeader) {
            let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJwaG9uZV9udW1iZXIiOiIrMzgwNjg5MDg1NjI2IiwidXNlcm5hbWUiOiIrMzgwNjg5MDg1NjI2IiwiZXhwIjoxNTM3NDQ4OTkyLCJlbWFpbCI6ImdhbGlub3Y4N3JvbWFuQGdtYWlsLmNvbSJ9.5Ra7YLL8vRw7di4fKQB-Q1romlzXfHYjJ7TwGTsYAdk"; // UserPrefs.getAccessToken()
            if (token == nil) {
                NSLog("token not found")
                return
            }
            
            NSLog("access token for header %@", token)
            
            headers[HEADER_AUTH] = "Bearer " + token
            
        }
        
        let url =  URL(string: fullUrl)!
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON{
                response in
                debugPrint("url", response.request!.url!)
                debugPrint(response.request!)
                debugPrint(response.request!.allHTTPHeaderFields!)
                debugPrint("body", response.request!.httpBody?.description)
                debugPrint(response)
                switch response.result {
                    
                case .success:
                    completion(response)
                    
                case .failure(let error):
                    print("proceedErrors \(error).")
                }
        }
    }
}
