//  /*
//
//  Project: ChatBotMessenger
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 05.04.2024
//
//  */

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var message: [String] = ["Welcome to Chat Bot 1.0"]
    
    var body: some View {
        VStack {
            HStack {
                Text("iBot")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .foregroundStyle(Color(.label))
                
                Image(systemName: "bubble.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(Color("message"))
            }
            
            ScrollView {
                // Messages
            }
            
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .onSubmit {
                        // sendMessages
                    }
                
                Button(action: {
                    // sendMessages
                }, label: {
                    Image(systemName: "paperplane.fill")
                })
                .font(.system(size: 25))
                .foregroundStyle(Color("message"))
                .padding(.horizontal, 10)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
