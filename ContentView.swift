//
//  ContentView.swift
//  teste
//
//  Created by Taissa Vitoria Rodrigues de Paula on 21/08/24.
//

import SwiftUI



struct Post: Identifiable {
    let id = UUID()
    let userName: String
}

struct ContentView: View {
    @State private var isHeartFilled = false

    let posts = [
        Post(userName: "Taissa Rodrigues"),
        Post(userName: "Outro Usuário 1"),
        Post(userName: "Outro Usuário 2" )
        
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(posts) { post in
                    VStack {
                        HStack {
                            Circle()
                                .frame(height: 30)
                            Text(post.userName)
                                .padding(.trailing, 70)
                            Image(systemName: "person.fill.badge.plus")
                        }
                        
                        VStack {
                            Rectangle()
                                .frame(width: 300, height: 300)
                                .cornerRadius(15)
                                .foregroundStyle(.gray)
                        }
                        
                        HStack {
                            Button(action: {isHeartFilled.toggle()
                            }) {
                                Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                                    .padding(.horizontal, 20)
                                    .font(.system(size: 24))
                                    .foregroundStyle(.red)

                            }
                            
//                            Image(systemName: "captions.bubble")
//                                .padding(.horizontal, 20)
//                            Image(systemName: "paperplane")
//                                .padding(.horizontal, 20)
                        }
                        .padding()
                    }
                    .padding(.bottom, 5)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
