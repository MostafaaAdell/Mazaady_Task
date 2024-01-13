//
//  CategoryFilteringViewController.swift
//  Mazaady Task
//
//  Created by Mustafa on 12/01/2024.
//

import UIKit
import SwiftyMenu

class CategoryFilteringViewController: UIViewController{
    
    
    //MARK: - main Category Drop Menu
    var mainCategoryDropMenu = SwiftyMenu(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
    
    //MARK: - SubCategory DropMenu
    var subCategoryDropMenu = SwiftyMenu(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
    
    //MARK: - Other Drop Button Item
    var otherCategoryDropMenu = SwiftyMenu(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
    //MARK: - Other Drop Button Item
    var brandCategoryDropMenu = SwiftyMenu(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
    //MARK: - Other Drop Button Item
    var modelCategoryDropMenu = SwiftyMenu(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
    //MARK: - Other Drop Button Item
  //  var typeCategoryDropMenu = SwiftyMenu(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
    //MARK: - Other Drop Button Item
    var transmissionCategoryDropMenu = SwiftyMenu(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
    
    
    //MARK: - Category ViewModel
    private let categoryFilterViewModel = CategoryFilterViewModel()
    
    //MARK: - Handeing Selection
    private var selectedIndexForSubCategory = 0
    private var firstView = true
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setDelegationOfCategoryDropMenu()
        BindViewModel()
        categoryFilterViewModel.getAllCategory()
        
        
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}




//MARK: - Set delegation for Swifty drop Menu

extension CategoryFilteringViewController: SwiftyMenuDelegate {
    
    //set Delegation of Drop Menu
    func setDelegationOfCategoryDropMenu(){
        
        //MARK: - Seeting The outline of container
        let categoryLabelView = BorderLabelView(labelName: "Category")
        categoryLabelView.setupBorderViewToMainView(mainView: view, topview: view, topMargin: 90, leftView: view, LeftMargin: 20)
        let subcategoryLabelView = BorderLabelView(labelName: "SubCategory")
        subcategoryLabelView.setupBorderViewToMainView(mainView: view, topview: categoryLabelView, topMargin:90, leftView: view, LeftMargin: 20)
        
        let otherCategoryLabelView = BorderLabelView(labelName: "Process Type")
        otherCategoryLabelView.setupBorderViewToMainView(mainView: view, topview: subcategoryLabelView, topMargin:90, leftView: view, LeftMargin: 20)
        
        let anotherSpecfiyInput = BorderLabelView(labelName: "")
        anotherSpecfiyInput.setupBorderViewToMainView(mainView: view, topview: otherCategoryLabelView, topMargin:90, leftView: view, LeftMargin: 20)
        //
        let brandType = BorderLabelView(labelName: "Brand")
        brandType.setupBorderViewToMainView(mainView: view, topview: anotherSpecfiyInput, topMargin:90, leftView: view, LeftMargin: 20)
        
        let modelOfBrandType = BorderLabelView(labelName: "Model")
        modelOfBrandType.setupBorderViewToMainView(mainView: view, topview: brandType, topMargin:90, leftView: view, LeftMargin: 20)
        
       // let TypeOfModel = BorderLabelView(labelName: "Type")
       // TypeOfModel.setupBorderViewToMainView(mainView: view, topview: modelOfBrandType, topMargin:90, leftView: view, LeftMargin: 20)
        
        let selectTransmissionType = BorderLabelView(labelName: "Transmission Type")
        selectTransmissionType.setupBorderViewToMainView(mainView: view, topview: modelOfBrandType, topMargin:90, leftView: view, LeftMargin: 20)
        
        
        
        
        
        //MARK: - Update the Label Boarder with textField
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.placeholder = "Specfiy Here"
        
        anotherSpecfiyInput.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: anotherSpecfiyInput.leftAnchor, constant: 25).isActive = true
        textField.centerYAnchor.constraint(equalTo: anotherSpecfiyInput.centerYAnchor).isActive = true
        
        
        
        //MARK: - Adding Container to the view
        view.addSubview(transmissionCategoryDropMenu)
     //   view.addSubview(typeCategoryDropMenu)
        view.addSubview(modelCategoryDropMenu)
        view.addSubview(brandCategoryDropMenu)
        view.addSubview(otherCategoryDropMenu)
        view.addSubview(subCategoryDropMenu)
        view.addSubview(mainCategoryDropMenu)
        
        
        
        mainCategoryDropMenu.setConstraint(to: self.view,topMargin: 99)
        mainCategoryDropMenu.delegate = self
        mainCategoryDropMenu.configure(with: mainCategoryDropMenu.storyboardMenuAttributes)
        
        
        subCategoryDropMenu.setConstraint(to: self.view, topMargin: 190)
        subCategoryDropMenu.delegate = self
        subCategoryDropMenu.configure(with: subCategoryDropMenu.storyboardMenuAttributes)
        
        
        otherCategoryDropMenu.setConstraint(to: self.view, topMargin: 280)
        otherCategoryDropMenu.delegate = self
        otherCategoryDropMenu.configure(with: otherCategoryDropMenu.storyboardMenuAttributes)
        
        
        brandCategoryDropMenu.setConstraint(to: self.view, topMargin: 460)
        brandCategoryDropMenu.delegate = self
        brandCategoryDropMenu.configure(with: brandCategoryDropMenu.storyboardMenuAttributes)
        
        
        modelCategoryDropMenu.setConstraint(to: self.view, topMargin: 550)
        modelCategoryDropMenu.delegate = self
        modelCategoryDropMenu.configure(with: modelCategoryDropMenu.storyboardMenuAttributes)
        
        
        
//        typeCategoryDropMenu.setConstraint(to: self.view, topMargin: 640)
//        typeCategoryDropMenu.delegate = self
//        typeCategoryDropMenu.configure(with: typeCategoryDropMenu.storyboardMenuAttributes)
//
        
        transmissionCategoryDropMenu.setConstraint(to: self.view, topMargin: 640)
        transmissionCategoryDropMenu.delegate = self
        transmissionCategoryDropMenu.configure(with: transmissionCategoryDropMenu.storyboardMenuAttributes)
        
        
        
        
        
        
        
        
        
    }
    
    //MARK: - Get selected option from SwiftyMenu
    func swiftyMenu(_ swiftyMenu: SwiftyMenu, didSelectItem item: SwiftyMenuDisplayable, atIndex index: Int) {
        
        switch swiftyMenu{
            
        case mainCategoryDropMenu :
            print("Selected item: \(item), at index: \(index)")
            categoryFilterViewModel.getAllCategory()
            selectedIndexForSubCategory = index
            categoryFilterViewModel.getSubCategoryDetails(mainCategoryIndex: selectedIndexForSubCategory,subCategoryIndex:0)

            firstView = false
            break
          
        case subCategoryDropMenu:
            categoryFilterViewModel.getSubCategoryDetails(mainCategoryIndex: selectedIndexForSubCategory,subCategoryIndex:index)
        case brandCategoryDropMenu:
            categoryFilterViewModel.getModelOfBrand(modelIndex: index)
        default:
            print("Done")
        }
        
        
        if swiftyMenu == mainCategoryDropMenu {
          
        }
        
        
    }
    
    // SwiftyMenu drop down menu will expand
    func swiftyMenu(willExpand swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu willExpand.")
    }
    
    // SwiftyMenu drop down menu did expand
    func swiftyMenu(didExpand swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu didExpand.")
    }
    
    // SwiftyMenu drop down menu will collapse
    func swiftyMenu(willCollapse swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu willCollapse.")
    }
    
    // SwiftyMenu drop down menu did collapse
    func swiftyMenu(didCollapse swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu didCollapse.")
    }
    
    
    
    
    
    //MARK: - Bind Category From View Model
    func BindViewModel(){
        
        
        
        //MARK: - Loading Animation if Needed
        categoryFilterViewModel.loadingAnimation = { [weak self] isloading in
            DispatchQueue.main.async{
                self?.view.isUserInteractionEnabled = !isloading
                self?.isLoadingIndicatorAnimating = isloading
            }
        }
        
        
        
        
        //MARK: - Reload Data And View
        categoryFilterViewModel.reload = {[weak self] in
            
            DispatchQueue.main.async {
                //Main Category
                if let mainCategory = self?.categoryFilterViewModel.retrivedAllMainCategory() as? [SwiftyMenuDisplayable]{
                    self?.mainCategoryDropMenu.items = mainCategory
                    
                    self?.mainCategoryDropMenu.selectedIndex = self?.firstView == true ? 0:self?.selectedIndexForSubCategory
                    self?.subCategoryDropMenu.items = []
                    guard let otherValue = self?.categoryFilterViewModel.retrivedDataOfProcessType() as? [SwiftyMenuDisplayable] else {return}
                    self?.otherCategoryDropMenu.items = otherValue
                    
                }
                
                //Sub Category
                if let subCategory = self?.categoryFilterViewModel.retrivedSubCategory(for: self?.selectedIndexForSubCategory ?? 0) as? [SwiftyMenuDisplayable] {
                    self?.subCategoryDropMenu.items = subCategory
                    self?.subCategoryDropMenu.selectedIndex = 0
                }
                
                //Brand of Sub & Main Category
                if let brandOfCategory = self?.categoryFilterViewModel.retrivedBrandOfCategory() as?  [SwiftyMenuDisplayable] {
                    self?.brandCategoryDropMenu.items = brandOfCategory
                    
                }
                if let modelOfBrand = self?.categoryFilterViewModel.retrivedModelOfBrands() as? [SwiftyMenuDisplayable]{
                    self?.modelCategoryDropMenu.items = modelOfBrand
                }
                
                //Transmission Of Brand
                if let transmissionTypeOfBrand = self?.categoryFilterViewModel.retrivedTransmissionType() as? [SwiftyMenuDisplayable]{
                    self?.transmissionCategoryDropMenu.items = transmissionTypeOfBrand
                }
            }
            
        }
        
        
        
        
        
        //MARK: - Handeling Error is Exist
        categoryFilterViewModel.errorOccurs = {[weak self] error in
            guard let self = self else {return}
            self.isLoadingIndicatorAnimating = false
            
        }
        
    }
    
    
}


