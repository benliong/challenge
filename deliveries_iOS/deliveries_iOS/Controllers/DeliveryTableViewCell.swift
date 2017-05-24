//
//  DeliveryTableViewCell.swift
//  deliveries_iOS
//
//  Created by XCodeClub on 2017-05-23.
//  Copyright © 2017 Ben Liong. All rights reserved.
//

import UIKit
import SnapKit

class DeliveryTableViewCell: UITableViewCell {

    var delivery:Delivery?
    var deliveryImageView = UIImageView()
    var detailsLabel = UILabel()
    var locationLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(deliveryImageView)
        deliveryImageView.backgroundColor = UIColor.red
        deliveryImageView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(8)
            make.width.equalTo(44)
            make.height.equalTo(44)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        deliveryImageView.layer.cornerRadius = deliveryImageView.bounds.height / 2
        deliveryImageView.layer.masksToBounds = true
        deliveryImageView.clipsToBounds = true
        
        contentView.addSubview(detailsLabel)
        detailsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalTo(deliveryImageView.snp.trailing).offset(8)
            make.trailing.equalTo(contentView.snp.trailing).offset(-8)
        }
        detailsLabel.numberOfLines = 0
        contentView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(detailsLabel.snp.bottom).offset(8)
            make.leading.equalTo(deliveryImageView.snp.trailing).offset(8)
            make.trailing.equalTo(contentView.snp.trailing).offset(-8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
            make.height.equalTo(21)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadData() {
        deliveryImageView.layer.cornerRadius = deliveryImageView.bounds.height / 2
        deliveryImageView.layer.masksToBounds = true
        deliveryImageView.clipsToBounds = true

        guard let delivery = delivery else {
            // TODO: Clear the cell UI
            return
        }
        
        if let imageURL = delivery.imageURL {
            deliveryImageView.setImage(withURL: imageURL, contentMode: .scaleAspectFill)
        } else {
            deliveryImageView.image = nil
        }
        
        detailsLabel.text = delivery.details?.appending("\n aksdjlaksjd \n akjdlsakjd")
        locationLabel.text = delivery.location?.address
    }
}
