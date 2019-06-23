import Foundation
import UIKit

/**
*  Inline/Expanding date picker for table views.
*/

/**
 *  Optional protocol called when date is picked
 */
@objc public protocol DatePickerCellDelegate {
    @objc optional func datePickerCell(_ cell: DatePickerCell, didPickDate date: Date?)
}

open class DatePickerCell: UITableViewCell {
    
    /**
    *  UIView subclass. Used as a subview in UITableViewCells. Does not change color when the UITableViewCell is selected.
    */
    
    // delegate
    open var delegate: DatePickerCellDelegate?
    
    class DVColorLockView:UIView {
        
        var lockedBackgroundColor:UIColor {
            set {
                super.backgroundColor = newValue
            }
            get {
                return super.backgroundColor!
            }
        }
        
        override var backgroundColor:UIColor? {
            set {
            }
            get {
                return super.backgroundColor
            }
        }
    }
    
    // Only create one NSDateFormatter to save resources.
    static let dateFormatter = DateFormatter()
    
    /// The selected date, set to current date/time on initialization.
    open var date:Date = Date() {
        didSet {
            datePicker.date = date
            DatePickerCell.dateFormatter.dateStyle = dateStyle
            DatePickerCell.dateFormatter.timeStyle = timeStyle
            rightLabel.text = DatePickerCell.dateFormatter.string(from: date)
        }
    }
    /// The timestyle.
    open var timeStyle = DateFormatter.Style.short {
        didSet {
            DatePickerCell.dateFormatter.timeStyle = timeStyle
            rightLabel.text = DatePickerCell.dateFormatter.string(from: date)
        }
    }
    /// The datestyle.
    open var dateStyle = DateFormatter.Style.medium {
        didSet {
            DatePickerCell.dateFormatter.dateStyle = dateStyle
            rightLabel.text = DatePickerCell.dateFormatter.string(from: date)
        }
    }

    /// Label on the left side of the cell.
    open var leftLabel = UILabel()
    /// Label on the right side of the cell.
    open var rightLabel = UILabel()
    /// Color of the right label. Default is the color of a normal detail label.
    open var rightLabelTextColor = UIColor(hue: 0.639, saturation: 0.041, brightness: 0.576, alpha: 1.0) {
        didSet {
            rightLabel.textColor = rightLabelTextColor
        }
    }
    
    var seperator = DVColorLockView()
    
    var datePickerContainer = UIView()
    /// The datepicker embeded in the cell.
    open var datePicker: UIDatePicker = UIDatePicker()
    
    /// Is the cell expanded?
    open var expanded = false
    var unexpandedHeight = CGFloat(44)
    
    /**
    Creates the DatePickerCell
    
    - parameter style:           A constant indicating a cell style. See UITableViewCellStyle for descriptions of these constants.
    - parameter reuseIdentifier: A string used to identify the cell object if it is to be reused for drawing multiple rows of a table view. Pass nil if the cell object is not to be reused. You should use the same reuse identifier for all cells of the same form.
    
    - returns: An initialized DatePickerCell object or nil if the object could not be created.
    */
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        setup()
    }
    
    fileprivate func setup() {
        // The datePicker overhangs the view slightly to avoid invalid constraints.
        self.clipsToBounds = true
        
        let views = [leftLabel, rightLabel, seperator, datePickerContainer, datePicker]
        for view in views {
            self.contentView .addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        datePickerContainer.clipsToBounds = true
        datePickerContainer.addSubview(datePicker)
        
        // Add a seperator between the date text display, and the datePicker. Lighter grey than a normal seperator.
        seperator.lockedBackgroundColor = UIColor(white: 0, alpha: 0.1)
        datePickerContainer.addSubview(seperator)
        datePickerContainer.addConstraints([
            NSLayoutConstraint(
                item: seperator,
                attribute: NSLayoutConstraint.Attribute.left,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.left,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: seperator,
                attribute: NSLayoutConstraint.Attribute.right,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.right,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: seperator,
                attribute: NSLayoutConstraint.Attribute.height,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: nil,
                attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                multiplier: 1.0,
                constant: 0.5
            ),
            NSLayoutConstraint(
                item: seperator,
                attribute: NSLayoutConstraint.Attribute.top,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.top,
                multiplier: 1.0,
                constant: 0
            ),
            ])
        
        
        rightLabel.textColor = rightLabelTextColor
        
        // Left label.
        self.contentView.addConstraints([
            NSLayoutConstraint(
                item: leftLabel,
                attribute: NSLayoutConstraint.Attribute.height,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: nil,
                attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                multiplier: 1.0,
                constant: 44
            ),
            NSLayoutConstraint(
                item: leftLabel,
                attribute: NSLayoutConstraint.Attribute.top,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: self.contentView,
                attribute: NSLayoutConstraint.Attribute.top,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: leftLabel,
                attribute: NSLayoutConstraint.Attribute.left,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: self.contentView,
                attribute: NSLayoutConstraint.Attribute.left,
                multiplier: 1.0,
                constant: self.separatorInset.left
            ),
            ])
        
        // Right label
        self.contentView.addConstraints([
            NSLayoutConstraint(
                item: rightLabel,
                attribute: NSLayoutConstraint.Attribute.height,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: nil,
                attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                multiplier: 1.0,
                constant: 44
            ),
            NSLayoutConstraint(
                item: rightLabel,
                attribute: NSLayoutConstraint.Attribute.top,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: self.contentView,
                attribute: NSLayoutConstraint.Attribute.top,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: rightLabel,
                attribute: NSLayoutConstraint.Attribute.right,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: self.contentView,
                attribute: NSLayoutConstraint.Attribute.right,
                multiplier: 1.0,
                constant: -self.separatorInset.left
            ),
            ])
        
        // Container.
        self.contentView.addConstraints([
            NSLayoutConstraint(
                item: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.left,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: self.contentView,
                attribute: NSLayoutConstraint.Attribute.left,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.right,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: self.contentView,
                attribute: NSLayoutConstraint.Attribute.right,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.top,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: leftLabel,
                attribute: NSLayoutConstraint.Attribute.bottom,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.bottom,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: self.contentView,
                attribute: NSLayoutConstraint.Attribute.bottom,
                multiplier: 1.0,
                constant: 1
            ),
            ])
        
        // Picker constraints.
        datePickerContainer.addConstraints([
            NSLayoutConstraint(
                item: datePicker,
                attribute: NSLayoutConstraint.Attribute.left,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.left,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: datePicker,
                attribute: NSLayoutConstraint.Attribute.right,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.right,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: datePicker,
                attribute: NSLayoutConstraint.Attribute.top,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: datePickerContainer,
                attribute: NSLayoutConstraint.Attribute.top,
                multiplier: 1.0,
                constant: 0
            ),
            ])
        
        datePicker.addTarget(self, action: #selector(DatePickerCell.datePicked), for: UIControl.Event.valueChanged)
         // Clear seconds.
        let timeIntervalSinceReferenceDateWithoutSeconds = floor(date.timeIntervalSinceReferenceDate / 60.0) * 60.0
        self.date = Date(timeIntervalSinceReferenceDate: timeIntervalSinceReferenceDateWithoutSeconds)
        leftLabel.text = "Date Picker"
    }
    
    /**
    Needed for initialization from a storyboard.

    - parameter aDecoder: An unarchiver object.
    - returns: An initialized DatePickerCell object or nil if the object could not be created.
    */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /**
    Determines the current desired height of the cell. Used in the UITableViewDelegate's heightForRowAtIndexPath method.
    
    - returns: The cell's height.
    */
    open func datePickerHeight() -> CGFloat {
        let expandedHeight = unexpandedHeight + CGFloat(datePicker.frame.size.height)
        return expanded ? expandedHeight : unexpandedHeight
    }
    
    /**
    Used to notify the DatePickerCell that it was selected. The DatePickerCell will then run its selection animation and expand or collapse.
    
    - parameter tableView: The tableview the DatePickerCell was selected in.
    */
    open func selectedInTableView(_ tableView: UITableView) {
        expanded = !expanded
        
        UIView.transition(with: rightLabel, duration: 0.25, options:UIView.AnimationOptions.transitionCrossDissolve, animations: { () -> Void in
                self.rightLabel.textColor = self.expanded ? self.tintColor : self.rightLabelTextColor
        }, completion: nil)
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    // Action for the datePicker ValueChanged event.
    @objc func datePicked() {
        date = datePicker.date
        // date picked, call delegate method
        self.delegate?.datePickerCell?(self, didPickDate: date)
    }
}

