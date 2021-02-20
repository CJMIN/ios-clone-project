//
//  Date+Formatter.swift
//  Weather
//
//  Created by 최정민 on 2021/02/20.
//

import Foundation

fileprivate let dateFormatter : DateFormatter = {
    let f = DateFormatter()
    f.locale = Locale(identifier: "ko-kr")
    return f
}()

extension Date {
    
    var dateString: String{
        dateFormatter.dateFormat = "M월 d일"
        return dateFormatter.string(from: self)
        
    }
    
    var timeString: String{
        dateFormatter.dateFormat = "HH:00"
        return dateFormatter.string(from:self)
    }
    
    
}
