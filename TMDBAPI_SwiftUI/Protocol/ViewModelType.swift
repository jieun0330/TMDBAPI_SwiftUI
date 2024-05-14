//
//  ViewModelType.swift
//  TMDBAPI_SwiftUI
//
//  Created by 박지은 on 5/12/24.
//

import Foundation
import Combine

protocol ViewModelType: AnyObject, ObservableObject {
    associatedtype Input
    associatedtype Output
    
    var cancellables: Set<AnyCancellable> { get set }
    
    var input: Input { get set }
    var output: Output { get set }
    
    func transform()
}
