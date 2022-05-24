@testable import Reptes
import UIKit
import XCTest

final class ReptesTests: XCTestCase {
    private var testChallenge: Challenge!
    private var testData: Data!
    
    override func setUp() async throws {
        let trashImage: UIImage?
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        if let data = UIImage(systemName: "trash.circle", withConfiguration: largeConfig)?.pngData() {
            trashImage = UIImage(data: data)
        } else {
            trashImage = nil
        }
        
        testChallenge = Challenge(
            id: UUID(),
            card: .init(id: UUID()),
            title: .init(values: [:]),
            pages: [
                .init(
                    id: UUID(),
                    title: "",
                    blocks: [
                        BlockButton(
                            id: UUID(),
                            localizedText: .init(values: ["en": "Next"]),
                            action: .next),
                        BlockImage(
                            id: UUID(),
                            height: .huge,
                            image: trashImage),
                        BlockMap(
                            id: UUID(),
                            height: .regular,
                            coordinateRegion: .northwestern),
                        BlockMarkdown(
                            id: UUID(),
                            localizedText: .init(values: ["en": "Text *test*"]),
                            backgroundTransparent: true,
                            underlined: false)
                    ])
            ])
        
        testData = """
            {
                "id": "F30F733C-6A57-4729-AC16-BF0CC204F7FC",
                "card": {
                    "id": "E06F437C-21DC-46C7-A524-1DFB02DF849A",
                    "imageStyle": "textFirst",
                    "localizedTitle": {}
                },
                "title": {},
                "pages": [
                    {
                        "id": "C2AF733C-6A57-4729-CE26-BF0CC204F5FC",
                        "title": "",
                        "blocks": [
                            {
                                "type": "button",
                                "id": "506F437C-21DC-12C7-A524-1DFB02DF849A",
                                "localizedText": {},
                                "action": "next"
                            },
                            {
                                "type": "image",
                                "id": "135ED123-FE75-40E8-A4B0-E07998585554",
                                "height": "huge",
                                "image": "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"
                            },
                            {
                                "type": "map",
                                "id": "206F437C-31DC-12C7-A524-7DFB01DF829A",
                                "height": "regular",
                                "coordinateRegion": {
                                    "latitude": 42.057160404161934,
                                    "longitude": -87.67492367721856,
                                    "latitudinalMeters": 100,
                                    "longitudinalMeters": 100
                                }
                            },
                            {
                                "type": "markdown",
                                "id": "406F437C-31DC-12C7-A524-1DFB02DF849A",
                                "localizedText": {"en": "Test *text*"}
                            }
                        ]
                    }
                ]
            }
            """.data(using: .utf8)!
    }
    
    func testEncoder() throws {
        let encoder = ReptesEncoder()
        _ = try encoder.encode(testChallenge)
    }
    
    func testDecoder() throws {
        let decoder = ReptesDecoder()
        _ = try decoder.decode(from: testData)
    }
    
    func testEncoderBasics() throws {
        let encoder = ReptesEncoder(registerBasics: false)
        try encoder.register(BlockButton.self, as: "button")
        try encoder.register(BlockImage.self, as: "image")
        try encoder.register(BlockMap.self, as: "map")
        try encoder.register(BlockMarkdown.self, as: "markdown")
        _ = try encoder.encode(testChallenge)
    }
    
    func testEncoderBasicsError() throws {
        let encoder = ReptesEncoder(registerBasics: false)
        XCTAssertThrowsError(try encoder.encode(testChallenge), "Basics were not registered") { error in
            switch error {
            case ReptesEncodingError.blockEncoderNotFound:
                break
            default:
                assertionFailure()
            }
        }
    }
    
    func testDecoderBasics() throws {
        let decoder = ReptesDecoder(registerBasics: false)
        try decoder.register(BlockButton.self, as: "button")
        try decoder.register(BlockImage.self, as: "image")
        try decoder.register(BlockMap.self, as: "map")
        try decoder.register(BlockMarkdown.self, as: "markdown")
        _ = try decoder.decode(from: testData)
    }

    func testBoth() throws {
        let encoder = ReptesEncoder()
        let data = try encoder.encode(testChallenge)
    
        let decoder = ReptesDecoder()
        let decodedChallenge = try decoder.decode(from: data)
        
        assert(testChallenge == decodedChallenge)
    }
    
    func test() throws {
        for b in testChallenge.pages[0].blocks {
            switch b {
            case let b2 as BlockButton:
                print("Button: \(b2.localizedText.text)")
            case let b2 as BlockImage:
                print("Image: \(b2.height)")
            case let b2 as BlockMap:
                print("Map: \(b2.coordinateRegion)")
            case let b2 as BlockMarkdown:
                print("Markdown: \(b2.localizedText.text)")
            default:
                assert(false)
            }
        }
    }
    
    func testOwnBlock() throws {
        struct OwnBlock: Block, Codable, Equatable {
            var id: UUID
            var text: String
        }
        
        let encoder = ReptesEncoder()
        try encoder.register(OwnBlock.self, as: "own")
        
        let challenge = Challenge(
            id: UUID(),
            card: .init(id: UUID()),
            title: .empty,
            pages: [
                .init(
                    id: UUID(),
                    title: "internal title",
                    blocks: [
                        OwnBlock(id: UUID(), text: "own test")
                    ])
            ])
        
        let data = try encoder.encode(challenge)
        
        let decoder = ReptesDecoder()
        try decoder.register(OwnBlock.self, as: "own")
        let decodedChallenge = try decoder.decode(from: data)

        assert(challenge == decodedChallenge)
    }
}
