//
//  DateFormatter + Time.swift
//  Relax App
//
//  Created by Ivan Budovich on 3/28/22.
//

import Foundation

extension Date {
    static var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.timeStyle = .short
        return formatter
    }
    
    var time: String {
        Date.timeFormatter.string(from: self)
    }
}
