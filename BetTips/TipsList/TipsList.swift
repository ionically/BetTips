import SwiftUI
// SOLID principals
// S - Single Responsibility
struct TipsList: View {
    var list: [FeedItem]
    
    var body: some View {
        // VStack List of Items
        VStack {
            ScrollView {
                VStack {
                    ForEach(0..<list.count, id: \.self) { index in
                        let tip = list[index]
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
                                
                                VStack {
                                    Spacer()
                                    Text(tip.email ?? "") //force unwrapping
                                    //optional unwrapping option if showing nil = normal
                                    Spacer()
                                    Text(tip.message ?? "")
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
                                }
                                
                            }
                        }
                        .frame(minWidth: 0,
                               maxWidth: .infinity)
                        .background(Color("dashboard-tip-background"))
                        
                    }
                }
            }
        }
    
