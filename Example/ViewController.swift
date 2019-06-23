import UIKit
import DatePickerCell

class ViewController: UITableViewController {
    
    var cells = [[UIView]]()
    
    override func viewDidLoad() {
        self.tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.tableView.rowHeight = UITableView.automaticDimension
        // Removes extra separators.
        self.tableView.tableFooterView = UIView()
        
        // The DatePickerCell.
        let datePickerCell = DatePickerCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        // Cells is a 2D array containing sections and rows.
        cells = [[datePickerCell]]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Get the correct height if the cell is a DatePickerCell.
        let cell = cells[indexPath.section][indexPath.row]
        if (cell is DatePickerCell) {
            return (cell as! DatePickerCell).datePickerHeight()
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect automatically if the cell is a DatePickerCell.
        let cell = self.tableView.cellForRow(at: indexPath)
        if (cell is DatePickerCell) {
            let datePickerTableViewCell = cell as! DatePickerCell
            datePickerTableViewCell.selectedInTableView(tableView)
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row] as! UITableViewCell
    }
}

