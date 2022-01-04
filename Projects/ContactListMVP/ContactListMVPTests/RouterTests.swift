//
//  RouterTests.swift
//  ContactListMVPTests
//
//  Created by Виталий Шаповалов on 28.12.2021.
//

import XCTest
@testable import ContactListMVP

class MockNavigationController: UINavigationController {
    var presentationVC: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentationVC = viewController
        super.pushViewController(viewController, animated: true)
    }
}

class RouterTests: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController: MockNavigationController!
    var assemblyBuilder: AssemblyBuilderProtocol!
    
    override func setUp() {
        navigationController = MockNavigationController()
        assemblyBuilder = AssemblyBuilder()
        router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
    }

    override func tearDown() {
        router = nil
        navigationController = nil
        assemblyBuilder = nil
    }

    func testRouterShowenDetailScreen() {
        let imageData = UIImage(systemName: "person")?.pngData()
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        router.showDetail(person: person)
        
        XCTAssertTrue(navigationController.presentationVC is DetailViewController)
    }
}
