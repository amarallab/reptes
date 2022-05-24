import XCTest
import Reptes
@testable import ReptesUI

final class ReptesUITests: XCTestCase {
    func testChallenge() {
        let challenge = Challenge.preview
        _ = ChallengeView(challenge: challenge)
    }
}
