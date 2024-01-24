import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:class_search/viewmodels/class_locator_viewmodel.dart';
import 'package:class_search/views/class_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:class_search/viewmodels/class_locator_viewmodel.dart';
import 'package:class_search/views/admin_login_page.dart';
import 'package:class_search/views/class_locator.dart';

/*class ClassLocator extends StatefulWidget {
  @override
  _ClassLocatorState createState() => _ClassLocatorState();
}

class _ClassLocatorState extends State<ClassLocator> {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseCodeController = TextEditingController();
  TextEditingController presentationCodeController = TextEditingController();
  List<Map<String, dynamic>> allClassData = [];
  List<Map<String, dynamic>> displayedClassData = [];
  bool isLoading = false;

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    // Check if any search criteria are entered
    if (courseNameController.text.isEmpty &&
        courseCodeController.text.isEmpty &&
        presentationCodeController.text.isEmpty) {
      showNoSearchCriteriaAlert();
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Developer Mode: Let's pretend we're making an intense API call here
    // Replace with your actual API endpoint or data fetching logic
    await Future.delayed(Duration(seconds: 2));

    // Simulated data
    List<Map<String, dynamic>> data = [
      {'className': 'Quantum Physics 404', 'classLocation': 'Lab 404'},
      {'className': 'Literature 201', 'classLocation': 'Library'},
      {
        'className': 'Artificial Intelligence 555',
        'classLocation': 'Server Room'
      },
    ];

    setState(() {
      allClassData = List<Map<String, dynamic>>.from(data);
      updateDisplayedData();
      isLoading = false;
    });
  }

  void updateDisplayedData() {
    // Developer Mode: Supercharged filtering algorithm for ultimate precision
    final String courseName = courseNameController.text.toLowerCase();
    final String courseCode = courseCodeController.text.toLowerCase();
    final String presentationCode =
        presentationCodeController.text.toLowerCase();

    displayedClassData = allClassData.where((classInfo) {
      final String className = classInfo['className']?.toLowerCase() ?? '';
      final String classCode = classInfo['classCode']?.toLowerCase() ?? '';
      final String presentation =
          classInfo['presentationCode']?.toLowerCase() ?? '';

      return className.contains(courseName) &&
          classCode.contains(courseCode) &&
          presentation.contains(presentationCode);
    }).toList();

    // Developer Mode: Handle null search with a touch of elegance
    if (displayedClassData.isEmpty) {
      showNoClassPopup();
    }
  }

  void showNoSearchCriteriaAlert() {
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

  void showNoClassPopup() {
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

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'جستجوگر کلاس',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'IranSans', // Use the custom font family
            color: Colors.white, // Red text
          ),
        ),
        backgroundColor: Colors.blue, // Colorful AppBar
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              child: Image.asset(
                'assets/images/yadegarIn.webp', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Developer Mode: Hyper-responsive text fields for lightning-fast input
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: courseNameController,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IranSans', // Use the custom font family
                      color: Colors.black, // Red text
                    ),
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      labelText: 'نام درس',
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IranSans', // Use the custom font family
                        color: Colors.black, // Red text
                      ),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70, // Light filled color
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: courseCodeController,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IranSans', // Use the custom font family
                      color: Colors.black, // Red text
                    ),
                    decoration: InputDecoration(
                      labelText: 'کد درس',
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IranSans', // Use the custom font family
                        color: Colors.black, // Red text
                      ),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: presentationCodeController,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IranSans', // Use the custom font family
                      color: Colors.black, // Red text
                    ),
                    decoration: InputDecoration(
                      labelText: 'کد ارائه',
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IranSans', // Use the custom font family
                        color: Colors.black, // Red text
                      ),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: 18.0),
                // Developer Mode: Turbocharged search button for instantaneous results
                ElevatedButton(
                  onPressed: () {
                    fetchData();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    // Increased padding for a larger button
                    child: Text(
                      'جست و جو',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IranSans', // Use the custom font family
                        color: Colors.white, // Red text
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Orange button
                  ),
                ),
                SizedBox(height: 16.0),
                isLoading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ListTile(
                          title: Container(
                            height: 60.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Expanded(
                        child: displayedClassData.isEmpty
                            ? Center(
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  courseNameController.text.isEmpty &&
                                          courseCodeController.text.isEmpty &&
                                          presentationCodeController
                                              .text.isEmpty
                                      ? 'جستجو خود را با وارد کردن معیارهای بالا شروع کنید.'
                                      : 'کلاسی پیدا نشد',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        'IranSans', // Use the custom font family
                                    color: Colors.red, // Red text // Red text
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: displayedClassData.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 4.0,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 0.0,
                                    ),
                                    color: Colors
                                        .lightBlueAccent, // Light Blue card
                                    child: ListTile(
                                      // Developer Mode: Dynamic text styling for extra flair
                                      title: Text(
                                        displayedClassData[index]['className'],
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'IranSans',
                                          // Use the custom font family
                                          color: Colors
                                              .white, // Red text // Red text
                                        ),
                                      ),
                                      subtitle: Text(
                                        displayedClassData[index]
                                            ['classLocation'],
                                        style: TextStyle(
                                          fontFamily: 'IranSans',
                                          // Use the custom font family
                                          color: Colors.white70, // Light text
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Developer Mode: The grand entrance of the app, leaving users in awe
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Set this property to false
    home: ClassLocator(),
  ));
}*/

/*
class ClassLocator extends StatefulWidget {
  @override
  _ClassLocatorState createState() => _ClassLocatorState();
}

class _ClassLocatorState extends State<ClassLocator> {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseCodeController = TextEditingController();
  TextEditingController presentationCodeController = TextEditingController();
  List<Map<String, dynamic>> allClassData = [];
  List<Map<String, dynamic>> displayedClassData = [];
  bool isLoading = false;
  List<Map<String, dynamic>> data = [
    {'className': 'Quantum Physics 404', 'classLocation': 'Lab 404'},
    {'className': 'Literature 201', 'classLocation': 'Library'},
    {
      'className': 'Artificial Intelligence 555',
      'classLocation': 'Server Room'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'جستجوگر کلاس',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'IranSans',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              child: Image.asset(
                'assets/images/yadegarIn.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SearchTextField(controller: courseNameController, labelText: 'نام درس'),
                SizedBox(height: 16.0),
                SearchTextField(controller: courseCodeController, labelText: 'کد درس'),
                SizedBox(height: 16.0),
                SearchTextField(controller: presentationCodeController, labelText: 'کد ارائه'),
                SizedBox(height: 18.0),
                SearchButton(onPressed: fetchData),
                SizedBox(height: 16.0),
                isLoading
                    ? LoadingIndicator()
                    : Expanded(
                  child: displayedClassData.isEmpty
                      ? Center(
                    child: Text(
                      noSearchCriteria()
                          ? 'جستجو خود را با وارد کردن معیارهای بالا شروع کنید.'
                          : 'کلاسی پیدا نشد',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IranSans',
                        color: Colors.red,
                      ),
                    ),
                  )
                      : ClassList(displayedClassData: displayedClassData),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool noSearchCriteria() {
    return courseNameController.text.isEmpty &&
        courseCodeController.text.isEmpty &&
        presentationCodeController.text.isEmpty;
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);

    if (noSearchCriteria()) {
      showNoSearchCriteriaAlert();
      setState(() => isLoading = false);
      return;
    }

    await simulateAPICall();

    setState(() {
      allClassData = List<Map<String, dynamic>>.from(data);
      updateDisplayedData();
      isLoading = false;
    });
  }

  void updateDisplayedData() {
    displayedClassData = allClassData.where((classInfo) {
      final String className = classInfo['className']?.toLowerCase() ?? '';
      final String classCode = classInfo['classCode']?.toLowerCase() ?? '';
      final String presentation =
          classInfo['presentationCode']?.toLowerCase() ?? '';

      return className.contains(courseNameController.text.toLowerCase()) &&
          classCode.contains(courseCodeController.text.toLowerCase()) &&
          presentation.contains(presentationCodeController.text.toLowerCase());
    }).toList();

    if (displayedClassData.isEmpty) {
      showNoClassPopup();
    }
  }

  Future<void> simulateAPICall() async {
    await Future.delayed(Duration(seconds: 2));
  }

  void showNoSearchCriteriaAlert() {
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

  void showNoClassPopup() {
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
}

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const SearchTextField({required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        controller: controller,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'IranSans',
          color: Colors.black,
        ),
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'IranSans',
            color: Colors.black,
          ),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white70,
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SearchButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'جست و جو',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'IranSans',
            color: Colors.white,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        title: Container(
          height: 60.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ClassList extends StatelessWidget {
  final List<Map<String, dynamic>> displayedClassData;

  const ClassList({required this.displayedClassData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: displayedClassData.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4.0,
          margin: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 0.0,
          ),
          color: Colors.lightBlueAccent,
          child: ListTile(
            title: Text(
              displayedClassData[index]['className'],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IranSans',
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              displayedClassData[index]['classLocation'],
              style: TextStyle(
                fontFamily: 'IranSans',
                color: Colors.white70,
              ),
            ),
          ),
        );
      },
    );
  }
}*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ClassLocatorViewModel(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'جستجوگر کلاس',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IranSans',
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
          ),
          body: ClassLocator(),
        ),
      ),

    );
  }
}

