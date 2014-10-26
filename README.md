#DVDatePickerTableViewCell

Inline/Expanding date picker for table views.

##Usage

You'll probably be using this in a static tableview. You can set it up like this:

```Swift
var cell = DVDatePickerTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
cell.leftLabel.text = "The label for the date picker."
cell.datePicker // The datepicker. Add yourself as a target like you normally would, if required.
cell.datePicker.addTarget(self, action: "datePicked:", forControlEvents: UIControlEvents.ValueChanged)
cell.date // The date. Setting will update the picker view and label.
```
