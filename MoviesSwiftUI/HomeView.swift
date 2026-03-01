import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                //  VStack ниже прогрузится только, когда мы к нему обратимся
                LazyVStack {
                    //  Загружаем асинхронно, в отдельном потоке, а не в основном
                    AsyncImage(url: URL(string: heroTestTitle)) { image in
                        //  Делаем изображение изменяемым. Подгоняем изображение под родительский вид
                        image
                            .resizable()
                            .scaledToFit()
                            //  Создаём градиент внизу картинки
                            .overlay {
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: .clear, location: 0.8),
                                        Gradient.Stop(color: .gradient, location: 1)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            }
                    } placeholder: {
                        //  Пока прогружается фото, отображается "ромашка"
                        ProgressView()
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.85)
                    
                    HStack {
                        //  Добавляем одну кнопку
                        Button {
                            //  TODO: - Здесь функционал кнопки
                        } label: {
                            Text(Constants.playString)
                                .ghostButton()
                        }
                        //  Добавляем вторую кнопку
                        Button {
                            
                        } label: {
                            Text(Constants.downloadString)
                                .ghostButton()
                        }
                    }
                    //  Добавляем вниз кнопок - четыре  HorizontalListView, которые до этого создали мы
                    HorizontalListView(header: Constants.trendingMovieString)
                    HorizontalListView(header: Constants.trendingTVString)
                    HorizontalListView(header: Constants.topRatedMovieString)
                    HorizontalListView(header: Constants.topRatedTVString)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
