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
    
    func acceptCachPayment(_ cash: Decimal) {
        transactionTotal -= cash
        availableFunds += cash
    }
}

class CashRegisterTests: XCTestCase {
    
    var sut: CashRegister!
    
    var availableFunds: Decimal!
    var itemCost: Decimal!
    var payment: Decimal!
    
    // 1
    override func setUp() {
        super.setUp()
        
        availableFunds = 100
        itemCost = 42
        payment = 40
        sut = CashRegister(availableFunds: availableFunds)
    }
    
    // 2
    override func tearDown() {
        availableFunds = nil
        itemCost = nil
        payment = nil
        sut = nil
        super.tearDown()
    }
    
    func testInitAvailableFunds_setsAvailableFunds() {
        // then
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
    
    func testAddItem_oneItem_addsCostToTransactionTotal() {
        // when
        sut.addItem(itemCost)
        
        // then
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    
    func testAddItem_twoItems_addsCostToTransactionTotal() {
        //given
        let itemCost2 = Decimal(20)
        let expectedTotal = itemCost + itemCost2
        
        // when
        sut.addItem(itemCost)
        sut.addItem(itemCost2)
        
        // then
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }
    
    func testAcceptCashPayment_subtractsPaymentFromTransactionTotal() {
        // given
        let expected = itemCost - payment
        
        // when
        sut.addItem(itemCost)
        sut.acceptCachPayment(payment)
        
        // then
        XCTAssertEqual(sut.transactionTotal, expected)
    }
    
    func testAcceptCashPayment_addsPaymentToAvailableFunds() {
        // given
        let expected = sut.availableFunds + payment
        
        // when
        sut.acceptCachPayment(payment)
        
        // then
        XCTAssertEqual(sut.availableFunds, expected)
    }
}

CashRegisterTests.defaultTestSuite.run()
