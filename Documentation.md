### Wiki

```
import SwiftUI
import BrasilAPI

struct ContentView: View {
    @State var banks: [BrasilAPIBankModel] = []
    var body: some View {
        VStack {
            List(banks, id: \.self) { bank in
                Text(bank.name ?? "")
            }
        }
        .task {
            do {
                banks = try await BrasilAPI().banking.listBanks()
            } catch {
                print(error)
            }
        }
    }
}
```
