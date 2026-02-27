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
                        .frame(width: 100, height: 50)
                        .foregroundStyle(.buttonText)
                        .bold()
                        .background {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(.buttonBorder, lineWidth: 5)
                        }
                }
                //  Добавляем вторую кнопку
                Button {
                    
                } label: {
                    Text(Constants.downloadString)
                }

            }
        }
    }
}

#Preview {
    HomeView()
}
