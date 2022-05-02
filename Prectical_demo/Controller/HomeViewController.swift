import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var tableView: UITableView?
    fileprivate let viewModel = CategoryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Practical Task"
        navigationController?.navigationBar.prefersLargeTitles = true

        if let tableView = tableView {
            viewModel.reloadSections = { (section: Int, indexpaths: [IndexPath], isInserting: Bool) in
                if isInserting {
                    tableView.insertRows(at: indexpaths, with: .fade)
                } else {
                    tableView.deleteRows(at: indexpaths, with: .fade)
                }
                tableView.beginUpdates()
                tableView.reloadSections([section], with: .fade)
                tableView.endUpdates()
            }

            tableView.dataSource = viewModel
            tableView.delegate = viewModel
            tableView.estimatedRowHeight = 100
            tableView.rowHeight = UITableView.automaticDimension
            tableView.sectionHeaderHeight = 50
            tableView.register(CategoryItemView.nib, forCellReuseIdentifier: CategoryItemView.identifier)
            tableView.register(CategoryHeaderView.nib, forHeaderFooterViewReuseIdentifier: CategoryHeaderView.identifier)
        }
    }
    
    func getDataFromApiCall(completion: @escaping (_ success: Bool) -> Void) {
        let address = "http://api.gobeintheworld.org/all-list"
        let url = URL(string: address)
        var request = URLRequest(url: url!)
        let parameters: [String: Any] = [
            "name": 363]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { print(error!.localizedDescription); return }
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }

        }.resume()
    }
}
