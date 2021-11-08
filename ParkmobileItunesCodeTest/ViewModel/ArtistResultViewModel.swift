//
//  ArtistResultViewModel.swift
//  itunesCodeTest
//
//  Created by Robert Turman on 11/1/21.
//

import UIKit

class ArtistResultViewModel {
    
    // MARK: Properties
    
    private let networking = ArtistResultNetworking()
    public var artistResults: [ArtistResult]?
    
    // MARK: Public
    
    func search(searchTerm: String?, completion: @escaping () -> Void) {
        networking.search(searchTerm: searchTerm) { [weak self] results in
            switch results {
            case .success(let results):
                self?.artistResults = results.results
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int? {
        guard let rows = artistResults?.count else { return 0 }
        return rows
    }
    
    func didSelect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, viewController: UIViewController) {
        let result = result(indexPath: indexPath)
        let vc = DetailViewController.instantiate(result: result)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func cellForRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = result(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsTableViewCell")! as! ResultsTableViewCell
        let imageUrlString = result.artworkUrl60

        cell.imageView?.downloadImage(url: imageUrlString ?? "")
        cell.songTitleLabel.text = result.trackName
        cell.albumTitleLabel.text = result.artistName
        return cell
    }
    
    // MARK: Private
    
    private func result(indexPath: IndexPath) -> ArtistResult {
        guard let results = artistResults else { return ArtistResult() }
        return results[indexPath.row]
    }
}
