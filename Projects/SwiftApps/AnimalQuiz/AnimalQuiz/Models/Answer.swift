//
//  Answer.swift
//  AnimalQuiz
//
//  Created by hutzo on 13.10.2021.
//

struct Answer {
    let text: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }
}
