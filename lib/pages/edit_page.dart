import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart'; // For date formatting

class EditPage extends StatefulWidget {
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  // Controllers for editable fields
  final TextEditingController firstNameController = TextEditingController(text: 'Radhika');
  final TextEditingController lastNameController = TextEditingController(text: 'Singh');
  final TextEditingController contactController = TextEditingController(text: '9843295503');
  final TextEditingController dobController = TextEditingController(text: '12/08/1998');
  final TextEditingController ageController = TextEditingController(text: '26');
  final TextEditingController maritalStatusController = TextEditingController(text: 'Married');
  final TextEditingController occupationController = TextEditingController(text: 'Teacher');
  final TextEditingController previousMedicationController = TextEditingController(text: 'Yes');

  // Gender value as String (not TextEditingController)
  String gender = 'Female';

  // PDF file path
  String? selectedFilePath;

  // Dropdown value for previous medication
  String previousMedication = 'No';

  // Function to open Date Picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != initialDate) {
      setState(() {
        dobController.text = DateFormat('dd/MM/yyyy').format(picked); // Format the date as dd/MM/yyyy
        _calculateAge(picked); // Automatically calculate age based on DOB
      });
    }
  }

  // Function to calculate Age from DOB
  void _calculateAge(DateTime dob) {
    DateTime today = DateTime.now();
    int age = today.year - dob.year;
    if (dob.month > today.month || (dob.month == today.month && dob.day > today.day)) {
      age--;
    }
    setState(() {
      ageController.text = age.toString();
    });
  }

  // Function to handle file upload
  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFilePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Title
              Text(
                'Profile',
                style: TextStyle(
                  color: Color.fromRGBO(6, 1, 62, 1),
                  fontFamily: 'Inter',
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                ),
              ),

              // Profile Image
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('lib/images/avatar.png'),
              ),
              SizedBox(height: 20),

              // First Name
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Last Name
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Contact Number
              TextField(
                controller: contactController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Contact Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Date of Birth and Age side by side
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context), // Open date picker on tap
                      child: AbsorbPointer(
                        child: TextField(
                          controller: dobController,
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: ageController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Marital Status
              TextField(
                controller: maritalStatusController,
                decoration: InputDecoration(
                  labelText: 'Marital Status',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Gender and Occupation side by side
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: gender, // Use the gender String here
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          gender = newValue!;
                        });
                      },
                      items: ['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: occupationController,
                      decoration: InputDecoration(
                        labelText: 'Occupation',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Previous Medication Dropdown and File Upload side by side
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous Medication Dropdown
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: previousMedication,
                      decoration: InputDecoration(
                        labelText: 'Previous Medication',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          previousMedication = newValue!;
                          if (previousMedication == 'No') {
                            selectedFilePath = null; // Clear the file if 'No' is selected
                          }
                        });
                      },
                      items: ['Yes', 'No'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 20), // Space between dropdown and file upload

                  // File Upload (only enabled if 'Yes' is selected for Previous Medication)
                  if (previousMedication == 'Yes')
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _pickPDF, // Open the file picker for PDF
                        child: Text('Upload PDF'),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),

// Display the selected file name if the file is picked
              if (previousMedication == 'Yes' && selectedFilePath != null)
                Text(
                  'Selected File: ${selectedFilePath!.split('/').last}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Profile Saved'),
                      content: Text(
                          'First Name: ${firstNameController.text}\nLast Name: ${lastNameController.text}\nContact: ${contactController.text}\nDOB: ${dobController.text}\nAge: ${ageController.text}\nMarital Status: ${maritalStatusController.text}\nGender: $gender\nOccupation: ${occupationController.text}\nPrevious Medication: $previousMedication'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
