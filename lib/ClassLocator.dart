import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
      {'className': 'Artificial Intelligence 555', 'classLocation': 'Server Room'},
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
          title: Text('بدون معیار جستجو',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'IranSans', // Use the custom font family
              color: Colors.red, // Red text
            ),
          ),
          content: Text('لطفاً حداقل یک معیار جستجو وارد کنید.',
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
              child: Text('باشه',
              textDirection: TextDirection.rtl,
        style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'IranSans', // Use the custom font family
        color: Colors.black, // Red text
        ),),
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
          title: Text('هیچ کلاسی پیدا نشد !',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'IranSans', // Use the custom font family
              color: Colors.deepOrange, // Red text
            ),
          ),
          content: Text('متاسفانه هیچ کلاسی با معیارهای جستجوی شما همخوانی ندارد.',
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
              child: Text('باشه',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IranSans', // Use the custom font family
                  color: Colors.black, // Red text
                ),),
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
        centerTitle:true,
        title: Text('جستجوگر کلاس',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'IranSans', // Use the custom font family
            color: Colors.white, // Red text
          ),),
        backgroundColor: Colors.blue, // Colorful AppBar
      ),
      body: Padding(
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
                padding: const EdgeInsets.all(16.0), // Increased padding for a larger button
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
                      presentationCodeController.text.isEmpty
                      ? 'جستجو خود را با وارد کردن معیارهای بالا شروع کنید.'
                      : 'کلاسی پیدا نشد',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IranSans', // Use the custom font family
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
                    color: Colors.lightBlueAccent, // Light Blue card
                    child: ListTile(
                      // Developer Mode: Dynamic text styling for extra flair
                      title: Text(
                        displayedClassData[index]['className'],
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IranSans', // Use the custom font family
                          color: Colors.white, // Red text // Red text
                        ),
                      ),
                      subtitle: Text(
                        displayedClassData[index]['classLocation'],
                        style: TextStyle(
                          fontFamily: 'IranSans', // Use the custom font family
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
    );
  }
}

// Developer Mode: The grand entrance of the app, leaving users in awe
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Set this property to false
    home: ClassLocator(),
  ));
}
