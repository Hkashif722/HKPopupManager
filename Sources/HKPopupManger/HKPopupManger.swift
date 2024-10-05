// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Combine

public enum PopupType {
    case alert
    case popup
}

public class PopupManager: ObservableObject {
    @Published public var isPresented: Bool = false
    @Published public var isAlert: Bool = false
    @Published public var popupType: PopupType? = nil
    @Published public var content: AnyView? = nil
    @Published public var alertTitle: String? = nil
    @Published public var alertMessage: String? = nil

    public init() {}
    
    public func showAlert(title: String, message: String) {
        self.showAlert(title: title, message: message, content: nil as AnyView?)
    }

    public func showAlert<Content: View>(title: String, message: String, content: Content? = nil) {
        self.alertTitle = title
        self.alertMessage = message
        if let customContent = content {
            self.content = AnyView(customContent)
        } else {
            self.content = nil
        }
        self.popupType = .alert
        self.isPresented = true
        self.isAlert = true
    }


    public func showPopup<Content: View>(content: Content) {
        self.content = AnyView(content)
        self.popupType = .popup
        self.isPresented = true
        self.isAlert = false
    }

    public func hide() {
        self.isPresented = false
        self.content = nil
        self.popupType = nil
        self.alertTitle = nil
        self.alertMessage = nil
        self.isAlert = false
    }
}
