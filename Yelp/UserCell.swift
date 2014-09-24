//
//  UserCell.swift
//  Yelp
//
//  Created by Tejas Bhartiya on 9/21/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

   
    
    
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    @IBOutlet weak var itemDistance: UILabel!
    @IBOutlet weak var ratingsCount: UILabel!
    @IBOutlet weak var itemAddress: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var itemCategories: UILabel!
    
    
    
    
    var listing: NSDictionary = NSDictionary()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        itemLabel.text = listing["name"] as? String
     
        var imageUrl = listing["image_url"] as? String
        posterImageView.layer.cornerRadius = 5;
        posterImageView.clipsToBounds = true;
        if let listingImageUrl = imageUrl {
            posterImageView.setImageWithURL(NSURL(string: listingImageUrl))
        }
        var ratingsImageUrl = listing["rating_img_url"] as? String
        ratingImageView.setImageWithURL(NSURL(string: ratingsImageUrl!))
        var numberOfRatings = listing["review_count"] as? Int
        ratingsCount.text = "\(numberOfRatings!) Reviews"
        
        var location = listing["location"] as NSDictionary
        var displayAddress = location["display_address"] as [String]
        var labelDisplayAddress = ""
        if (displayAddress.count >= 1) {
            labelDisplayAddress = "\(displayAddress[0]), \(displayAddress[1])"
        }
        
        itemAddress.text = labelDisplayAddress
        
        var categories = listing["categories"] as [[String]]
        var categoryLabelString = ""
        // TODO fix that trailing comma
        for category in categories {
            categoryLabelString += "\(category[0]), "
        }
        //TODO Remove trailing comma
        
        var strLength = (categoryLabelString as NSString).length 
       
       
        let labelText: String  = (categoryLabelString as NSString).substringToIndex(strLength)
        itemCategories.text = labelText
            // Get the real distance
        itemDistance.text = "0.5mi"
        
    }


}
