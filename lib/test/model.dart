class ModelSample{
  String name;
String age;
String? course;
ModelSample({
  required this.name,
  required this.age,
   this.course,
});
Map <String,dynamic> toMap(){
  return {
    "Name":name,
    "Age":age,
    "Course":course
  };
}
} 