
import SwiftUI
import Kingfisher

struct SettingsHeaderView: View {
   // private let user: User
    
   /* init(user: User) {
        self.user = user
    }*/
    
    var body: some View {
        HStack {
            //KFImage(URL(string: user.profileImageUrl))
            Image("foto")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                //Text(user.email)
                Text("ece ayvaz")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
