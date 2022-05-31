import Foundation
import UIKit

class DishWasherCollectionViewController: UIViewController {
    
    let numOfCellRowLandscape = DishWasherConstant.numOfCellRowLandscape
    let numOfCellColumnLandscape = DishWasherConstant.numOfCellColumnLandscape
    let numOfCellRowPortrait = DishWasherConstant.numOfCellRowPortrait
    let numOfCellColumnPortrait = DishWasherConstant.numOfCellColumnPortrait
    let collectionCellMargin = DishWasherConstant.collectionCellMargin
    var collectionViewProducts = [CollectionViewModel]()
    var productDetails = [APIProductID]()
    var productQuantity: Int {
        get {
            collectionViewProducts.count
        }
    }
    
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        uiSetup()
        fetchProductDetail(collectionViewProducts)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func uiSetup() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = collectionCellMargin
            flowLayout.minimumLineSpacing = collectionCellMargin
            flowLayout.sectionInset = UIEdgeInsets(top: collectionCellMargin, left: collectionCellMargin, bottom: collectionCellMargin, right: collectionCellMargin)
        }
        collectionView.backgroundColor = .lightGray
        quantityLabel.text = "Dishwashers (" + String(productQuantity) + ")"
    }
    
    private func fetchProductDetail(_ products: [CollectionViewModel]) {
        if let product = products.first, let url = URL(string: (DishWasherConstant.productRequestAddr + product.productID)) {
            NetworkService.requestJSON(url) { [weak self] (productDetail: APIProductID) in
                self?.productDetails.append(productDetail)
                self?.fetchProductDetail(Array(products.dropFirst()))
                print("productDetails.count: \(self?.productDetails.count ?? 0)")
            }
        }
    }

}


extension DishWasherCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productQuantity
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! DishWasherCollectionViewCell
        let product: CollectionViewModel = collectionViewProducts[indexPath.row]
        cell.backgroundColor = .white
        cell.productImageView.image = UIImage(systemName: "photo")
        cell.productImageView.tintColor = .lightGray
        if let url = URL(string: product.imageAddr) {
            NetworkService.requestData(url) { data in
                DispatchQueue.main.async {
                    cell.productImageView.image = UIImage(data: data)
                }
            }
        }
        cell.productLabel.text = product.title
        if product.priceMax == product.priceMax {
            cell.productPriceRange.text = "£" + product.priceMax
        } else {
            cell.productPriceRange.text = "£" + product.priceMin + " - " + "£" + product.priceMax
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        var cellWidth: CGFloat = 0
        var cellHeight: CGFloat = 0
        var availableWidth = collectionView.bounds.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right
        var availableHeight = collectionView.bounds.height - flowLayout.sectionInset.top - flowLayout.sectionInset.bottom
        
        if UIWindow.isLandscape {
            availableWidth -= (flowLayout.minimumInteritemSpacing * CGFloat(numOfCellRowLandscape - 1))
            availableHeight -= (flowLayout.minimumInteritemSpacing * CGFloat(numOfCellColumnLandscape - 1))
            cellWidth = availableWidth / CGFloat(numOfCellRowLandscape)
            cellHeight = availableHeight / CGFloat(numOfCellColumnLandscape)
        } else {
            availableWidth -= (flowLayout.minimumInteritemSpacing * CGFloat(numOfCellRowPortrait - 1))
            availableHeight -= (flowLayout.minimumInteritemSpacing * CGFloat(numOfCellColumnPortrait - 1))
            cellWidth = availableWidth / CGFloat(numOfCellRowPortrait)
            cellHeight = availableHeight / CGFloat(numOfCellColumnPortrait)
        }
        
        return CGSize(width: Int(cellWidth), height: Int(cellHeight))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ProductID: \(collectionViewProducts[indexPath.row])")
        if let detailVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as? DishWasherDetailViewController {
            let productDetail = productDetails.filter({$0.productId == collectionViewProducts[indexPath.row].productID})
            if !productDetail.isEmpty {
                detailVC.productDetail = productDetail.first
                self.navigationController?.pushViewController(detailVC, animated: true)
            } else {
                fetchProductDetail(collectionViewProducts)
            }
        }
        collectionView.cellForItem(at: indexPath)?.isSelected = false
    }

}


extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.keyWindow?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}

extension UIApplication {
    static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
