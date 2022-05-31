import UIKit

class ViewController: UIViewController {
    var collectionViewProducts = [CollectionViewModel]()
    
    @IBOutlet var loadingSpinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let transfrom = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        loadingSpinner.transform = transfrom
        fetchData()
    }
    
    private func fetchData() {
        if let url = URL(string: DishWasherConstant.productListAddr) {
            NetworkService.requestJSON(url) { [weak self] (productList: APIProductList) in
                productList.products.forEach { item in
                    let productID = item.productId
                    let imageAddr = String(("https:" + item.image).dropLast())
                    let title = item.title
                    let priceMax = item.variantPriceRange.display.max.dropFirst()
                    let priceMin = item.variantPriceRange.display.min.dropFirst()
                    let product = CollectionViewModel(productID: productID, imageAddr: imageAddr, title: title, priceMax: String(priceMax), priceMin: String(priceMin))
                    self?.collectionViewProducts.append(product)
                }
                
                DispatchQueue.main.async {
                    let collectionVC = self?.storyboard!.instantiateViewController(withIdentifier: "CollectionVC") as! DishWasherCollectionViewController
                    collectionVC.collectionViewProducts = self?.collectionViewProducts ?? []
                    let navController = UINavigationController(rootViewController: collectionVC)
                    navController.modalPresentationStyle = .fullScreen
                    self?.present(navController, animated:true, completion: nil)
                }
            }
        } else {
            fatalError("URL address error!")
        }
    }

}
