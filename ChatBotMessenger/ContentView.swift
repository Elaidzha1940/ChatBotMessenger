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
    @State var messages: [String] = ["Welcome to Chat Bot 1.0"]
    
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
            
            // MARK: - ScrollView
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let nemMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(nemMessage)
                                .padding()
                                .foregroundStyle(.white)
                                .background(Color("message"))
                                .cornerRadius(15)
                                .padding(.horizontal, 15)
                                .padding(.bottom, 10)
                        }
                    }
                }
            }
            
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button(action: {
                    sendMessage(message: messageText)
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
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
    }
}

#Preview {
    ContentView()
}
