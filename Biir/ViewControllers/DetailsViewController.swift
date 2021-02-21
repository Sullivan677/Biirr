import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    var beer: Beer!
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(beer.name ?? "") "
        view.backgroundColor = .systemBackground
        setupScrollView()
        setupViews()
        // Using the SDWebImage framework to load, present a placeholder image & cache from URL efficiently
        headerImage.sd_setImage(with: URL(string: beer.labels?.medium ?? ""), placeholderImage: UIImage(named: "placeholder"))
    }
    
    //Making the screen scrollable
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    // Creating the UI elements
    func setupViews() {
        contentView.addSubview(headerImage)
        headerImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        headerImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 350).isActive = true
        headerImage.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        contentView.addSubview(ibuLabel)
        // Implement "Smooth", "Bitter" and "Hipster Plus" cases
        let ibuMaxstring = "\(beer.style?.ibuMax ?? "")"
        let ibuInt = Int(ibuMaxstring) ?? 0
        switch ibuInt {
        case 0...19:
            ibuLabel.text =  "Smooth"
        case 20...50:
            ibuLabel.text = "Bitter"
        case 51...300:
            ibuLabel.text = "Hipster Plus"
        default:
            ibuLabel.text = "IBU N/A"
        }
       
        ibuLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        ibuLabel.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 15).isActive = true
        ibuLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 4/5).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.text = "\(beer.nameDisplay ?? "") "
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: ibuLabel.bottomAnchor, constant: 5).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 4/5).isActive = true
    
        contentView.addSubview(categoryLabel)
        categoryLabel.text = "\(beer.style?.category?.name ?? "") "
        categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        categoryLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 4/5).isActive = true
        
        contentView.addSubview(abvLabel)
        abvLabel.text = "ABV: \(beer.abv ?? "")%"
        abvLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        abvLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5).isActive = true
        abvLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 4/5).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.text = "\(beer.description ?? "") "
        descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: abvLabel.bottomAnchor, constant: 15).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 4/5).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    let headerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let ibuLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let abvLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
