//
//  LoginModel.swift
//  iOSArchitecture_MVVM
//
//  Created by Vivek Patel on 07/07/23.
//  Copyright © 2023 Surjeet Singh. All rights reserved.
//

import Foundation
import UIKit




final class LoginModel: Codable {
    var status : String?
    var messageID : Int?
    var message : String?
    var data: LoginData?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case messageID = "messageID"
        case message = "message"
        case data = "data"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        status = try values.decodeIfPresent(String.self, forKey: .status)
        messageID = try values.decodeIfPresent(Int.self, forKey: .messageID)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(LoginData.self, forKey: .data)
    }
}

struct LoginData : Codable{
    let _id : String?
    let email : String?
    let name : String?
    let role : Int?
    let image : String?
    let myreferalcode : String?
    let token : String?
    
    enum CodingKeys: String, CodingKey{
        case _id = "_id"  // here on right side name match with the API field asit is.
        case email = "email"
        case name = "name"
        case role = "role"
        case image = "image"
        case myreferalcode = "myreferalcode"
        case token = "token"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        
        email = try values.decodeIfPresent(String.self, forKey: .email)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        role = try values.decodeIfPresent(Int.self, forKey: .role)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        myreferalcode = try values.decodeIfPresent(String.self, forKey: .myreferalcode)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        
    }
}

