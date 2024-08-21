//
//  UsersApiAll.swift
//  teste
//
//  Created by Taissa Vitoria Rodrigues de Paula on 21/08/24.
//

import SwiftUI

struct UserModel: Codable {
    var id: String
    var username: String

    var avatar: String?
}

struct UsersApiAll: View {
    @State private var users  = [UserModel]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                VStack(alignment: .leading ) {
                    Text(user.username).font(.headline).foregroundStyle(.blue)
                    Text(user.id).font(.headline).foregroundStyle(.secondary)
                }
            } .navigationTitle("Users").task {
                await fetchData()
            }
        }
    }
    func fetchData() async {
        guard let url = URL(string: "http://127.0.0.1:8080/users") else {
            print("A URL não está funcionando")
            return
        }
        do {
            print("Iniciando a solicitação de dados...")
            let (data, _) = try await URLSession.shared.data(from: url)
            print("Dados recebidos, tentando decodificar...")
            
            if let decodedResponse = try? JSONDecoder().decode([UserModel].self, from: data) {
                users = decodedResponse
                print("Dados decodificados com sucesso!")
            } else {
                print("Não foi possível decodificar a resposta")
            }
        } catch {
            print("Erro ao buscar dados: \(error.localizedDescription)")
        }
    }

}




#Preview {
    UsersApiAll()
}
