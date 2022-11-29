import XCTest

class CashRegister {

    var availableFunds: Decimal
    var transactionTotal: Decimal = 0

    init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }

    func addItem(_ cost: Decimal) {
        transactionTotal += cost
    }

    func acceptCashPayment(_ cash: Decimal) {
        transactionTotal -= cash
        availableFunds += cash
    }
}

class CashRegisterTests: XCTestCase {

    var availableFunds: Decimal!
    var sut: CashRegister!
    var itemCost: Decimal!
    var payment: Decimal!

    override func setUp() {

        super.setUp()
        availableFunds = 100
        itemCost = 42
        payment = 50.00
        sut = CashRegister(availableFunds: availableFunds)
    }

    override func tearDown() {

        availableFunds = nil
        sut = nil
        itemCost = nil
        super.tearDown()
    }

    func testInitAvailableFunds_setsAvailableFunds() {

        XCTAssertEqual(sut.availableFunds, availableFunds)
    }

    func testAddItem_oneItem_addsCostToTransactionTotal() {

        sut.addItem(itemCost)

        XCTAssertEqual(sut.transactionTotal, itemCost)
    }

    func testAddItem_twoItems_addsCostsToTransactionTotal() {

        let itemCost2 = Decimal(20)
        let expectedTotal = itemCost + itemCost2

        sut.addItem(itemCost)
        sut.addItem(itemCost2)

        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }

    func testAcceptCashPayment_subtractsPaymentFromTransactionTotal() {

        doTransaction()
        let expected = sut.transactionTotal - payment

        sut.acceptCashPayment(payment)

        XCTAssertEqual(sut.transactionTotal, expected)
    }

    func testAcceptCashPayment_addsPaymentToAvailableFunds() {

        doTransaction()
        let expected = sut.availableFunds + payment

        sut.acceptCashPayment(payment)
        
        XCTAssertEqual(sut.availableFunds, expected)
    }

    func doTransaction() {
        sut.addItem(20)
        sut.addItem(30)
    }
}

CashRegisterTests.defaultTestSuite.run()
