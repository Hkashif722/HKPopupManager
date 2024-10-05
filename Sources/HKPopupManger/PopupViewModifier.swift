//
//  PopupViewModifier.swift
//  PopupManagerPackage
//
//  Created by Kashif Hussain on 05/10/24.
//

import SwiftUI

public struct PopupViewModifier: ViewModifier {
    @EnvironmentObject public var popupManager: PopupManager

    public init() {}

    public func body(content: Content) -> some View {
        ZStack {
            content

            if popupManager.isPresented {
                ZStack {
                    if !popupManager.isAlert {
                        Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                    }

                    if popupManager.isAlert {
                        VStack(spacing: 10) {
                            if let title = popupManager.alertTitle {
                                Text(title)
                                    .font(.headline)
                                    .padding(.top)
                            }

                            if let message = popupManager.alertMessage {
                                Text(message)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }

                            if let alertContent = popupManager.content {
                                alertContent
                            }

                            Button("Close Alert") {
                                popupManager.hide()
                            }
                            .padding()
                        }
                        .frame(width: 300, height: popupManager.content == nil ? 200 : 250)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    } else if let popupContent = popupManager.content {
                        popupContent
                    }
                }
                .transition(.opacity)
                .zIndex(1)
            }
        }
    }
}

public extension View {
    func attachPopupManager() -> some View {
        self.modifier(PopupViewModifier())
    }
}

