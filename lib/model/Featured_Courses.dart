import 'package:cloud_firestore/cloud_firestore.dart';

class FeaturedCourses{
    String? title;
    int? numberOfStudent;
    FeaturedCourses({required this.title,required this.numberOfStudent});

    //NmaedConstructor
    FeaturedCourses.fromFireStore(Map<String,dynamic> data){
      title=data["title"];
      numberOfStudent=data["numberOfStudent"];
    }
    Map<String,dynamic> toFireStore(){
      Map<String,dynamic>data={
        "title":title,
        "numberOfStudent":numberOfStudent,

      };
      return data;
    }


}