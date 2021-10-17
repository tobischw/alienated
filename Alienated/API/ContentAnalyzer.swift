//
//  ContentAnalyzer.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/17/21.
//

import Foundation

enum ContentType {
    case image
    case gif
    case video
    case unknown(URL)
}

enum Host {
    case imgur
    case gfycat
    case other(String)
    
    static func fromHost(host: String) -> Host {
        switch host {
            case "imgur.com": return .imgur
            case "gfycat.com": return .gfycat
            default: return .other(host)
        }
    }
}

struct ContentAnalyzer {
    public static func analyze(url: URL) -> ContentType {
        guard let urlHost = url.host else {
            return .unknown(url)
        }
        
        let host = Host.fromHost(host: urlHost)
        let fileExtension = url.pathExtension
        
        switch (host, fileExtension) {
            case (.imgur, _):
                return .image
            case (_, "mp4"):
                return .video
            case (_, "gif"):
                return .gif
            default:
                return .unknown(url)
        }
    }
}
