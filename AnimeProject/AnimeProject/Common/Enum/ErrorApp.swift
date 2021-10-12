//
//  ErrorApp.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 10/10/21.
//

import Foundation

enum ErrorApp: Error {
    case serializingData
    case runtimeError(String)
}

extension ErrorApp: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .runtimeError(let string):
            return NSLocalizedString(string, comment: " ")
        case .serializingData:
            return NSLocalizedString("Error serializando la data", comment: " ")
        }
    }
}
