import SwiftUI

struct TitleRow: View {
    var imageURL = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa4xjShh4ynJbrgYrW_aB4lhKSxeMzQ3cO_A&usqp=CAU")
    var name = "James Dean"
    
    var body: some View {
        HStack(spacing: 20) {
//            AsyncImage(url: imageURL) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 50, height: 50)
//                    .cornerRadius(50)
//
//            } placeholder: {
//                ProgressView()
//            }
            LottieView(lottieFile: "person", loopMode: .loop)
                .frame(width: 90, height: 90)
                .cornerRadius(50)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption).foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}
