//
//  FakeViewModel.swift
//  dangerTest
//
//  Created by 이장훈 on 2021/07/25.
//

import Foundation

struct FakeViewModel {
    var fakeOne: Bool {
        if #available(iOS 13.0, *) {
            return false
        } else {
            return true
        }
    }
}
