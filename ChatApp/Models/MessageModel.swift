import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageModel: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageID: String = ""
    let database = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        database.collection("messages").addSnapshotListener { (querySnapShot, error) in
            guard let documents = querySnapShot?.documents else { return }
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding message: \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp}
            if let id = self.messages.last?.id {
                self.lastMessageID = id
            }
        }
    }
    
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            try database.collection("messages").document().setData(from: newMessage)
        } catch {
            return
        }
        
    }
}
