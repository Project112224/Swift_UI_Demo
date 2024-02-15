//
//  AlertType.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

enum AlertType {
    
    case success
    case custom(title: String, message: String = "", leftActionText: String = "", rightActionText: String = "")
    
    func title() -> String {
        switch self {
        case .success:
            return "Success"
        case .custom(title: let title, _, _, _):
            return title
        }
    }

    func message() -> String {
        switch self {
        case .success:
            return "Please confirm that you're still open to session requests"
        case .custom(_, message: let message, _, _):
            return message
        }
    }
    
    var leftActionText: String {
        switch self {
        case .success:
            return "Go"
        case .custom(_, _, leftActionText: let actionText, _):
            return actionText
        }
    }
    
    var rightActionText: String {
        switch self {
        case .success:
            return "Cancel"
        case .custom(_, _, _, rightActionText: let actionText):
            return actionText
        }
    }
    
    func height(isShowVerticalButtons: Bool = false) -> CGFloat {
        switch self {
        case .success:
            return isShowVerticalButtons ? 220 : 150
        case .custom(_, _, _, _):
            return isShowVerticalButtons ? 220 : 150
        }
    }
}
