class BestSellingCourses{
  String? title;
  int? number;
  BestSellingCourses({required this.title,required this.number});

  BestSellingCourses.fromFireStore(Map<String,dynamic> data){
    title=data["title"];
    number=data["number"];
  }
  Map<String,dynamic> toFireStore(){
    Map<String,dynamic>data={
      "title":title,
      "number":number,

    };
    return data;
  }




}