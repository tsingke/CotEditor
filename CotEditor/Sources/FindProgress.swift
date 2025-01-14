//
//  FindProgress.swift
//
//  CotEditor
//  https://coteditor.com
//
//  Created by 1024jp on 2022-12-11.
//
//  ---------------------------------------------------------------------------
//
//  © 2022 1024jp
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  https://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

final class FindProgress: ObservableObject {
    
    let scope: Range<Int>
    var completedUnit = 0
    var count = 0
    
    @Published var isCancelled = false
    @Published var isFinished = false
    
    
    /// Instantiate a progress.
    ///
    /// - Parameter scope: The range of progress unit to work with.
    init(scope: Range<Int>, completedUnit: Int = 0) {
        
        self.scope = scope
        self.completedUnit = completedUnit
    }
    
    
    /// The fraction of task completed in between 0...1.0.
    var fractionCompleted: Double {
        
        if self.isFinished {
            return 1
        } else if self.scope.isEmpty {
            return 0
        } else {
            return Double(self.completedUnit) / Double(self.scope.count)
        }
    }
}
