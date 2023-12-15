

import UIKit

final class CustomGroupsTableViewCell: UITableViewCell {
    
    
    static let identifier = "CustomGroupsTableViewCell"
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    } ()
    
    private let labelDescription: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    } ()
    
    private let circleView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(group: Group) {
        labelName.text = group.name
        labelDescription.text = group.description
    }
    
    private func addSubviews() {
        contentView.addSubview(circleView)
        contentView.addSubview(labelName)
        contentView.addSubview(labelDescription)
    }
    
    private func setupConstraints() {
        circleView.translatesAutoresizingMaskIntoConstraints = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            circleView.heightAnchor.constraint(equalToConstant: 50),
            circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor),
            
            labelName.topAnchor.constraint(equalTo: circleView.topAnchor),
            labelName.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 10),
            labelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            labelDescription.topAnchor.constraint(equalTo: labelName.bottomAnchor),
            labelDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            labelDescription.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 10),
            labelDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
        ])
    }
}

//#Preview {
//    CustomGroupsTableViewCell()
//}
