// viewmodels/class_locator_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:class_search/models/class_model.dart';

class ClassLocatorViewModel extends ChangeNotifier {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseCodeController = TextEditingController();
  TextEditingController presentationCodeController = TextEditingController();
  List<ClassModel> allClassData = [];
  List<ClassModel> displayedClassData = [];
  bool isLoading = false;

  Future<void> fetchData(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    if (noSearchCriteria()) {
      showNoSearchCriteriaAlert(context);
      isLoading = false;
      notifyListeners();
      return;
    }

    await simulateAPICall();

    List<Map<String, dynamic>> data = [
      {'className': 'Quantum Physics 404',
    'classCode': 'Lab 404',
    'presentationCode': '1'},

      {'className': 'Literature 201',
      'classCode': 'Library',
      'presentationCode': '2'},

      {
        'className': 'Artificial Intelligence 555',
        'classCode': 'Server Room',
        'presentationCode': '3'
      },
    ];

    allClassData = data.map((map) => ClassModel.fromMap(map)).toList();
    updateDisplayedData(context);
    isLoading = false;
    notifyListeners();
  }

  void updateDisplayedData(BuildContext context) {
    displayedClassData = allClassData.where((classInfo) {
      final String className = classInfo.className.toLowerCase();
      final String classCode = classInfo.classCode.toLowerCase();
      final String presentation = classInfo.presentationCode.toLowerCase();

      return className.contains(courseNameController.text.toLowerCase()) &&
          classCode.contains(courseCodeController.text.toLowerCase()) &&
          presentation.contains(presentationCodeController.text.toLowerCase());
    }).toList();

    if (displayedClassData.isEmpty) {
      showNoClassPopup(context);
    }
  }

  Future<void> simulateAPICall() async {
    await Future.delayed(Duration(seconds: 2));
  }

  void showNoSearchCriteriaAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'بدون معیار جستجو',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'IranSans', // Use the custom font family
              color: Colors.red, // Red text
            ),
          ),
          content: Text(
            'لطفاً حداقل یک معیار جستجو وارد کنید.',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'IranSans', // Use the custom font family
              color: Colors.black, // Red text
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'باشه',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IranSans', // Use the custom font family
                  color: Colors.black, // Red text
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showNoClassPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'هیچ کلاسی پیدا نشد !',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'IranSans', // Use the custom font family
              color: Colors.deepOrange, // Red text
            ),
          ),
          content: Text(
            'متاسفانه هیچ کلاسی با معیارهای جستجوی شما همخوانی ندارد.',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'IranSans', // Use the custom font family
              color: Colors.black, // Red text
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'باشه',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IranSans', // Use the custom font family
                  color: Colors.black, // Red text
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  bool noSearchCriteria() {
    return courseNameController.text.isEmpty &&
        courseCodeController.text.isEmpty &&
        presentationCodeController.text.isEmpty;
  }

  void handleLogoDoubleTap(BuildContext context) {
    // Navigate to the admin login page
    Navigator.pushNamed(context, '/adminLogin');
  }

// Your other methods and logic go here.
}
