import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class FilterModal extends StatefulWidget {
  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  bool isCategoriesOpen = false;

  List<String> categories = [
    "All News",
    "Category 1",
    "Category 2",
    "Category 3",
    "Category 4",
    "Category 5",
    "Category 6",
    "Category 7",
    "Category 8",
    "Category 9",
    "Category 10",
    "Category 11",
    "Category 12",
    "Category 13",
    "Category 14",
    "Category 15"
  ];

  Map<String, bool> selectedCategories = {};
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  RangeValues reactions =
      RangeValues(0, 10000); // Default range from 0 to 10,000

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      selectedCategories[category] = category == "All News";
    }
  }

  // Function to show date picker
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: Color(0xff2F9675)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Color(0xff2F9675);

    return GestureDetector(
      onTap: () {
        // Prevent taps outside of modal from closing it
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors
              .transparent, // Transparent background for the modal container
          child: Column(
            children: [
              // Top Row (Back, Filter Title, More Icon)
              Container(
                margin: EdgeInsets.only(top: 40, left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context), // Close modal
                      iconSize: 20,
                    ),
                    // Center the title
                    Expanded(
                      child: Center(
                        child: Text(
                          "Filter",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // 3 vertical dots icon
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        // Action for 3-dot menu icon
                      },
                      iconSize: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Filter Options
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categories Section
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isCategoriesOpen = !isCategoriesOpen;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.circleDot,
                              color: buttonColor, // Green color for dot
                            ),
                            Text(
                              isCategoriesOpen
                                  ? "Collapse Categories"
                                  : "Expand Categories",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              isCategoriesOpen
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isCategoriesOpen)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        constraints: BoxConstraints(
                          maxHeight: 550,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: categories.map((category) {
                              return CheckboxListTile(
                                title: Text(category),
                                value: selectedCategories[category],
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedCategories[category] =
                                        value ?? false;

                                    // If "All News" is selected, uncheck other categories
                                    if (category == "All News" &&
                                        value == true) {
                                      selectedCategories
                                          .updateAll((key, val) => val = false);
                                      selectedCategories[category] = true;
                                    } else if (category != "All News" &&
                                        value == true) {
                                      selectedCategories["All News"] = false;
                                    }
                                  });
                                },
                                activeColor: buttonColor,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    if (!isCategoriesOpen) ...[
                      // Title for Start Date
                      Text(
                        "Start Date",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      // Date Picker Box for Start Date
                      GestureDetector(
                        onTap: () {
                          _selectDate(context, startDateController);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendar,
                                color: buttonColor,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    startDateController.text.isEmpty
                                        ? 'Start Date'
                                        : startDateController.text,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black, // Dropdown icon is black
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Title for End Date
                      Text(
                        "End Date",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      // Date Picker Box for End Date
                      GestureDetector(
                        onTap: () {
                          _selectDate(context, endDateController);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendar,
                                color: buttonColor,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    endDateController.text.isEmpty
                                        ? 'End Date'
                                        : endDateController.text,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black, // Dropdown icon is black
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Title for Reactions
                      SizedBox(height: 20),
                      Text(
                        "Reactions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Range Slider for Reactions
                      Column(
                        children: [
                          RangeSlider(
                            values: reactions,
                            min: 0,
                            max: 10000,
                            divisions: 100,
                            labels: RangeLabels(
                              reactions.start.round().toString(),
                              reactions.end.round().toString(),
                            ),
                            activeColor: buttonColor,
                            onChanged: (RangeValues values) {
                              setState(() {
                                reactions = values;
                              });
                            },
                          ),
                          // Reactions text under the slider
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("0 Reactions",
                                  style: TextStyle(color: Colors.black)),
                              Text("10.000 Reactions",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              Spacer(),

              // Apply Filter Button
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Gather selected categories, date range, and reactions
                    List<String> selectedCategoryNames = selectedCategories
                        .entries
                        .where((entry) => entry.value)
                        .map((entry) => entry.key)
                        .toList();

                    String startDate = startDateController.text;
                    String endDate = endDateController.text;
                    String reactionsRange =
                        "${reactions.start.round()} - ${reactions.end.round()}";

                    // Close the modal
                    Navigator.pop(context);

                    // Show the collected filter data in an AlertDialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Applied Filters"),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  "Categories: ${selectedCategoryNames.join(', ')}"),
                              Text("Start Date: $startDate"),
                              Text("End Date: $endDate"),
                              Text("Reactions: $reactionsRange"),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(
                                    context); // Close the alert dialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: Text(
                    "Apply Filters",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PPTelegraf',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
