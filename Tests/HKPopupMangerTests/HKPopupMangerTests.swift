import XCTest
import SwiftUI
@testable import HKPopManager

final class HKPopManagerTests: XCTestCase {
    
    var popupManager: PopupManager!
    
    override func setUp() {
        super.setUp()
        popupManager = PopupManager()
    }
    
    override func tearDown() {
        popupManager = nil
        super.tearDown()
    }
    
    func testInitialState() {
        // Verify that the initial state of popupManager is correct
        XCTAssertFalse(popupManager.isPresented, "PopupManager should not present any alert or popup initially.")
        XCTAssertFalse(popupManager.isAlert, "PopupManager should not be in alert state initially.")
        XCTAssertNil(popupManager.content, "Popup content should be nil initially.")
        XCTAssertNil(popupManager.alertTitle, "Alert title should be nil initially.")
        XCTAssertNil(popupManager.alertMessage, "Alert message should be nil initially.")
    }
    
    func testShowAlert() {
        // Show an alert with a title and message
        let title = "Test Alert"
        let message = "This is a test alert message."
        
        popupManager.showAlert(title: title, message: message)
        
        // Validate that the alert is shown with correct title and message
        XCTAssertTrue(popupManager.isPresented, "PopupManager should be presenting an alert.")
        XCTAssertTrue(popupManager.isAlert, "PopupManager should be in alert state.")
        XCTAssertEqual(popupManager.alertTitle, title, "Alert title should match the provided title.")
        XCTAssertEqual(popupManager.alertMessage, message, "Alert message should match the provided message.")
    }
    
    func testShowAlertWithCustomContent() {
        // Create some custom content to show inside the alert
        let customContent = Text("Custom Content")
        
        popupManager.showAlert(title: "Custom Alert", message: "Alert with custom content.", content: customContent)
        
        // Validate that custom content is shown along with the alert
        XCTAssertNotNil(popupManager.content, "PopupManager should have custom content.")
    }
    
    func testShowPopup() {
        // Show a popup with some custom content
        let customContent = Text("Test Popup Content")
        
        popupManager.showPopup(content: customContent)
        
        // Validate that the popup is shown with correct content
        XCTAssertTrue(popupManager.isPresented, "PopupManager should be presenting a popup.")
        XCTAssertFalse(popupManager.isAlert, "PopupManager should not be in alert state for popups.")
        XCTAssertNotNil(popupManager.content, "Popup content should be set.")
    }
    
    func testHidePopupOrAlert() {
        // Show a popup first
        let customContent = Text("Hide Test Popup")
        popupManager.showPopup(content: customContent)
        
        // Ensure popup is showing
        XCTAssertTrue(popupManager.isPresented, "PopupManager should be presenting a popup.")
        
        // Now hide it
        popupManager.hide()
        
        // Validate that the popup is hidden
        XCTAssertFalse(popupManager.isPresented, "PopupManager should not be presenting any popup or alert.")
        XCTAssertNil(popupManager.content, "Popup content should be nil after hiding.")
        XCTAssertNil(popupManager.alertTitle, "Alert title should be nil after hiding.")
        XCTAssertNil(popupManager.alertMessage, "Alert message should be nil after hiding.")
    }
}
