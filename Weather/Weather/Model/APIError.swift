//
//  APIError.swift
//  Weather
//
//  Created by 최정민 on 2021/02/20.
//

import Foundation


enum ApiError : Error{
    case unknown
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}
