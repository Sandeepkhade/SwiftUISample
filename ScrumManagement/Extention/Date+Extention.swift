//
//  Date+Extention.swift
//  ScrumManagement
//
//  Created by Sandeep Khade on 24/10/23.
//

import Foundation

extension Date {
    
    func toString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
                
        let result = dateFormatter.string(from: self)
        return result
    }
}
