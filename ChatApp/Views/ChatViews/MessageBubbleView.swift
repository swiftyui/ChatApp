import SwiftUI

struct MessageBubbleView: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color(hue: 0.001, saturation: 0.005, brightness: 0.944) : Color(hue: 0.507, saturation: 1.0, brightness: 0.601))
                    .cornerRadius(30)
                
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
                    
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing )
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

