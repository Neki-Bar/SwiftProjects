import Foundation

protocol Tamagotchi: AnyObject {
    var foodReserve: Int { get set }
    var waterReserve: Int { get set }
 
    func eat()
    func drink()
    func sleep()
}

@propertyWrapper
struct Reserve {
    private let maxValue: Int
    private var value: Int = 0
    var wrappedValue: Int {
        set { 
            if newValue < 0 { underZeroHandler() }
            value =  newValue > maxValue ? maxValue : newValue 
        } 
        get { return value }
    }

    private let underZeroHandler: () -> Void

    init(maxValue: Int, underZeroHandler: @escaping () -> Void) { // про сбегание сам не додумался компилятор подсказал
        self.underZeroHandler = underZeroHandler
        self.maxValue = maxValue
    }
}

final class SimpleTamagotchi: Tamagotchi {
    //Знатно поигрался с пропертями. Инкапсулировал логику пропертей чтоб для каждой реализации Tamagotchi не
    //писать простыню из приватных и вычисляемых пропертей и их геттеров и сеттеров
    @Reserve(maxValue: 5, underZeroHandler: zeroFoodHandler ) var foodReserve: Int
    @Reserve(maxValue: 5, underZeroHandler: {} ) var waterReserve: Int
    @Reserve(maxValue: 5, underZeroHandler: {} ) var sleepReserve: Int

    private static var zeroFoodHandler = {
        print("Your tamagotchi is dead!")
    }

    
    func eat() {
        foodReserve += 1
    }

    func drink() {
        waterReserve += 1
    }

    func sleep() {
        sleepReserve += 3
    }

    func play() {
        foodReserve -= 1
        waterReserve -= 2
        sleepReserve -= 2
    }

    func printPropeprties() {
        print("Food: \(foodReserve), water: \(waterReserve), sleep: \(sleepReserve)")
    }
}

final class WorkingTamagotchi{
    @Reserve(maxValue: 5, underZeroHandler: zeroFoodHandler ) var foodReserve: Int
    @Reserve(maxValue: 5, underZeroHandler: {} ) var waterReserve: Int
    @Reserve(maxValue: 5, underZeroHandler: {} ) var sleepReserve: Int

    private static var zeroFoodHandler = {
        print("Your tamagotchi is dead!")
    }

    func eat() {
        foodReserve += 2 //этот тамагочи знатно кушает и работает
    }

    func work() {
        foodReserve -= 2
        waterReserve -= 2
        sleepReserve -= 3
    }

    func printPropeprties() {
        print("Food: \(foodReserve), water: \(waterReserve), sleep: \(sleepReserve)")
    }
}

extension WorkingTamagotchi: Tamagotchi {
    func drink() {
        waterReserve += 2
    }
    func sleep() {
        sleepReserve += 3
    }
}

func testSimpleTamagotchi() {
    print("SimpleTamagotchi test")
    let boni: SimpleTamagotchi = SimpleTamagotchi()
    boni.printPropeprties()
    boni.eat()
    boni.drink()
    boni.sleep()
    boni.printPropeprties()
    boni.play()
    boni.printPropeprties()
    boni.play() // очень интересно. Каждый раз когда проводится операция с едой тамагочи пишет что он мертв.
    boni.play()
}

func testWorkingTamagotchi() {
    print("WorkingTamagotchi test")
    let boni: WorkingTamagotchi = WorkingTamagotchi()
    boni.printPropeprties()
    boni.eat()
    boni.drink()
    boni.sleep()
    boni.printPropeprties()
    boni.work()
    boni.printPropeprties()
    boni.work() // очень интересно. Каждый раз когда проводится операция с едой тамагочи пишет что он мертв.
    boni.work()
}

testSimpleTamagotchi()
testWorkingTamagotchi()

//output
/*
SimpleTamagotchi test
Food: 0, water: 0, sleep: 0
Food: 1, water: 1, sleep: 3
Food: 0, water: -1, sleep: 1
Your tamagotchi is dead!
Your tamagotchi is dead!
WorkingTamagotchi test
Food: 0, water: 0, sleep: 0
Food: 2, water: 2, sleep: 3
Food: 0, water: 0, sleep: 0
Your tamagotchi is dead!
Your tamagotchi is dead!
*/













