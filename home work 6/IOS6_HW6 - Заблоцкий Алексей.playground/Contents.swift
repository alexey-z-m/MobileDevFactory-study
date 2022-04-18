
enum CalculationType {
    case addition
    case subtraction
    case multiplication
    case division
}

func calculate (a: Int, and b: Int, operation: CalculationType) -> (Int) {
    var result = 0
    switch operation {
    case .addition:
        result = a + b
        print("Результат сложения \(a) и \(b) равен \(result)")
    case .subtraction:
        result = a - b
        print("Результат вычитания \(b) из \(a) равен \(result)")
    case .multiplication:
        result = a * b
        print("Результат умнодения \(a) и \(b) равен \(result)")
    case .division:
        result = b != 0 ? a / b : 0
        print("Результат деления \(a) на \(b) равен \(result)")
    }
    return result
}

calculate(a: 10, and: 5, operation: .addition)
calculate(a: 10, and: 5, operation: .subtraction)
calculate(a: 10, and: 5, operation: .multiplication)
calculate(a: 10, and: 5, operation: .division)

enum CurrencyUnit {
    case rouble (countries: [String], shortName: String)
    case dollar (dollarFrom: DollarCountries, countries: [String], shortName: String)
    case euro (countries: [String], shortName: String)
    
    enum DollarCountries {
        case USA
        case Canada
        case Australia
    }
}

var roubleCurrency: CurrencyUnit = .rouble(countries: ["Russia"],shortName: "RUB")
var someCurrency = CurrencyUnit.dollar(dollarFrom: .USA, countries: ["USA", "Zimbabwe", "Ecuador"], shortName: "USD")
printAboutCurrency(currency: roubleCurrency)
printAboutCurrency(currency: someCurrency)

func printAboutCurrency(currency: CurrencyUnit) {
    switch currency {
    case let .dollar(dollarFrom, countries, shortName):
        for i in 0...(countries.count - 1) {
            print("Доллар: \(dollarFrom). Страна: \(countries[i]). Короткое наименование: \(shortName)")
        }
    case .rouble(let countries, let shortName):
        for i in 0...(countries.count - 1) {
            print("Рубль. Страна: \(countries[i]). Короткое наименование: \(shortName)")
        }
    case .euro:
        print("евро")
        
    }
}


enum Destination: String {
    case saintPetersburg = "Санкт-Петербург"
    case helsinki = "Хельсинки"
    case barcelona = "Барселона"
    case london = "Лондон"
    case moscow = "Москва"
}

enum Transport {
    case car (model: String, fuelСonsumption: Double)
    case plane (ticketPrice: Double)
    case train (ticketPrice: Double)
}

enum PlaceToStay {
    case hotel (costPerDay: Double)
    case hostel (costPerDay: Double)
    case rent (costPerDay: Double)
}

enum Leisure: String {
    case excursions = "Экскурсии"
    case museums = "Музеи"
    case beach = "Отдых на пляже"
}

enum Currency {
    case dollar
    case euro
    case poundSterling
}
