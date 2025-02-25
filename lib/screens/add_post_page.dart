import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:duo_case_one/main.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  File? _image;
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Color buttonColor = Color(0xff2F9675);

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          dateTimeController.text =
          "\${DateFormat('yyyy-MM-dd').format(pickedDate)} \${pickedTime.format(context)}";
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  ),
                  iconSize: 20,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Add Post",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 20),

            // Image Picker
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  image: _image != null
                      ? DecorationImage(image: FileImage(_image!), fit: BoxFit.cover)
                      : null,
                ),
                child: _image == null
                    ? Center(
                  child: FaIcon(FontAwesomeIcons.image, size: 50, color: buttonColor),
                )
                    : null,
              ),
            ),
            SizedBox(height: 20),

            // Date & Time Picker
            Text("Date & Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () => _selectDateTime(context),
              child: _buildInputBox(dateTimeController, FontAwesomeIcons.calendar, "Select Date & Time"),
            ),
            SizedBox(height: 20),

            // Location Input
            Text("Location", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            _buildInputBox(locationController, FontAwesomeIcons.locationDot, "Enter Location"),
            SizedBox(height: 20),

            // Description Input
            Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Container(
              height: 120,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(border: InputBorder.none, hintText: "Write something..."),
              ),
            ),
            Spacer(),

            // Post Button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                child: Text("Post", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBox(TextEditingController controller, IconData icon, String hintText) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          FaIcon(icon, color: buttonColor),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(border: InputBorder.none, hintText: hintText),
            ),
          ),
        ],
      ),
    );
  }
}