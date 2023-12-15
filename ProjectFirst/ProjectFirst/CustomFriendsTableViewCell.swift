//
//  CustomTableViewCell.swift
//  ProjectFirst
//
//  Created by Maxim Terekhin on 14.12.2023.
//

import UIKit

final class CustomFriendsTableViewCell: UITableViewCell {
    static let identifier = "CustomFriendsTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Name"
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
    
    func configureCell(friend: Friend) {
        label.text = "\(friend.lastName) \(friend.firstName)"
        circleView.getImage(imageUrl: friend.photo200Orig)
    }
    
    private func addSubviews() {
        contentView.addSubview(circleView)
        contentView.addSubview(label)
    }
    
    private func setupConstraints() {
        circleView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            circleView.heightAnchor.constraint(equalToConstant: 50),
            circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor),
            
            label.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
        ])
    }
}

//#Preview {
//    CustomFriendsTableViewCell()
//}
