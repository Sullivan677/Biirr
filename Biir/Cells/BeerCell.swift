import UIKit

class BeerCell: UITableViewCell {
    
    static let identifier = "beerCell"
     var beerImage = UIImageView()
     var beerTitle = UILabel()
     var subtitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(beerImage)
        addSubview(beerTitle)
        addSubview(subtitleLabel)
        configureImageView()
        configureTitle()
        configureSubtitle()
        setImageConstraints()
        setTitleConstraint()
        setSubtitleConstraint()
      }
    
    required init?(coder _: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }
    
    func configureImageView() {
        beerImage.clipsToBounds = true
        beerImage.layer.cornerRadius = 9
        beerImage.contentMode = .scaleAspectFill
    }
    
    func setImageConstraints() {
        beerImage.translatesAutoresizingMaskIntoConstraints = false
        beerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        beerImage.heightAnchor.constraint(equalToConstant: 85).isActive = true
        beerImage.widthAnchor.constraint(equalToConstant: 85).isActive = true
        beerImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func configureTitle() {
        beerTitle.numberOfLines = 0
        beerTitle.adjustsFontSizeToFitWidth = true
        beerTitle.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    func setTitleConstraint() {
        beerTitle.translatesAutoresizingMaskIntoConstraints = false
        beerTitle.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10).isActive = true
        beerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        beerTitle.preferredMaxLayoutWidth = 180
    }
    
    func configureSubtitle() {
        subtitleLabel.numberOfLines = 0
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        subtitleLabel.preferredMaxLayoutWidth = 180
    }
    
    func setSubtitleConstraint() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.leadingAnchor.constraint(equalTo: beerImage.trailingAnchor, constant: 10).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: beerTitle.bottomAnchor, constant: 7).isActive = true
    }
}
