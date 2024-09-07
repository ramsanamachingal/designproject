class Model{
  String? name;
  String? age;
  String? course;
  Model({
required this.name,
required this.age,
required this.course

  });
Map<String,dynamic>tomap(){
  return {
    "user name":name,
    "Age":age,
    "Course":course
  };
}
  

 

}


