import SwiftUI

struct ShoppingView: View {
    @AppStorage("count") var count: Double = 0.0
    
    @AppStorage("clickIncrement") var clickIncrement: Double = 1.0
    @AppStorage("autoClickRate") var autoClickRate: Double = 0.0
    @AppStorage("autoClickerInterval") var autoClickerInterval: Double = 1.0
    
    @AppStorage("clickIncrementCost") var clickIncrementCost: Double = 10.0
    @AppStorage("autoClickRateCost") var autoClickRateCost: Double = 100.0
    @AppStorage("autoClickerIntervalCost") var autoClickerIntervalCost: Double = 1000.0
    var body: some View {
        ZStack {
            Color(.init(red: 50/255, green: 200/255, blue: 255/255, alpha: 1.0))
                .ignoresSafeArea()
            
            NavigationView {
                Form {
                    Section(header: Text("Upgrades")) {
                        HStack {
                            VStack (alignment: .leading) {
                                HStack {
                                    Text("every click:")
                                    Text(String(format: "%.2f", clickIncrement))
                                        .foregroundColor(.orange)
                                        .bold()
                                }
                                HStack {
                                    Text("cost:")
                                    Text(String(format: "%.2f", clickIncrementCost))
                                        .foregroundColor(.orange)
                                        .bold()
                                }
                            }
                            Spacer()
                            Button(action: {
                                if count >= clickIncrementCost {
                                    count -= clickIncrementCost
                                    clickIncrementCost += 50
                                    clickIncrement += 1.0
                                }
                            }) {
                                Text("+")
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.regular)
                        }
                        
                        
                        HStack {
                            VStack (alignment: .leading) {
                                HStack {
                                    Text("every auto click:")
                                    Text(String(format: "%.2f", autoClickRate))
                                        .foregroundColor(.orange)
                                        .bold()
                                }
                                HStack {
                                    Text("cost:")
                                    Text(String(format: "%.2f", autoClickRateCost))
                                        .foregroundColor(.orange)
                                        .bold()
                                }
                            }
                            Spacer()
                            Button(action: {
                                if count >= autoClickRateCost {
                                    count -= autoClickRateCost
                                    autoClickRateCost += 100
                                    autoClickRate += 0.43
                                }
                            }) {
                                Text("+")
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.regular)
                        }
                        
                        HStack {
                            VStack (alignment: .leading) {
                                HStack {
                                    Text("auto click interval:")
                                    Text(String(format: "%.2f seconds", autoClickerInterval))
                                        .foregroundColor(.orange)
                                        .bold()
                                }
                                HStack {
                                    Text("cost:")
                                    Text(String(format: "%.2f", autoClickerIntervalCost))
                                        .foregroundColor(.orange)
                                        .bold()
                                }
                            }
                            Spacer()
                            Button(action: {
                                if count >= autoClickerIntervalCost {
                                    count -= autoClickerIntervalCost
                                    autoClickerIntervalCost += 1000
                                    autoClickerInterval = max(autoClickerInterval - 0.05, 0.01) // Decrease the interval, but don't let it go below a certain threshold (e.g., 0.1 seconds)
                                }
                            }) {
                                Text("+")
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.regular)
                        }
                        
                        
                    }
                    Section(header: Text("Shop")) {
                        
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Shop")
            }
        }
    }
}

struct ShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView()
    }
}

