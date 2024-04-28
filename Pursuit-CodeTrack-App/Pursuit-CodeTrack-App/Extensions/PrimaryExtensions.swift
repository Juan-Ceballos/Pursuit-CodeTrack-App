//
//  File.swift
//  Pursuit-CodeTrack-App
//
//  Created by Juan ceballos on 4/28/24.
//

import Foundation

extension Array {
    func chunked(chunkSize: Int) -> [[Element]] {
        var chunkedArray = [[Element]]()
        var currIndex = 0
        
        while currIndex < self.count {
            let endIndex = Swift.min(currIndex + chunkSize, self.count)
            let chunk = Array(self[currIndex..<endIndex])
            chunkedArray.append(chunk)
            currIndex += chunkSize
        }
        
        return chunkedArray
    }
}
