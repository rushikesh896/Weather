//
//  Enums.swift
//  Weather
//
//  Created by Reem Daraghmeh on 1/24/20.
//  Copyright © 2020 Reem Daraghmeh. All rights reserved.
//

import Foundation

enum City: String {
    case delhi
    case mumbai
    case kolkata
    case goa
    case hyderabad
    case chennai
    case nagpur
    case amritsar
    case kochi
    case surat
}

enum FailureError : String {
    case jsonEncodingFailed = "JSON Encoding Failed"
    case emptyData = "Empty Data"
}
