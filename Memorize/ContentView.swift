import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 64))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding()
    }
    //    var remove: some View {
    //        Button {
    //            if emojiCount > 1 {
    //                emojiCount -= 1
    //            }
    //        } label:{
    //            Image(systemName: "minus.circle")
    //        }
    //    }
    //    var add: some View {
    //        Button {
    //            if emojiCount < emojis.count {
    //                emojiCount += 1
    //            }
    //        } label: {
    //            Image(systemName: "plus.circle")
    //        }
    //    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3.0)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
