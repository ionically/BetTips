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
                            
                            // This is tip Row
                            HStack(alignment: .top, spacing: 0) {
                                // corner yellow thin pipe
                                VStack {
                                    Text("")
                                }
                                .frame(width: 5)
                                .frame(height: 150)
                                .background(Color("dashboard-row-tip-thin-highlight"))
                                
                                VStack {
                                    Spacer()
                                        .frame(height: 2)
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(Color("dashboard-row-tip-thin-highlight"))
                                        .font(.system(size:40))
                                    Spacer()
                                }
                                    
                                // tip message box
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Text(tip.email ?? "") //force unwrapping
                                        .foregroundColor(Color("primary-light"))
                                    //optional unwrapping option if showing nil = normal
                                    Spacer()
                                    Text(tip.message ?? "")
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(Color("primary-light"))
                                    Spacer()
                                    VStack(alignment:.leading, spacing:0) {
                                        Text("@everyone")
                                            .foregroundColor(Color("primary-light"))
                                            .font(Font.body.weight(.bold))
                                    }
                                    .background(Color("dashboard-row-tag-everyone-textcolor"))
                                    Spacer()
                                }
                                .frame(minWidth: 0,
                                       maxWidth: .infinity)
                                .background(Color("dashboard-tip-background"))
                                Spacer()
                                
                            }
                            .background(Color("dashboard-tip-background"))
                            Spacer().frame(width: 15)
                        }
                        
                    }
                }
                        .frame(minWidth: 0,
                               maxWidth: .infinity)
                       
                        
                    }
                }
            }
        }
    
