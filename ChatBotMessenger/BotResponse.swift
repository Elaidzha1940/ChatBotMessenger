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
    
    if tempMessage.contains("hi") {
        return ("Hey there!")
    } else if tempMessage.contains("sup?"){
        return "Nothing much. How are you?"
    } else if tempMessage.contains("what are you doing?") {
        return "Just chilling:)"
    } else if tempMessage.contains("wanna come out for a walk?") {
        return "Sure thing, see yaa later!"
    } else {
        return "That's awesome."
    }
}


