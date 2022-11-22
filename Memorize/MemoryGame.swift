import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    private var faceUpIndex: Int?
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}){
            if let potentialMatchIndex = faceUpIndex {
                if cards[chosenIndex].content
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairsOfCards * 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
