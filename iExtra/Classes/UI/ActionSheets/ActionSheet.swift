//
//  ActionSheet.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 Action sheets can either display a plain or a grouped
 list or items. Plain lists are equivalent to a native
 action sheet, while grouped lists can give you richer
 functionality in your action sheets.
 
 Use any of the two setup functions to set which items
 or sections you should present in your action sheets.
 
 If you create action sheet subclasses, that should be
 in charge or which items/sections they should display
 (e.g. action sheets that sets themselves as their own
 delegate and have more specific delegate protocols to
 which they send more specific events) simply override
 the `setup` function.
 
 Action sheets are by default set to auto-dismiss when
 items are tapped. To modify this behavior, change the
 dismissStyle property.
 
 To change the global appearance for all action sheets
 in your apps, modify the static ActionSheetAppearance
 properties (until I figure out how to create a custom
 appearance proxy). To change the appearance of single
 sheets, modify their non-static appearance properties.
 
 */

import UIKit


public protocol ActionSheetDelegate: class {
    
    func actionSheet(_ sheet: ActionSheet, didSelect item: ActionSheetItem, at indexPath: IndexPath)
}


open class ActionSheet: UITableViewController {
    
    
    // MARK: - Initialization
    
    public init(presenter: ActionSheetPresenter) {
        self.presenter = presenter
        super.init(style: .plain)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    
    // MARK: - Dependencies
    
    public var presenter: ActionSheetPresenter!
    
    
    
    // MARK: - Properties
    
    public weak var delegate: ActionSheetDelegate?
    
    public var contentHeight: Int {
        return titleHeight + sectionTotalHeight + itemTotalHeight
    }
    
    public var dismissStyle: ActionSheetDismissStyle = .auto
    
    public var items: [ActionSheetItem] {
        var result = [ActionSheetItem]()
        sections.forEach { result.append(contentsOf: $0.items) }
        return result
    }
    
    private(set) var sections = [ActionSheetItemSection]()

    
    
    // MARK: - Appearance Properties
    
    public var ipadAlertWidth = ActionSheetAppearance.ipadAlertWidth
    public var ipadAlertCornerRadius = ActionSheetAppearance.ipadAlertCornerRadius
    public var itemHeight = ActionSheetAppearance.itemHeight
    public var sectionFont = ActionSheetAppearance.sectionFont
    public var sectionHeight = ActionSheetAppearance.sectionHeight
    public var sectionMargin = ActionSheetAppearance.sectionMargin
    public var sectionTextColor = ActionSheetAppearance.sectionTextColor
    public var sectionTopMargin = ActionSheetAppearance.sectionTopMargin
    
    
    
    // MARK: - Public Functions
    
    open func dismiss() {
        presenter.dismiss(sheet: self)
    }
    
    open func present(in vc: UIViewController, from view: UIView?) {
        presenter.present(sheet: self, in: vc, from: view)
    }
    
    open func setup() { }
    
    open func setup(items: [ActionSheetItem]) {
        let section = ActionSheetItemSection(title: "", items: items)
        setup(sections: [section])
    }
    
    open func setup(sections: [ActionSheetItemSection]) {
        self.sections = sections
        if shouldDisplaySections {
            tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: sectionTopMargin))
        }
        tableView?.reloadData()
    }
}



// MARK: - Calculated Properties

fileprivate extension ActionSheet {
    
    var hasTitle: Bool {
        let title = (self.title ?? "")
        let trimmed = title.trimmingCharacters(in: .whitespaces)
        return trimmed.characters.count > 0
    }
    
    var itemTotalHeight: Int {
        return items.count * itemHeight
    }
    
    var sectionTotalHeight: Int {
        guard shouldDisplaySections else { return 0 }
        var result = sectionTopMargin
        result += sections.count * sectionHeight
        result += (sections.count - 1) * sectionMargin
        return result
    }

    var shouldDisplaySections: Bool {
        return sections.count > 1
    }
    
    var titleHeight: Int {
        return Int(navigationController?.navigationBar.frame.height ?? 0)
    }
}



// MARK: - Private functions

fileprivate extension ActionSheet {
    
    func item(at indexPath: IndexPath) -> ActionSheetItem {
        let section = sections[indexPath.section]
        let items = section.items
        return items[indexPath.row]
    }
    
    func shouldDisplayFooter(for section: Int) -> Bool {
        let isLastSection = section == sections.count - 1
        return shouldDisplaySections && !isLastSection
    }
    
    func setupTableView() {
        tableView.isScrollEnabled = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        
        if #available(iOS 9.0, *) {
            tableView.cellLayoutMarginsFollowReadableWidth = false
        }
    }
}



// MARK: - UITableViewDataSource

extension ActionSheet {
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.item(at: indexPath)
        let cell = item.cell(for: tableView)
        item.refresh(cell: cell)
        return cell
    }
    
    override open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return shouldDisplaySections ? CGFloat(sectionHeight) : 0
    }
    
    override open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return shouldDisplayFooter(for: section) ? CGFloat(sectionMargin) : 0
    }
    
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(itemHeight)
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return shouldDisplaySections ? sections[section].title : nil
    }
    
    override open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 3000, height: 1000))
        let line = UIView(frame: CGRect(x: 0, y: 0, width: 3000, height: 0.5))
        line.backgroundColor = tableView.separatorColor
        view.addSubview(line)
        return view
    }
    
    override open func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        guard let label = header.textLabel else { return }
        header.backgroundView = UIImageView(image: UIImage())
        label.font = sectionFont ?? label.font
        label.textColor = sectionTextColor ?? label.textColor
    }
}



// MARK: - UITableViewDelegate

extension ActionSheet {
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.actionSheet(self, didSelect: item(at: indexPath), at: indexPath)
        if dismissStyle == .auto {
            dismiss()
        }
    }
}
