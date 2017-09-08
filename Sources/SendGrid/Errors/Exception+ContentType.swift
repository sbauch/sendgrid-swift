//
//  Exception+ContentType.swift
//  SendGrid
//
//  Created by Scott Kawai on 9/8/17.
//

import Foundation

public extension Exception {
    
    /**
     
     The `ContentType` enum contains all the errors thrown by `ContentType`.
     
     */
    public enum ContentType: Error, CustomStringConvertible {
        
        // MARK: - Cases
        //=========================================================================
        
        /// Thrown when there was a problem encoding the username and password.
        case invalidContentType(String)
        
        
        // MARK: - Properties
        //=========================================================================
        
        /// A description for the error.
        public var description: String {
            switch self {
            case .invalidContentType(let type):
                return "Invalid content type \"\(type)\": Content types cannot contain ';', ',', spaces, or CLRF characters."
            }
        }
    }
}
