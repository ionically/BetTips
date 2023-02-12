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
                                .frame(width: 5)
                                .frame(height: 150)
                                .background(Color("dashboard-row-tip-thin-highlight"))
                                
                                VStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(Color("dashboard-row-tip-thin-highlight"))
                                        .font(.system(size:40))
                                    
                                }
                             
                                VStack() {
                                    Spacer()
                                Text("Gambling State")
                                    Spacer()
                                Text("Texas")
                                    Spacer()
                                Text("Syracuse and Tech I'm betting but not as much")
                                    Spacer()
                                Text("@everyone")
                                    Spacer()
                                }
                                .frame(minWidth: 0,
                                       maxWidth: .infinity)
                                .background(Color("dashboard-tip-background"))
                                Spacer()
                            }
                            .border(Color.black)
                            .frame(minWidth: 0,
                                   maxWidth: .infinity)
                            .background(Color("dashboard-tip-background"))
                        }
                        Spacer()
                            .frame(height:4)
                    }
                }
                
            }
        }
        .frame(minWidth: 0,
               maxWidth: .infinity)
        .background(Color.black)
        
    }
    
}


