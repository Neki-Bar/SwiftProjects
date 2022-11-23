//
//  Dynamic.swift
//  firstApp
//
//  Created by Nikita on 25.10.2022.
//

import Foundation

final class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    private var isBind = false
    var isBinded: Bool {
        get {
            return isBind
        }
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        self.isBind = true
    }
    
    var value: T {
        didSet {
            emitChange()
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    func emitChange() {
        listener?(value)
    }
}
