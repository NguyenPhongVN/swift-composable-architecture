import InlineSnapshotTesting
import TestCases
import XCTest

@MainActor
final class EnumTests: BaseIntegrationTests {
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.app.buttons["iOS 16"].tap()
    self.app.buttons["Enum"].tap()
    self.clearLogs()
    // SnapshotTesting.isRecording = true
  }

  func testBasics() {
    self.app.buttons["Toggle feature 1 on"].tap()
    XCTAssertEqual(self.app.staticTexts["FEATURE 1"].exists, true)
    self.assertLogs {
      """
      BasicsView.body
      EnumView.body
      PresentationStoreOf<EnumView.Feature.Destination>.scope
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<EnumView.Feature.Destination>.init
      StoreOf<EnumView.Feature.Destination>.init
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature>.scope
      StoreOf<EnumView.Feature>.scope
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.init
      ViewStore<BasicsView.Feature.State?, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State?, BasicsView.Feature.Action>.init
      ViewStore<EnumView.Feature.Destination.State, EnumView.Feature.Destination.Action>.deinit
      ViewStore<EnumView.Feature.Destination.State, EnumView.Feature.Destination.Action>.init
      ViewStore<EnumView.Feature.Destination.State?, EnumView.Feature.Destination.Action>.deinit
      ViewStore<EnumView.Feature.Destination.State?, EnumView.Feature.Destination.Action>.init
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.deinit
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.init
      ViewStoreOf<BasicsView.Feature>.init
      ViewStoreOf<BasicsView.Feature?>.init
      ViewStoreOf<EnumView.Feature.Destination>.init
      WithViewStore<EnumView.ViewState, EnumView.Feature.Action>.body
      WithViewStoreOf<BasicsView.Feature>.body
      WithViewStoreOf<BasicsView.Feature?>.body
      WithViewStoreOf<EnumView.Feature.Destination>.body
      WithViewStoreOf<EnumView.Feature.Destination?>.body
      """
    }
    self.app.buttons["Increment"].tap()
    XCTAssertEqual(self.app.staticTexts["1"].exists, true)
    self.assertLogs {
      """
      BasicsView.body
      PresentationStoreOf<EnumView.Feature.Destination>.scope
      StoreOf<BasicsView.Feature>.scope
      StoreOf<BasicsView.Feature?>.scope
      StoreOf<BasicsView.Feature?>.scope
      StoreOf<EnumView.Feature.Destination>.scope
      StoreOf<EnumView.Feature.Destination>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature>.scope
      StoreOf<EnumView.Feature>.scope
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.init
      WithViewStoreOf<BasicsView.Feature>.body
      """
    }
  }

  func testToggle1On_Toggle1Off() {
    self.app.buttons["Toggle feature 1 on"].tap()
    XCTAssertEqual(self.app.staticTexts["FEATURE 1"].exists, true)
    self.clearLogs()
    self.app.buttons["Toggle feature 1 off"].tap()
    XCTAssertEqual(self.app.staticTexts["FEATURE 1"].exists, false)
    self.assertLogs {
      """
      EnumView.body
      PresentationStoreOf<EnumView.Feature.Destination>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature>.scope
      StoreOf<EnumView.Feature>.scope
      ViewStore<EnumView.Feature.Destination.State?, EnumView.Feature.Destination.Action>.deinit
      ViewStore<EnumView.Feature.Destination.State?, EnumView.Feature.Destination.Action>.init
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.deinit
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.init
      WithViewStore<EnumView.ViewState, EnumView.Feature.Action>.body
      WithViewStoreOf<EnumView.Feature.Destination?>.body
      """
    }
  }

  func testToggle1On_Toggle2On() {
    self.app.buttons["Toggle feature 1 on"].tap()
    XCTAssertEqual(self.app.staticTexts["FEATURE 1"].exists, true)
    self.clearLogs()
    self.app.buttons["Toggle feature 2 on"].tap()
    XCTAssertEqual(self.app.staticTexts["FEATURE 2"].exists, true)
    self.assertLogs {
      """
      BasicsView.body
      EnumView.body
      PresentationStoreOf<EnumView.Feature.Destination>.scope
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature?>.deinit
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.scope
      StoreOf<BasicsView.Feature?>.scope
      StoreOf<EnumView.Feature.Destination>.scope
      StoreOf<EnumView.Feature.Destination>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature>.scope
      StoreOf<EnumView.Feature>.scope
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.init
      ViewStore<BasicsView.Feature.State?, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State?, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State?, BasicsView.Feature.Action>.init
      ViewStore<BasicsView.Feature.State?, BasicsView.Feature.Action>.init
      ViewStore<EnumView.Feature.Destination.State, EnumView.Feature.Destination.Action>.deinit
      ViewStore<EnumView.Feature.Destination.State, EnumView.Feature.Destination.Action>.init
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.deinit
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.init
      ViewStoreOf<BasicsView.Feature>.init
      ViewStoreOf<BasicsView.Feature?>.deinit
      ViewStoreOf<BasicsView.Feature?>.init
      ViewStoreOf<BasicsView.Feature?>.init
      WithViewStore<EnumView.ViewState, EnumView.Feature.Action>.body
      WithViewStoreOf<BasicsView.Feature>.body
      WithViewStoreOf<BasicsView.Feature?>.body
      WithViewStoreOf<BasicsView.Feature?>.body
      WithViewStoreOf<EnumView.Feature.Destination>.body
      """
    }
  }

  func testToggle1On_Increment_Toggle1OffOn() {
    self.app.buttons["Toggle feature 1 on"].tap()
    XCTAssertEqual(self.app.staticTexts["FEATURE 1"].exists, true)
    self.app.buttons["Decrement"].tap()
    XCTAssertEqual(self.app.staticTexts["-1"].exists, true)
    self.app.buttons["Toggle feature 1 off"].tap()
    self.clearLogs()
    self.app.buttons["Toggle feature 1 on"].tap()
    XCTAssertEqual(self.app.staticTexts["FEATURE 1"].exists, true)
    XCTAssertEqual(self.app.staticTexts["-1"].exists, false)
    XCTAssertEqual(self.app.staticTexts["0"].exists, true)
    self.assertLogs {
      """
      BasicsView.body
      EnumView.body
      PresentationStoreOf<EnumView.Feature.Destination>.scope
      StoreOf<BasicsView.Feature>.deinit
      StoreOf<BasicsView.Feature>.deinit
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.scope
      StoreOf<BasicsView.Feature?>.deinit
      StoreOf<BasicsView.Feature?>.deinit
      StoreOf<BasicsView.Feature?>.deinit
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.init
      StoreOf<BasicsView.Feature?>.scope
      StoreOf<BasicsView.Feature?>.scope
      StoreOf<BasicsView.Feature?>.scope
      StoreOf<EnumView.Feature.Destination>.deinit
      StoreOf<EnumView.Feature.Destination>.deinit
      StoreOf<EnumView.Feature.Destination>.init
      StoreOf<EnumView.Feature.Destination>.init
      StoreOf<EnumView.Feature.Destination>.scope
      StoreOf<EnumView.Feature.Destination>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature>.scope
      StoreOf<EnumView.Feature>.scope
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.init
      ViewStore<BasicsView.Feature.State?, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State?, BasicsView.Feature.Action>.init
      ViewStore<EnumView.Feature.Destination.State, EnumView.Feature.Destination.Action>.deinit
      ViewStore<EnumView.Feature.Destination.State, EnumView.Feature.Destination.Action>.init
      ViewStore<EnumView.Feature.Destination.State?, EnumView.Feature.Destination.Action>.deinit
      ViewStore<EnumView.Feature.Destination.State?, EnumView.Feature.Destination.Action>.init
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.deinit
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.init
      ViewStoreOf<BasicsView.Feature>.deinit
      ViewStoreOf<BasicsView.Feature>.init
      ViewStoreOf<BasicsView.Feature?>.deinit
      ViewStoreOf<BasicsView.Feature?>.init
      ViewStoreOf<EnumView.Feature.Destination>.deinit
      ViewStoreOf<EnumView.Feature.Destination>.init
      WithViewStore<EnumView.ViewState, EnumView.Feature.Action>.body
      WithViewStoreOf<BasicsView.Feature>.body
      WithViewStoreOf<BasicsView.Feature?>.body
      WithViewStoreOf<EnumView.Feature.Destination>.body
      WithViewStoreOf<EnumView.Feature.Destination?>.body
      """
    }
  }

  func testDismiss() {
    self.app.buttons["Toggle feature 1 on"].tap()
    XCTAssertEqual(self.app.staticTexts["FEATURE 1"].exists, true)
    self.clearLogs()
    self.app.buttons["Dismiss"].tap()
    XCTAssertEqual(self.app.staticTexts["FEATURE 1"].exists, false)
    self.assertLogs {
      """
      EnumView.body
      PresentationStoreOf<EnumView.Feature.Destination>.scope
      PresentationStoreOf<EnumView.Feature.Destination>.scope
      StoreOf<BasicsView.Feature>.scope
      StoreOf<BasicsView.Feature?>.scope
      StoreOf<BasicsView.Feature?>.scope
      StoreOf<EnumView.Feature.Destination>.scope
      StoreOf<EnumView.Feature.Destination>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature.Destination?>.scope
      StoreOf<EnumView.Feature>.scope
      StoreOf<EnumView.Feature>.scope
      StoreOf<EnumView.Feature>.scope
      StoreOf<EnumView.Feature>.scope
      ViewStore<EnumView.Feature.Destination.State?, EnumView.Feature.Destination.Action>.deinit
      ViewStore<EnumView.Feature.Destination.State?, EnumView.Feature.Destination.Action>.init
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.deinit
      ViewStore<EnumView.ViewState, EnumView.Feature.Action>.init
      WithViewStore<EnumView.ViewState, EnumView.Feature.Action>.body
      WithViewStoreOf<EnumView.Feature.Destination?>.body
      """
    }
  }
}
