import UIKit

class DishWasherDetailViewController: UIViewController {
    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var tableview: UITableView!
    @IBOutlet var priceLabelSideView: UILabel!
    @IBOutlet var specialOfferLabelSideView: UILabel!
    @IBOutlet var guaranteeLabelSideView: UILabel!
    @IBOutlet var priceLabelCompactView: UILabel!
    @IBOutlet var specialOfferLabelCompactView: UILabel!
    @IBOutlet var guaranteeLabelCompactView: UILabel!
    
    var productDetail: APIProductID?
    var productImages = [UIImage]() {
        didSet {
            DispatchQueue.main.async {
                self.pageControl.numberOfPages = self.productImages.count
                self.productImageView.image = self.productImages[self.pageControl.currentPage]
            }
        }
    }
    var compactConstraints = [NSLayoutConstraint]()
    var regularConstraints = [NSLayoutConstraint]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        if let imageURLs = productDetail?.media?.images?.urls {
            fetchImages(imageURLs)
        }
        setupView()
        setupConstraints()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
      if traitCollection.horizontalSizeClass != previousTraitCollection?.horizontalSizeClass {
          tableview.reloadData()
      }
    }

    
    private func fetchImages(_ imageURLs: [String]) {
        if let imageURL = imageURLs.first, let url = URL(string: "https:" + imageURL.dropLast()) {
            NetworkService.requestData(url) { [weak self] imageData in
                guard let image = UIImage(data: imageData) else { return }
                self?.productImages.append(image)
                self?.fetchImages(Array(imageURLs.dropFirst()))
            }
        }
    }
    
    private func setupView() {
        self.title = productDetail?.title
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .thin)]
        self.navigationController?.navigationBar.tintColor = .gray
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipes(_:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        productImageView.addGestureRecognizer(leftSwipe)
        productImageView.addGestureRecognizer(rightSwipe)
        productImageView.isUserInteractionEnabled = true
        
        pageControl.allowsContinuousInteraction = true
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        pageControl.backgroundStyle = .minimal
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        
        let price = "£" + (productDetail?.price?.now ?? "N/A")
        priceLabelSideView.text = price
        priceLabelCompactView.text = price
        
        let specialOffer = productDetail?.displaySpecialOffer ?? ""
        print("specialOffer: \(specialOffer)")
        specialOfferLabelSideView.text = specialOffer
        specialOfferLabelCompactView.text = specialOffer
        
        let guarantee = productDetail?.additionalServices?.includedServices?.first ?? ""
        print("guarantee: \(guarantee)")
        guaranteeLabelSideView.text = guarantee
        guaranteeLabelCompactView.text = guarantee
        
        tableview.estimatedRowHeight = 80
        tableview.rowHeight = UITableView.automaticDimension
        
    }
    
    private func setupConstraints() {
        regularConstraints.append(contentsOf: [
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            productImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: (view.frame.width * -3 / 5)),
            productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor, constant: 0)
        ])
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            pageControl.currentPage += 1
        }

        if sender.direction == .right {
            pageControl.currentPage -= 1
        }
        productImageView.image = productImages[pageControl.currentPage]
    }
    
    @objc func pageControlDidChange(_ sender: UIPageControl) {
        productImageView.image = productImages[sender.currentPage]
    }
}


extension DishWasherDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel(frame: CGRect.init(x: 20, y: 0, width: tableView.frame.width - 50, height: 40))
        label.font = .systemFont(ofSize: 25, weight: .thin)

        switch section {
        case 0: label.text = "Product Information"
        case 1: label.text = "Product Specification"
        default: fatalError("Tableview access invalid section: \(section)")
        }
        
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return self.traitCollection.horizontalSizeClass == .regular ? 2 : 1
        case 1: return 7
        default: fatalError("Tableview access invalid section: \(section)")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            return getProductInfoCell(tableView, indexPath)
        case 1:
            return getProductSpecCell(tableView, indexPath)
        default:
            fatalError("Tableview access invalid section: \(indexPath.section)")
        }
        
    }

    func getProductInfoCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoCell", for: indexPath) as! ProductInfoTableViewCell
            cell.upperLabel.text = "Product Code: " + (productDetail?.code ?? "N/A")
            cell.lowerLabel.text = productDetail?.details?.productInformation?.htmlToString
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSpecCell", for: indexPath) as! ProductSpecTableViewCell
            cell.leftLabel.text = "Read More"
            cell.leftLabel.font = .systemFont(ofSize: 16, weight: .medium)
            cell.rightLabel.text = ">"
            return cell
        default:
            fatalError("Tableview access invalid row: \(indexPath.row) at section: \(indexPath.section)")
        }
    }
    
    func getProductSpecCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSpecCell", for: indexPath) as! ProductSpecTableViewCell
        switch indexPath.row {
        case 0:
            cell.leftLabel.text = "Adjustable racking information"
            cell.rightLabel.text = productDetail?.dynamicAttributes?.adjustableracking ?? "N/A"
        case 1:
            cell.leftLabel.text = "Child lock Door & control lock Delay start"
            cell.rightLabel.text = productDetail?.dynamicAttributes?.childlock ?? "N/A"
        case 2:
            cell.leftLabel.text = "Delay Wash"
            cell.rightLabel.text = productDetail?.dynamicAttributes?.timerdelay ?? "N/A"
        case 3:
            cell.leftLabel.text = "Delicate Wash"
            cell.rightLabel.text = productDetail?.dynamicAttributes?.delicatewash ?? "N/A"
        case 4:
            cell.leftLabel.text = "Dimensions"
            cell.rightLabel.text = productDetail?.dynamicAttributes?.dimensions ?? "N/A"
        case 5:
            cell.leftLabel.text = "Drying performance"
            cell.rightLabel.text = productDetail?.dynamicAttributes?.energyratingoverall ?? "N/A"
        case 6:
            cell.leftLabel.text = "Drying system"
            cell.rightLabel.text = productDetail?.dynamicAttributes?.dryingsystem ?? "N/A"
        default:
            fatalError("Tableview access invalid row: \(indexPath.row) at section: \(indexPath.section)")
        }
        return cell
    }
        
}


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

