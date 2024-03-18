import 'package:flutter/material.dart';

import '../model/Best_Selling.dart';

class BestSellingWidget extends StatelessWidget {
  BestSellingCourses? bestCourse;
  BestSellingWidget({required this.bestCourse});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(10)

      ) ,
           
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
           mainAxisAlignment: MainAxisAlignment. spaceAround,
          children: [
            Image.asset("assets/images/route 1.png",width: 60,height:50,fit:BoxFit. cover, ),
            Column(
              children: [
                Text(bestCourse?.title??"",style: Theme.of(context).textTheme.bodyMedium,),
                Text(" ${bestCourse?.number} student Enrolled",style:Theme.of(context).textTheme.labelSmall),
              ],
            ),
            ElevatedButton(
              style:ElevatedButton.styleFrom( backgroundColor: Theme.of(context).colorScheme.secondary) ,
                onPressed: (){} ,
                child: Text("Join ",style: TextStyle(fontSize: 15),))
          ],
        ),
      ),
    ) ;
  }
}
