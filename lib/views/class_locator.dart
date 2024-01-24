// views/class_locator.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:class_search/viewmodels/class_locator_viewmodel.dart';
import 'package:class_search/views/admin_login_page.dart';
import '../ClassLocator.dart';
import '../widgets/class_list.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/search_button.dart';
import '../widgets/search_text_field.dart';

class ClassLocator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ClassLocatorViewModel>(context);

    return ChangeNotifierProvider(
      create: (context) => ClassLocatorViewModel(),
      child: Scaffold(
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
                  SearchTextField(
                      controller: viewModel.courseNameController,
                      labelText: 'نام درس'),
                  SizedBox(height: 16.0),
                  SearchTextField(
                      controller: viewModel.courseCodeController,
                      labelText: 'کد درس'),
                  SizedBox(height: 16.0),
                  SearchTextField(
                      controller: viewModel.presentationCodeController,
                      labelText: 'کد ارائه'),
                  SizedBox(height: 18.0),
                  SearchButton(onPressed: () async {
                    await viewModel.fetchData(context);
                  }),
                  SizedBox(height: 16.0),
                  viewModel.isLoading
                      ? LoadingIndicator()
                      : Expanded(
                          child: viewModel.displayedClassData.isEmpty
                              ? Center(
                                  child: Text(
                                    viewModel.noSearchCriteria()
                                        ? 'جستجو خود را با پر کردن یکی از فیلدهای بالا شروع کنید'
                                        : 'کلاسی پیدا نشد',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'IranSans',
                                      color: Colors.red,
                                      backgroundColor:
                                          Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                )
                              : ClassList(
                                  displayedClassData:
                                      viewModel.displayedClassData),
                        ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.2, // Adjust the height as needed
                child: GestureDetector(
                  onTap: () {
                    print("Developed By kazemi_m.h");
                  },
                  onDoubleTap: () {
                    // Handle double tap on the logo
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminLoginPage()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/yadegarlogo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
