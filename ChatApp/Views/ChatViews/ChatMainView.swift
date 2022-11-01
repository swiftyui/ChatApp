import SwiftUI

struct ChatMainView: View {
    @StateObject var messagesModel: MessageModel = MessageModel()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesModel.messages, id: \.id) { message in
                            MessageBubbleView(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: messagesModel.lastMessageID ) { newID in
                        withAnimation {
                            proxy.scrollTo(newID, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color(hue: 0.507, saturation: 1.0, brightness: 0.601))
            
            MessageField().environmentObject(messagesModel)
        }
    }
}

