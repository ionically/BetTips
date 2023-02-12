import SwiftUI
// SOLID principals
// S - Single Responsibility
struct TipsList: View {
    
    var body: some View {
        // VStack List of Items
        VStack {
            ScrollView {
                VStack {
                    ForEach(0..<10, id: \.self) { index in
                        // how hstack full width
                        VStack {
                            HStack {
                                VStack {
                                    Text("")
                                        .border(Color.red)
                                }
                                .frame(width: 10)
                                .background(Color.yellow)
                                VStack {
                                    Text("")
                                }
                                .frame(width: 40)
                                .border(Color.purple)
                                VStack {
                                    Text("appleafkadhfkjadshfkjadjkfhaskjdfhkjashdfasdkfjhasdfkjsd")
                                    Text("mango")
                                    Text("mango")
                                    Text("mango")
                                }
                                .background(Color.yellow)
                                Spacer()
                            }
                            .border(Color.black)
                            .frame(minWidth: 0,
                                   maxWidth: .infinity)
                        }
                        Spacer()
                            .frame(height:4)
                    }
                }
                
            }
        }
        .frame(minWidth: 0,
               maxWidth: .infinity)
        
    }
    
}


