//
//  dialogBank.swift
//  App#1
//
//  Created by Kushagra Gupta on 11/10/18.
//  Copyright © 2018 Kushagra Gupta. All rights reserved.
//

import Foundation

class dialogBank {
    var list = [Dialog]()
    init()
    {
        list.append(Dialog(text: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat and soulless eyes opens the passenger door for you and says: \"Need a ride, boy?\"", opt1: "I'll hop in. Thanks for the help!", opt2: "Well, I don't have many options. Better ask him if he's a murderer.", op1: 2, op2: 1))
        list.append(Dialog(text: "He nods slowly, unphased by the question.", opt1: "At least he's honest. I'll climb in.", opt2: "Wait, I know how to change a tire.", op1: 2, op2: 3))
        list.append(Dialog(text: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and cassette tape of Elton John. He reaches for the glove box.", opt1: "I love Elton John! Hand him the cassette tape.", opt2: "It’s him or me. Take the knife and stab him.", op1: 5, op2: 4))
        list.append(Dialog(text: "What? Such a cop out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?", opt1: "", opt2: "", op1: 0, op2: 0))
        list.append(Dialog(text: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.", opt1: "", opt2: "", op1: 0, op2: 0))
        list.append(Dialog(text: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"", opt1: "", opt2: "", op1: 0, op2: 0))
        
    }
}
