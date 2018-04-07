//
//  FieldSurveyJSONLoader.swift
//  Field Survey
//
//  Created by Bryan Yu on 4/6/18.
//  Copyright © 2018 Bryan Yu. All rights reserved.
//

import Foundation

class FieldSurveyJSONLoader {
    
    class func load(fileName: String) -> [FieldSurvey] {
        var fields = [FieldSurvey]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            fields = FieldSurveyJSONParser.parse(data)
        }
        
        return fields
        
    }
}
