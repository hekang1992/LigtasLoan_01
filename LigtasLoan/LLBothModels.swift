//
//  LLBothModels.swift
//  LigtasLoan
//
//  Created by 何康 on 2024/11/22.
//

import SwiftyJSON

class CommonModel {
    var whey: String
    var andmammy: Int
    var preferreda: preferredaModel
    init(json: JSON) {
        let andmammyValue = json["andmammy"].intValue
        let wheyValue = json["whey"].stringValue
        let preferredaValue = json["preferreda"]
        self.andmammy = andmammyValue
        self.whey = wheyValue
        self.preferreda = preferredaModel(json: preferredaValue)
    }
}

class preferredaModel {
    var faultif: String?
    var ofhurt: String?
    var screamed: String?
    var greaterone: nothaveModel?
    var nothave: nothaveModel?
    var foryou: String?
    var hisgold: hisgoldModel?
    var toremember: torememberModel?
    var unending: [widehallModel]?
    var squatty: String?
    var aquizzical: String?
    var deepseats: String?
    var consciousness: Int?
    var widehall: [widehallModel]?
    var andfalling: andfallingModel?
    var consternation: hisgoldModel?
    var herplacid: herplacidModel?
    var toldyou: toldyouModel?
    var exchange: String?
    init(json: JSON) {
        self.exchange = json["exchange"].string
        self.faultif = json["faultif"].string
        self.consciousness = json["consciousness"].intValue
        self.squatty = json["squatty"].string
        self.aquizzical = json["aquizzical"].string
        self.deepseats = json["deepseats"].string
        self.ofhurt = json["ofhurt"].string
        self.screamed = json["screamed"].string
        self.foryou = json["foryou"].string
        self.nothave = nothaveModel(json: json["nothave"])
        self.greaterone = nothaveModel(json: json["greaterone"])
        self.hisgold = hisgoldModel(json: json["hisgold"])
        self.toremember = torememberModel(json: json["toremember"])
        self.consternation = hisgoldModel(json: json["consternation"])
        self.andfalling = andfallingModel(json: json["andfalling"])
        self.herplacid = herplacidModel(json: json["herplacid"])
        
        self.unending = json["unending"].arrayValue.map { widehallModel(json: $0) }
        self.widehall = json["widehall"].arrayValue.map { widehallModel(json: $0) }
        self.toldyou = toldyouModel(json: json["toldyou"])
    }
}

class toldyouModel {
    var elemental: String?
    var aviolence: [aviolenceModel]?
    init(json: JSON) {
        self.elemental = json["elemental"].string
        self.aviolence = json["aviolence"].arrayValue.map {
            aviolenceModel(json: $0)
        }
    }
}

class herplacidModel {
    var aviolence: [aviolenceModel]
    init(json: JSON) {
        self.aviolence = json["aviolence"].arrayValue.map {
            aviolenceModel(json: $0)
        }
    }
}

class andfallingModel {
    var unending: [widehallModel]
    init(json: JSON) {
        self.unending = json["unending"].arrayValue.map {
            widehallModel(json: $0)
        }
    }
}

class torememberModel {
    var dully: Int?
    var foryou: String?
    var hearth: String?
    init(json: JSON) {
        self.hearth = json["hearth"].stringValue
        self.dully = json["dully"].intValue
        self.foryou = json["foryou"].stringValue
    }
}

class hisgoldModel {
    var gabbling: String?
    var trembling: String?
    init(json: JSON) {
        self.gabbling = json["gabbling"].stringValue
        self.trembling = json["trembling"].stringValue
    }
}

class nothaveModel {
    var elemental: String?
    var aviolence: [aviolenceModel]?
    init(json: JSON) {
        self.elemental = json["elemental"].stringValue
        self.aviolence = json["aviolence"].arrayValue.map {
            aviolenceModel(json: $0)
        }
    }
}

class aviolenceModel {
    var cad: String?
    var foryou: String?
    var caring: String?
    var blot: String?
    var thenyou: String?
    var itseemed: String?
    var toanyone: String?
    var makeyou: String?
    var distinctionnnn: String?
    var crumbs: String?
    var outunder: String?
    var elemental: String?
    var exchange: String?
    var whey: String?
    var unawareof: String?
    init(json: JSON) {
        self.unawareof = json["unawareof"].stringValue
        self.whey = json["whey"].stringValue
        self.exchange = json["exchange"].stringValue
        self.crumbs = json["crumbs"].stringValue
        self.outunder = json["outunder"].stringValue
        self.elemental = json["elemental"].stringValue
        self.distinctionnnn = json["distinctionnnn"].stringValue
        self.cad = json["cad"].stringValue
        self.foryou = json["foryou"].stringValue
        self.caring = json["caring"].stringValue
        self.blot = json["blot"].stringValue
        self.thenyou = json["thenyou"].stringValue
        self.itseemed = json["itseemed"].stringValue
        self.makeyou = json["makeyou"].stringValue
        self.toanyone = json["toanyone"].stringValue
    }
}

class widehallModel {
    var hatred: String?
    var throwingher: String?
    var andmammy: String?
    var underthe: String?
    var risked: String?
    var butshe: String?
    var elemental: String?
    var theirbeauty: [theirbeautyModel]?
    var pic_url: String?
    var cad: String?
    var unending: [widehallModel]?
    var prettiest: String?
    var haddreamed: String?
    var wasempty: String?//key
    var aquizzical: String?//name
    var waslooking: String?//phone
    var losing: [theirbeautyModel]
    var relationText: String?
    var widehall: [widehallModel]?
    var abow: String?
    var blot: String?
    var rejoining: rejoiningModel?
    var herseat: String?
    var tiredly: String?
    var belonging: String?
    var hearth: Int?
    var aviolence: [aviolenceModel]?
    init(json: JSON) {
        self.aviolence = json["aviolence"].arrayValue.map {
            aviolenceModel(json: $0)
        }
        self.hearth = json["hearth"].intValue
        self.belonging = json["belonging"].stringValue
        self.tiredly = json["tiredly"].stringValue
        self.herseat = json["herseat"].stringValue
        self.blot = json["blot"].stringValue
        self.abow = json["abow"].stringValue
        self.relationText = json["relationText"].stringValue
        self.hatred = json["hatred"].stringValue
        self.throwingher = json["throwingher"].stringValue
        self.andmammy = json["andmammy"].stringValue
        self.underthe = json["underthe"].stringValue
        self.risked = json["risked"].stringValue
        self.butshe = json["butshe"].stringValue
        self.elemental = json["elemental"].stringValue
        self.theirbeauty = json["theirbeauty"].arrayValue.map {
            theirbeautyModel(json: $0)
        }
        self.aquizzical = json["aquizzical"].stringValue
        self.pic_url = json["pic_url"].stringValue
        self.cad = json["cad"].stringValue
        self.unending = json["unending"].arrayValue.map {
            widehallModel(json: $0)
        }
        self.widehall = json["widehall"].arrayValue.map {
            widehallModel(json: $0)
        }
        self.prettiest = json["prettiest"].stringValue
        self.haddreamed = json["haddreamed"].stringValue
        self.wasempty = json["wasempty"].stringValue
        self.waslooking = json["waslooking"].stringValue
        self.losing = json["losing"].arrayValue.map {
            theirbeautyModel(json: $0)
        }
        self.rejoining = rejoiningModel(json: json["rejoining"])
    }
}

class rejoiningModel {
    var shareday: String?
    var followday: String?
    var distinctionday: String?
    var makeyou: String?
    var gazed: String?
    init(json: JSON) {
        self.makeyou = json["makeyou"].stringValue
        self.gazed = json["gazed"].stringValue
        self.distinctionday = json["distinctionday"].stringValue
        self.followday = json["followday"].stringValue
        self.shareday = json["shareday"].stringValue
    }
}

class theirbeautyModel {
    var aquizzical: String?
    var elemental: String?
    var triumphedasherealize: String?
    var theirbeauty: [theirbeautyModel]?
    init(json: JSON) {
        self.aquizzical = json["aquizzical"].stringValue
        self.elemental = json["elemental"].stringValue
        self.triumphedasherealize = json["triumphedasherealize"].stringValue
        self.theirbeauty = json["theirbeauty"].arrayValue.map {
            theirbeautyModel(json: $0)
        }
    }
}
