PickingDeserts
==============

A simple app with a picker view datasource and delegate

###Step 1: Add View Controller
- Create a viewcontroller and set as the rootViewController

###Step 2: Add a PickerView
- Instatiate and add a pickerView
- Add the datasource and delegate methods
  - titleForRow
  - numberOfComponents
  - numberOfRows
- Add the data https://gist.github.com/jkhowland/39afd44041ac8655720d

Run.

###Step 3: Handle the selection
- Add a UILabel property to the top of the view
- Implement the didSelectRow method
- Update the label to show the components in one string
