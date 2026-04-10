//
//  ContentView.swift
//  RAG-Chatbot
//
//  Created by Chinthaka Perera on 4/7/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isChatbotPresented = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            Button {
                isChatbotPresented = true
            } label: {
                Image(systemName: "message.circle.fill")
                    .font(.system(size: 56))
                    .foregroundStyle(.white, .blue)
                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
            }
            .padding(24)
            .fullScreenCover(isPresented: $isChatbotPresented) {
                NavigationStack {
                    ChatbotWebView(url: URL(string: "http://127.0.0.1:7860")!)
                        .ignoresSafeArea(edges: .bottom)
                        .navigationTitle("Chatbot")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button("Close") {
                                    isChatbotPresented = false
                                }
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
