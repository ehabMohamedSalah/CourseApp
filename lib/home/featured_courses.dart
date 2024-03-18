import 'package:flutter/material.dart';
import 'package:task_firebase/style/theme.dart';
import 'package:task_firebase/model/Featured_Courses.dart';

class FeaturedCoursesWidget extends StatelessWidget {
FeaturedCourses featuredCourse;
FeaturedCoursesWidget({required this.featuredCourse});
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(10)
      ),
     
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            Image.asset("assets/images/route 1.png"),
            Text(featuredCourse .title??"",style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18),),
            Text(" ${featuredCourse.numberOfStudent} studentEnrolled",style: Theme.of(context).textTheme.labelSmall,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.secondary),
                onPressed:  (){},
                child: Text("Enroll Now",   ))
          ],
        ),
      ),
    );
  }
}
