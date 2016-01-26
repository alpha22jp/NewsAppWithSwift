//
//  FeedTableViewCell.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/12/31.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import UIKit
import WebImage
import Alamofire


class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var link: String! {
        didSet {
            Alamofire.request(.GET, ArticleAPI.ogpImage + link).responseObject("") {
                (response: Response<OGPResponse, NSError>) in
                guard let ogpImgSrc = response.result.value?.image else {
                    print("Image response error")
                    return
                }
                let imageUrl = NSURL(string: ogpImgSrc)
                print(imageUrl)
                self.setThumbnailWithFadeInAnimation(imageUrl)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(entry: Entry){
        titleLabel.text = entry.title
        descriptionLabel.text = entry.contentSnippet
        self.link = entry.link
    }
    
    func setThumbnailWithFadeInAnimation(imageUrl: NSURL!){
        self.thumbnailImageView.loadWebImage(imageUrl, placeholderImage: nil) {
            (image, error, cacheType, url) in
            self.thumbnailImageView.alpha = 0
            UIView.animateWithDuration(0.25) {
                self.thumbnailImageView.alpha = 1
            }
        }
    }
    
}
