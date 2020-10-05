//
//  VideoTableViewCell.swift
//  youtube-ios
//
//  Created by Zeki Guler on 5/10/20.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabe: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        self.video = v
        
        guard self.video != nil else {
            return
        }
        self.titleLabe.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: self.video!.published)
        
        // set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        // Check cache before downloainding data
        
        if let cachedDatat = CasheManager.getVideoCache(self.video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cachedDatat)
            return
        }
        // downlaod
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                CasheManager.setVideoCache(url!.absoluteString, data)
                
                if  url!.absoluteString != self.video!.thumbnail {
                    //
                    
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.sync {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        // start data task
        dataTask.resume()
        
    }

}
