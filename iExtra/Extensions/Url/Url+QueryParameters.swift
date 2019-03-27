//
//  Url_QueryParameters.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension URL {
    
    
    // MARK: - Public Properties
    
    var queryParameters: [URLQueryItem] {
        return URLComponents(string: absoluteString)?.queryItems ?? [URLQueryItem]()
    }
    
    var queryParametersDictionary: [String: String] {
        var result = [String: String]()
        queryParameters.forEach { result[$0.name] = $0.value ?? "" }
        return result
    }
    
    
    // MARK: - Public Functions
    
    func getQueryParameter(named name: String) -> URLQueryItem? {
        return queryParameters.first { $0.isNamed(name) }
    }
    
    func setQueryParameter(name: String, value: String) -> URL? {
        guard let urlString = absoluteString.components(separatedBy: "?").first else { return self }
        let param = getQueryParameter(named: name)
        let name = param?.name ?? name
        var dictionary = queryParametersDictionary
        dictionary[name] = value
        let queryString = dictionary.urlEncoded()
        return URL(string: "\(urlString)?\(queryString)")
    }
    
    func setQueryParameters(_ dict: [String: String]) -> URL? {
        var result = self
        dict.forEach {
            result = result.setQueryParameter(name: $0, value: $1) ?? result
        }
        return result
    }
}


// MARK: - Dictionary Extensions

private extension Dictionary {
    
    func urlEncoded() -> String {
        let parameterArray = map { (key, value) -> String in
            guard let key = key as? String, let value = value as? String else { return "" }
            return "\(key.urlEncoded())=\(value.urlEncoded())"
        }
        return parameterArray.joined(separator: "&")
    }
}


// MARK: - URLQueryItem Extensions

private extension URLQueryItem {
    
    func isNamed(_ name: String) -> Bool {
        return self.name.lowercased() == name.lowercased()
    }
}
