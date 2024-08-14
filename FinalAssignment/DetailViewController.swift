//
//  DetailViewController.swift
//  FinalAssignment
//
//  Created by Gaurav Hariyani on 2024-08-14.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    enum DetailType {
        case album(Album)
        case artist(Artist)
        case song(Song)
    }

    var detailType: DetailType?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    func configureView() {
        switch detailType {
        case .album(let album):
            detailLabel.text = album.name
            loadImage(from: album.coverURL)
        case .artist(let artist):
            detailLabel.text = artist.name
        case .song(let song):
            detailLabel.text = song.name
            loadImage(from: song.albumCoverURL)
        case .none:
            break
        }
    }

    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}


