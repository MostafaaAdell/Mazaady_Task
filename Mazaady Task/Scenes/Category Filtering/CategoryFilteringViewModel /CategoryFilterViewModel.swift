//
//  CategoryFilterViewModel.swift
//  Mazaady Task
//
//  Created by Mustafa on 12/01/2024.
//

import Foundation


class CategoryFilterViewModel {
    
    
     let apiNetworkManager = NetworkManager.sharedNetworkManager
    
    
     var mainCategory: MainCategory?
    
     let processType:[String] = ["Other"]
    
     var subCategory:SubCategory?
    
     var modelTypeBrand:SubCategory?
    
    
    
    //MARK: - Computed Property
    var mainCatogoeryList:Int{mainCategory?.data.categories.count ?? 0}
    
    
    //MARK: - Closure
    var loadingAnimation:((Bool)->Void)?
    var reload:(()->Void)?
    var errorOccurs:((String)->Void)?
    
    
    // MARK: - Retrived All Category
    func retrivedAllMainCategory()->[Category]?{
        return mainCategory?.data.categories
    }
    
    //MARK: - Retrived data of Process Type
    func retrivedDataOfProcessType()->[String]{
        return processType
    }
    
    //MARK: - Retrived Sub Category
    func retrivedSubCategory(for index:Int)->[Category]?{
        return mainCategory?.data.categories[index].children
    }
    //MARK: - Retrived Brand Of Category
    func retrivedBrandOfCategory()->[Option]?{
        return subCategory?.data[1].options
    }
    //MARK: - Retrived Model Of Brands
    func retrivedModelOfBrands()->[Option]?{
        return modelTypeBrand?.data.first?.options
    }
    //MARK: - Retrived transmission Type
    func retrivedTransmissionType()->[Option]?{
        return subCategory?.data[2].options
    }
    
    
    //MARK: - Get All Category
    
    func getAllCategory(){
        
        //loadingAnimation?(true)
        apiNetworkManager.fetchData(url: BaseURL.getAllCategory, decodingModel: MainCategory.self) { result in
            
            switch result {
            case .success(let retrivedData):
                self.mainCategory = retrivedData
                if self.subCategory == nil{
                    self.getSubCategoryDetails(mainCategoryIndex: 0,subCategoryIndex:0)

                }
                self.reload?()
            case .failure(let error):
                self.errorOccurs?(String(describing: error.localizedDescription))
                
            }
        }
        
    }
    
    
    //MARK: - Get SubGategory Details
    
    func getSubCategoryDetails(mainCategoryIndex:Int , subCategoryIndex:Int){
        guard let id = mainCategory?.data.categories[mainCategoryIndex].children?[subCategoryIndex].id else {return}
        BaseURL.subCategoryId = id
        apiNetworkManager.fetchData(url: BaseURL.subCategory, decodingModel: SubCategory.self) { result in
            
            switch result{
            case .success(let subCategoryData):
               // print(subCategoryData)
                self.subCategory = subCategoryData
                if self.modelTypeBrand == nil {
                    self.getModelOfBrand(modelIndex:0)
                }
                self .reload?()
            case .failure(let error):
                self.errorOccurs?(String(describing: error.localizedDescription))
                
            }
        }
    }
    
    
    //MARK: - Get the Model Of The Brand
    func getModelOfBrand(modelIndex:Int){
        guard let id =   subCategory?.data[1].options[modelIndex].id else {return}
        BaseURL.optionChildId = id
        print(BaseURL.optionChild.endpoint)
        apiNetworkManager.fetchData(url: BaseURL.optionChild, decodingModel: SubCategory.self) { result in
            
            switch result{
            case .success(let modelOfBrand):
                print(modelOfBrand)
                self.modelTypeBrand = modelOfBrand
                self .reload?()
            case .failure(let error):
                print(String(describing: error.localizedDescription))
                self.errorOccurs?(String(describing: error.localizedDescription))
                
            }
        }
        
    }
    
    
}
