import UIKit

// THE EXEMPLE FROM appypie.com/delegation-swift-how-to

protocol BakeryDelegate {
    func cookieWasBaked(_ cookie: Cookie)
}

struct Cookie {
    var size: Int = 5
    var hasChocolateChips: Bool = false
}

class Bakery {
    
    var delegate: BakeryDelegate?
    
    func makeCookie() {
        var cookie = Cookie()
        cookie.size = 6
        cookie.hasChocolateChips = true
        
        delegate?.cookieWasBaked(cookie)
    }
}

class CookieShop: BakeryDelegate {
    func cookieWasBaked(_ cookie: Cookie) {
        print("Yay! A new cookie was baked, with size \(cookie.size)")
    }
}


let shop = CookieShop()

let bakery = Bakery()
bakery.delegate = shop

bakery.makeCookie()
