//
//  Mazaady_UnitTest.swift
//  Mazaady TaskTests
//
//  Created by Mustafa on 14/01/2024.
//

import XCTest
@testable import Mazaady_Task

class CategoryFilterViewModelTests: XCTestCase {
    
    var viewModel: CategoryFilterViewModel!
    let option1 = Option(id: 1, name: "Brand 1", slug: "brand1", parent: 11, child: false)

    
    
        override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
        }
    
        override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }
    
        func testExample() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            // Any test you write for XCTest can be annotated as throws and async.
            // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
            // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        }
    
        func testPerformanceExample() throws {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
            }
        }
    
    override func setUp() {
        super.setUp()
        viewModel = CategoryFilterViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testRetrievedAllMainCategory_ReturnsCorrectCount() {
        // Given
        let category1 = Category(id: 1, name: "Category 1", description: nil, image: "image1", slug: "category1", children: nil, circleIcon: "icon1", disableShipping: 0)
        let category2 = Category(id: 2, name: "Category 2", description: nil, image: "image2", slug: "category2", children: nil, circleIcon: "icon2", disableShipping: 0)
        viewModel.mainCategory = MainCategory(code: 200, msg: "Success", data: DataClass(categories: [category1, category2], statistics: Statistics(auctions: 10, users: 100, products: 1000), adsBanners: [], iosVersion: "1.0", iosLatestVersion: "1.0", googleVersion: "1.0", huaweiVersion: "1.0"))
        
        // When
        let retrievedCategories = viewModel.retrivedAllMainCategory()
        
        // Then
        XCTAssertEqual(retrievedCategories?.count, 2)
    }
    
    func testRetrievedAllMainCategory_ReturnsCorrectCategoryNames() {
        // Given
        let category1 = Category(id: 1, name: "Category 1", description: nil, image: "image1", slug: "category1", children: nil, circleIcon: "icon1", disableShipping: 0)
        let category2 = Category(id: 2, name: "Category 2", description: nil, image: "image2", slug: "category2", children: nil, circleIcon: "icon2", disableShipping: 0)
        viewModel.mainCategory = MainCategory(code: 200, msg: "Success", data: DataClass(categories: [category1, category2], statistics: Statistics(auctions: 10, users: 100, products: 1000), adsBanners: [], iosVersion: "1.0", iosLatestVersion: "1.0", googleVersion: "1.0", huaweiVersion: "1.0"))
        
        // When
        let retrievedCategories = viewModel.retrivedAllMainCategory()
        
        // Then
        XCTAssertEqual(retrievedCategories?[0].name, "Category 1")
        XCTAssertEqual(retrievedCategories?[1].name, "Category 2")
    }
    
    func testRetrievedDataOfProcessType_ReturnsCorrectData() {
        // When
        let retrievedData = viewModel.retrivedDataOfProcessType()
        
        // Then
        XCTAssertEqual(retrievedData.count, 1)
        XCTAssertEqual(retrievedData[0], "Other")
    }
    
    func testRetrievedSubCategory_ReturnsCorrectCount() {
        // Given
        let category1 = Category(id: 1, name: "Category 1", description: nil, image: "image1", slug: "category1", children: [Category(id: 11, name: "Subcategory 1", description: nil, image: "subimage1", slug: "subcategory1", children: nil, circleIcon: "subicon1", disableShipping: 0)], circleIcon: "icon1", disableShipping: 0)
        let category2 = Category(id: 2, name: "Category 2", description: nil, image: "image2", slug: "category2", children: nil, circleIcon: "icon2", disableShipping: 0)
        viewModel.mainCategory = MainCategory(code: 200, msg: "Success", data: DataClass(categories: [category1, category2], statistics: Statistics(auctions: 10, users: 100, products: 1000), adsBanners: [], iosVersion: "1.0", iosLatestVersion: "1.0", googleVersion: "1.0", huaweiVersion: "1.0"))
        
        // When
        let retrievedSubCategories = viewModel.retrivedSubCategory(for: 0)
        
        // Then
        XCTAssertEqual(retrievedSubCategories?.count, 1)
    }
    
    
    func testRetrievedAllMainCategory_ReturnsCorrectCount2() {
        // Given
        let category1 = Category(id: 1, name: "Category 1", description: nil, image: "image1", slug: "category1", children: nil, circleIcon: "icon1", disableShipping: 0)
        let category2 = Category(id: 2, name: "Category 2", description: nil, image: "image2", slug: "category2", children: nil, circleIcon: "icon2", disableShipping: 0)
        viewModel.mainCategory = MainCategory(code: 200, msg: "Success", data: DataClass(categories: [category1, category2], statistics: Statistics(auctions: 10, users: 100, products: 1000), adsBanners: [], iosVersion: "1.0", iosLatestVersion: "1.0", googleVersion: "1.0", huaweiVersion: "1.0"))
        
        // When
        let retrievedCategories = viewModel.retrivedAllMainCategory()
        
        // Then
        XCTAssertEqual(retrievedCategories?.count, 2)
    }
    
    func testRetrievedDataOfProcessType_ReturnsCorrectData2() {
        // When
        let retrievedData = viewModel.retrivedDataOfProcessType()
        
        // Then
        XCTAssertEqual(retrievedData.count, 1)
        XCTAssertEqual(retrievedData[0], "Other")
    }
    
    func testRetrievedSubCategory_ReturnsCorrectCount2() {
        // Given
        let category1 = Category(id: 1, name: "Category 1", description: nil, image: "image1", slug: "category1", children: [Category(id: 11, name: "Subcategory 1", description: nil, image: "subimage1", slug: "subcategory1", children: nil, circleIcon: "subicon1", disableShipping: 0)], circleIcon: "icon1", disableShipping: 0)
        let category2 = Category(id: 2, name: "Category 2", description: nil, image: "image2", slug: "category2", children: nil, circleIcon: "icon2", disableShipping: 0)
        viewModel.mainCategory = MainCategory(code: 200, msg: "Success", data: DataClass(categories: [category1, category2], statistics: Statistics(auctions: 10, users: 100, products: 1000), adsBanners: [], iosVersion: "1.0", iosLatestVersion: "1.0", googleVersion: "1.0", huaweiVersion: "1.0"))
        
        // When
        let retrievedSubCategories = viewModel.retrivedSubCategory(for: 0)
        
        // Then
        XCTAssertEqual(retrievedSubCategories?.count, 1)
    }
    

    
    
}
    
