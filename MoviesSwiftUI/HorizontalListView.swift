import SwiftUI

struct HorizontalListView: View {
    let header = Constants.trendingMovieString
    //  Используем var для titles, потому что список может изменится
    var titles = [Constants.testTitleURL, Constants.testTitleURL2, Constants.testTitleURL3]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
            
            ScrollView (.horizontal) {
                LazyHStack {
                    //  Используем саму строку в качестве идентификатора с помощью id:
                    ForEach(titles, id: \.self) { title in
                        AsyncImage(url: URL(string: title)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        //  Устанавливаем ширину и высоту постерам
                        .frame(width: 120, height: 200)
                    }
                }
            }
        }
    }
}

#Preview {
    HorizontalListView()
}
