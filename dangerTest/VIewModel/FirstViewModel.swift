//
//  FirstVIewModel.swift
//  dangerTest
//
//  Created by 이장훈 on 2021/07/10.
//

import Foundation

struct FirstViewModel {
    var testCaseOne: Bool {
        true
    }
    
    var testCaseTwo: String {
        if #available(iOS 13.0, *) {
            return "testCaseTwo"
        } else {
            return "testCaseTwo"
        }
        return "testCaseTwo"
    }

    var testCaseThree: Bool {
        true
    }

    var testCaseFour: Bool {
        false
    }

    var testCaseFive: Bool {
        true
    }

    var testCaseSix: Bool {
        true
    }

    var testCaseSeven: Bool {
        false
    }

}
