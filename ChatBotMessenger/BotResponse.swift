//  /*
//
//  Project: ChatBotMessenger
//  File: BotResponse.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.04.2024
//
//  */

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return ("Hey there!")
    } else if tempMessage.contains("goodbye"){
        return "Talk to you later!"
    } else if tempMessage.contains("how are you") {
        return "I'm great, how about you?"
    } else {
        return "That's awesome."
    }
}
