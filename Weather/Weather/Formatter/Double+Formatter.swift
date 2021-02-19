//
//  Double+Formatter.swift
//  Weather
//
//  Created by 최정민 on 2021/02/20.
//

import Foundation


fileprivate let temperatureFormatter: MeasurementFormatter = {
    let f = MeasurementFormatter()
    f.locale = Locale.init(identifier: "ko_kr")
    f.numberFormatter.maximumFractionDigits = 1
    f.unitOptions = .temperatureWithoutUnit
    return f
    
}()


extension Double {
    
    var tempertureString: String{
        let temp = Measurement<UnitTemperature>(value: self, unit: .celsius)
        return temperatureFormatter.string(from : temp)
        
    }
}
