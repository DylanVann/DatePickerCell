#DVDatePickerTableViewCell

<p align="center">
<img src="http://i.imgur.com/dpHIzw8.gif"/>
<br>
[slow motion]
</p>

Inline/Expanding date picker for table views.

##Usage

You'll probably be using this in a static tableview. You can set it up like this in your TableViewController:

###viewDidLoad

```Swift
var cell = DVDatePickerTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
cell.leftLabel.text = "The label for the date picker."
cell.datePicker // The datepicker. Add yourself as a target like you normally would, if required.
cell.datePicker.addTarget(self, action: "datePicked:", forControlEvents: UIControlEvents.ValueChanged)
cell.date // The date. Setting will update the picker view and label.
// Add it to an array of cells or something.
```

###didSelectRowAtIndexPath

```Swift
override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
  var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
  if (cell.isKindOfClass(DVDatePickerTableViewCell)) {
    (cell as DVDatePickerTableViewCell).selectedInTableView(tableView)
  }
  self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
}
```

###heightForRowAtIndexPath 

```Swift
override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
  var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
  if (cell.isKindOfClass(DVDatePickerTableViewCell)) {
    return (cell as DVDatePickerTableViewCell).datePickerHeight()
  }
  return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
}
```
