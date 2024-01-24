// widgets/class_list.dart

import 'package:flutter/material.dart';
import 'package:class_search/models/class_model.dart';

class ClassList extends StatelessWidget {
  final List<ClassModel> displayedClassData;

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
              displayedClassData[index].className,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IranSans',
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              displayedClassData[index].classCode + '' + displayedClassData[index].presentationCode/*remmember to add other parameters*/,
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
}
