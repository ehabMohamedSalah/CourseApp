import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_firebase/firebase/firestore_helper.dart';
import 'package:task_firebase/home/featured_courses.dart';
import 'package:task_firebase/login/login.dart';
import '../style/theme.dart';
import '../model/Best_Selling.dart';
import '../model/Featured_Courses.dart';
import '../provider/theme_provider.dart';
import 'best_selling.dart';

class HomeScreen extends StatelessWidget {
  static String routeName="HomeScreen";
  bool isDot=true;
  @override
  Widget build(BuildContext context) {
    themeProvider provider=Provider.of<themeProvider>(context);
    return Scaffold(
      backgroundColor: provider.theme==ThemeMode.light?Colors.white:Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( 20),
        child: AppBar(
            backgroundColor: provider.theme==ThemeMode.light?Colors.white:Colors.black,

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                children: [
                  Text("Route",style:  Theme.of(context).textTheme.titleLarge),
                   SizedBox(width:10,),
                  Column(
                    children: [
                      Text('Welcome to route',style:  Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400, ),),
                      SizedBox(height: 10,),
                      Text('Enjoy our courses',style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700 ,fontSize: 18 )),
                    ],
                  ),
                 SizedBox(width: 10,),
                 Row(
                   children: [
                     IconButton(
                       onPressed:  (){
                         isDot=!isDot;
                         provider.changeTheme(isDot==false?ThemeMode.dark:ThemeMode.light );
                       },

                       icon:  provider.theme==ThemeMode.light? Icon(Icons.dark_mode,color: Theme.of(context).colorScheme.secondary,):
                       Icon(Icons.light_mode_rounded, color: Theme.of(context).colorScheme.secondary),
                     ),
                   IconButton(onPressed:  (){
                     Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);

                   }, icon:  Icon(Icons.exit_to_app,color:  Theme.of(context).colorScheme.secondary)),],)
                ],
              ),
            ),
            SizedBox(height: 60,),
            Container(
                alignment: Alignment.centerLeft,
                child: Text("Featured Courses",style:Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 15),)),

            StreamBuilder(
                stream: FireStoreHelper.ListenToFeaturedCourses() ,
                builder: (BuildContext  context, snapshot) {
                  List<FeaturedCourses>AllFeatureCourse= snapshot.data ?? [];
                   return    Expanded(
                    flex: 2,
                    child: ListView.separated(
                        itemBuilder:  (context, index) => FeaturedCoursesWidget(featuredCourse:AllFeatureCourse[index] ),
                        separatorBuilder: (context, index) => Container(width: 10,),
                        itemCount:  AllFeatureCourse.length,
                        scrollDirection: Axis.horizontal),
                  );
                },
            ),


SizedBox(height: 18),
           Expanded(flex: 0,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Best Selling Courses",style: Theme.of(context).textTheme.bodyMedium,),
                 Text("view All",style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500,decoration: TextDecoration.underline,
                   decorationColor: Colors.black, // Color of the underline
                   decorationStyle: TextDecorationStyle.solid, // Optional: Can be dashed, dotted, double, wavy
                   decorationThickness: 2, ),),
               ],
             ),
           ),
            StreamBuilder(
              stream:FireStoreHelper.ListenToBestCourses() ,

              builder: (context, snapshot) {
                List<BestSellingCourses>AllBestCourses=snapshot.data??[];
                return Expanded(
                  flex: 2,
                  child: ListView.separated
                    (
                      itemBuilder:  (context, index) => BestSellingWidget(bestCourse:AllBestCourses[index] ),
                      separatorBuilder: (context, index) => Container(
                        height: 25,
                      ),
                      itemCount: AllBestCourses.length),
                );
              },
            )
          ],
        ),
      ),

    );
  }
}
