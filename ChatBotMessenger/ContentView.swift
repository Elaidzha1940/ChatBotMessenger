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
                    .foregroundStyle(Color(.label).gradient)
                
                Image(systemName: "bubble.left.and.text.bubble.right.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(Color("messageM").gradient)
            }
            
            // MARK: - ScrollView
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let nemMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(nemMessage)
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                                .padding()
                                .foregroundStyle(.white)
                                .background(Color("messageM").gradient)
                                .cornerRadius(20)
                                .padding(.horizontal, 15)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            Text(message)
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                                .padding()
                                .background(Color.gray.opacity(0.2).gradient)
                                .cornerRadius(20)
                                .padding(.horizontal, 15)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
                
            }.rotationEffect(.degrees(180))
                .background(.thickMaterial)
                .cornerRadius(15)
            
            // MARK: - TextField
            HStack {
                TextField("Message", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.2).gradient)
                    .cornerRadius(20)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button(action: {
                    sendMessage(message: messageText)
                }, label: {
                    Image(systemName: "paperplane.fill")
                })
                .font(.system(size: 25))
                .foregroundStyle(Color("messageM").gradient)
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
