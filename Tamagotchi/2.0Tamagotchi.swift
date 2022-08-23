import Foundation

protocol Tamagotchi: AnyObject {
    var foodReserve: Int { get set }
    var waterReserve: Int { get set }
 
    func eat()
    func drink()
    func sleep()
}

struct Reserve {
    private let maxValue: Int
    private var _value: Int = 0
    var value: Int {
        set { 
            if newValue < 0 { underZeroHandler() }
            _value =  newValue > maxValue ? maxValue : newValue 
        } 
        get { return _value }
    }

    var underZeroHandler: () -> Void = {}

    init(maxValue: Int) {
        self.maxValue = maxValue
    }
}

final class SimpleTamagotchi: Tamagotchi {
    var _foodReserve: Reserve = Reserve(maxValue: 5)
    var _waterReserve: Reserve = Reserve(maxValue: 5)
    var _sleepReserve: Reserve = Reserve(maxValue: 5)
    var foodReserve: Int {
        get { return _foodReserve.value }
        set { _foodReserve.value = newValue }
    }
    var waterReserve: Int {
        get { return _waterReserve.value }
        set { _waterReserve.value = newValue }
    }
    var sleepReserve: Int {
        get { return _sleepReserve.value }
        set { _sleepReserve.value = newValue }
    }

    private var zeroFoodHandler = {
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

    init() {
        _foodReserve.underZeroHandler = zeroFoodHandler
    }
}

final class WorkingTamagotchi{
    var _foodReserve: Reserve = Reserve(maxValue: 5)
    var _waterReserve: Reserve = Reserve(maxValue: 5)
    var _sleepReserve: Reserve = Reserve(maxValue: 5)
    var foodReserve: Int {
        get { return _foodReserve.value }
        set { _foodReserve.value = newValue }
    }
    var waterReserve: Int {
        get { return _waterReserve.value }
        set { _waterReserve.value = newValue }
    }
    var sleepReserve: Int {
        get { return _sleepReserve.value }
        set { _sleepReserve.value = newValue }
    }

    private var zeroFoodHandler = {
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

    init() {
        _foodReserve.underZeroHandler = zeroFoodHandler
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