# Reptes

Reptes is a library to manage `challenges`. A `challenge` is a
pill of information that contains different blocks, grouped in
pages, of different types: buttons, images, maps or markdown texts.

The library allows you to extend the blocks and implement your
own blocks.

ReptesUI is a library to show `challenges` in a SwiftUI app.

In the same way as Reptes, ReptesUI allows you to extend the
block views and implement your owns.

## Coders

Reptes provides encoder/decoder approach to read `challenges`
from a JSON file. For example:

````swift
struct BlockExample: Block, Codable, Equatable {
    var id: UUID
    var text: String
}

let data = """
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
                        "type": "example",
                        "id": "506F437C-21DC-12C7-A524-1DFB02DF849A",
                        "text": "Hello World!"
                    }
                ]
            }
        ]
    }
    """.data(using: .utf8)!

let decoder = ReptesDecoder()
try decoder.register(BlockExample.self, as: "example")
let challenge = try decoder.decode(from: data)
print(challenge)
````

## Views

To show a `challenge`, just use the `ChallengeView` view, like:

````swift
struct BlockExampleView: BlockView {
    static func canRender(block: Block) -> Bool {
        block is BlockExample
    }
    
    var block: Block
    var actions: [Action]

    var body: some View {
        if let blockExample = block as? BlockExample {
            Text("Example: \(blockExample.text)")
        }
    }
}

ChallengeView(challenge: myChallenge)
    .register(BlockExampleView.self)
````
