//
//  FieldSurveyJSONParser.swift
//  Field Survey
//
//  Created by Bryan Yu on 4/6/18.
//  Copyright © 2018 Bryan Yu. All rights reserved.
//

import Foundation

class FieldSurveyJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    
    class func parse(_ data: Data) -> [FieldSurvey] {
        var fieldSurvey = [FieldSurvey]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String] {
                        if let classificationName = observation["classification"],
                           let title = observation["title"],
                           let descriptionString = observation["description"],
                           let dateString = observation["date"],
                           let date = dateFormatter.date(from: dateString) {
                           
                            if let fieldSurveys = FieldSurvey(fieldName: classificationName, title: title, description: descriptionString, date: date) {
                                fieldSurvey.append(fieldSurveys)
                                
                            }
                        }
                    }
                }
            }
            
        }
        
        return fieldSurvey
    }
    
}
