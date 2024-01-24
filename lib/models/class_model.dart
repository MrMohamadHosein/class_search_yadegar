// models/class_model.dart

class ClassModel {
  String className;
  String classCode;
  String presentationCode;

  ClassModel({required this.className,required this.classCode, required this.presentationCode});

  // Convert the ClassModel to a map for your current usage
  Map<String, dynamic> toMap() {
    return {
      'className': className,
      'classCode':classCode,
      'presentationCode': presentationCode,
    };
  }

  // Create a ClassModel from a map
  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      className: map['className'],
      classCode: map['classCode'],
      presentationCode: map['presentationCode'],
    );
  }
}
