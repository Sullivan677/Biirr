import UIKit
import SDWebImage

class ListViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)
    var beerResults = BeerResult() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        loadData()
        setupTableView()
    }
    
    // Styling navigation bar
    func addNavBarImage() {
            let navController = navigationController!
            let LogoImage = UIImage(named: "biirr_logo")
            let imageView = UIImageView(image: LogoImage)
            let bannerWidth = navController.navigationBar.frame.size.width
            let bannerHeight = navController.navigationBar.frame.size.height
            let bannerX = bannerWidth / 2 - (LogoImage?.size.width)! / 2
            let bannerY = bannerHeight / 2 - (LogoImage?.size.height)! / 2
            imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
            imageView.contentMode = .scaleAspectFit
            navigationItem.titleView = imageView
        }
    
    // Loading data from JSON response
    func loadData() {
        breweryService.shared.getResults() { [weak self] result in
            switch result {
            case .success(let results):
                self?.beerResults = results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    let alertPopUp = UIAlertController(title: error.rawValue, message: nil, preferredStyle: .alert)
                    alertPopUp.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(alertPopUp, animated: true)
                }
                print(error)
            }
        }
    }
    
    // Creating the list
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(BeerCell.self, forCellReuseIdentifier: "beerCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerResults.data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beers = beerResults.data?[indexPath.row]
        let vc = DetailsViewController()
        vc.beer = beers
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell") as! BeerCell
        cell.beerTitle.text = beerResults.data?[indexPath.row].nameDisplay
        cell.beerImage.image = UIImage(named: beerResults.data?[indexPath.row].labels?.icon ?? "")
        cell.beerImage.sd_setImage(with: URL(string: beerResults.data?[indexPath.row].labels?.icon ?? ""), placeholderImage: UIImage(named: "placeholder"))
        cell.subtitleLabel.text = beerResults.data?[indexPath.row].style?.category?.name
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
