import SwiftUI

struct DesafioTabView: View {
    
    @EnvironmentObject var desafioViewModel: DesafioViewModel
    @State private var selectedPage = 0
    @State private var previousSelectedPage = 0
    
    var body: some View {
        TabView(selection: $selectedPage) {
            //let desafios = desafioViewModel.desafios
            //desafios.append()
            ForEach(0..<desafioViewModel.desafios.count, id: \.self) { index in
                
                let desafio = desafioViewModel.desafios[index]
                DesafioCard(
                    tituloDesafio: desafio.bigIdea ?? "", //"Desafio
                    descricaoDesafio:  desafio.bigIdea ?? "", //"Descrição do desafio
                    dataDesafio: Date(),
                    tipoDesafio: "Individual"
                )
                .padding(.horizontal, 16)
                .tag(index)
            }.onAppear {
                // Carrega os objetivos do primeiro desafio ao abrir a página
                if let firstDesafio = desafioViewModel.desafios.first {
                    desafioViewModel.selectedDesafioID = firstDesafio.id.uuidString
                    desafioViewModel.loadObjetivos(for: desafioViewModel.selectedDesafioID!) { success in
                        if success {
                            print("Objetivos carregados com sucesso na inicialização.")
                        } else {
                            print("Falha ao carregar os objetivos na inicialização.")
                        }
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 200)
        .padding(.horizontal, -8)
        .padding(.top, -30)
        .onChange(of: selectedPage) {
            // Checa se a página mudou e se o usuário realmente passou a metade do card
            if selectedPage != previousSelectedPage {
                desafioViewModel.selectedDesafioID = desafioViewModel.desafios[selectedPage].id.uuidString
                desafioViewModel.loadObjetivos(for: desafioViewModel.selectedDesafioID!){ sucess in
                    previousSelectedPage = selectedPage
                }
            }
        }
        HStack {
            ForEach(0..<desafioViewModel.desafios.count, id: \.self) { index in
                Circle()
                    .fill(selectedPage == index ? Color.purple : Color.gray.opacity(0.4))
                    .frame(width: 12, height: 12)
            }
        }.frame(maxWidth: .infinity)
    }
}

