

import UIKit

final class CustomGroupsTableViewCell: UITableViewCell {
    
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
    
    private let circleView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 25
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

#Preview {
    CustomGroupsTableViewCell()
}
