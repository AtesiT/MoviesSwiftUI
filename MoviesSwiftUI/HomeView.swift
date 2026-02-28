import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    
    var body: some View {
        VStack {
            //  Загружаем асинхронно, в отдельном потоке, а не в основном
            AsyncImage(url: URL(string: heroTestTitle)) { image in
                //  Делаем изображение изменяемым. Подгоняем изображение под родительский вид
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                //  Пока прогружается фото, отображается "ромашка"
                ProgressView()
            }
            
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
        }
    }
}

#Preview {
    HomeView()
}
