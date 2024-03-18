import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_firebase/home/home_screen.dart';
import 'package:task_firebase/register/Register.dart';
import 'package:task_firebase/resuable_component/Dialog.dart';

import '../style/theme.dart';
import '../provider/theme_provider.dart';
import '../resuable_component/constant.dart';

class LoginScreen extends StatefulWidget {
static String routeName="LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final formkey=GlobalKey<FormState>();

TextEditingController emailController=TextEditingController();

TextEditingController PasswordController=TextEditingController();

bool isObsecure=true;
bool isDot=true;
  @override
  Widget build(BuildContext context) {
    themeProvider provider=Provider.of<themeProvider>(context);

    return   Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
       backgroundColor: provider.theme==ThemeMode.light?Colors.white:Colors.black,

      ),
      ),
      body: Container(
        height: double.infinity,
        color:        provider.theme==ThemeMode.light?Colors.white:Colors.black,

        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Route",style: Theme.of(context).textTheme.titleLarge,),
              IconButton(
                onPressed:  (){
                  isDot=!isDot;
                  provider.changeTheme(isDot==false?ThemeMode.dark:ThemeMode.light );
                },

                icon:  provider.theme==ThemeMode.light? Icon(Icons.dark_mode,color: Theme.of(context).colorScheme.secondary,):
                Icon(Icons.light_mode_rounded,color: Theme.of(context).colorScheme.secondary,),
              ),
                    ],
                  ),
                  SizedBox(height:70,),
                  Text('Hi,Welcome Back!,',style: Theme.of(context).textTheme.labelMedium,),
                  Text('Hello again, you’ve been missed!,',style: Theme.of(context).textTheme.labelSmall),
                  SizedBox(height: 20,),
                  Text("Email",style:Theme.of(context).textTheme.bodyMedium ,),

                  TextFormField(
                    cursorColor: Theme.of(context).colorScheme.onPrimary,
                    controller: emailController ,style: TextStyle( color: Theme.of(context).colorScheme.onPrimary) ,
                    keyboardType: TextInputType.emailAddress,
                     validator:(value){
                      if(value==null||value.isEmpty){
                        return 'this feild cant be empty';
                      }
                      //de 3obara 3n function btbd2 tt2kd en al value mktob bnfs seght al variable da btrg3 true or false
                      if(!RegExp(Constant.emailRegex).hasMatch(value)) {
                        return "Enter valid Email";
                      }
                      return null; //law 3ada kol dol al validate tkon b null
                    } ,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          hintText: "Please Enter Your Email",

                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(8),
                         borderSide: BorderSide(
                             color: Theme.of(context).colorScheme.onPrimary
                         ),
                       ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onPrimary
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                  ),
                  SizedBox(height: 20,),
                  Text("Password",style:Theme.of(context).textTheme.bodyMedium,),
                  TextFormField(
                    cursorColor: Theme.of(context).colorScheme.onPrimary,

                    obscureText: isObsecure,
                    controller: PasswordController  ,style: TextStyle( color: Theme.of(context).colorScheme.onPrimary),
                    keyboardType: TextInputType.visiblePassword,
                    validator:(value){
                      if(value==null||value.isEmpty){
                        return 'this feild cant be empty';
                      }
                     if(value.length< 7){
                       return'Password should be at least 8 character';
                     }

                      return null;
                    } ,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isObsecure=!isObsecure;
                          });

                        },
                        icon:  Icon(
                          color: Theme.of(context).colorScheme.onPrimary,
                            isObsecure?Icons.visibility_off:Icons.visibility
                        ),
                      ),
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),

                      hintText: "Please Enter Your Password",

                      border: OutlineInputBorder(

                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onPrimary
                          ),
                        borderRadius: BorderRadius.circular(8)
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 45,),
                  ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onSecondary
                      ),
                      onPressed:  (){
                        login();

                      },
                      child:  Text("Login")),
                  SizedBox(height: 45,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account ? ",style: Theme.of(context).textTheme.labelSmall,),//labelSmall
                      SizedBox(width: 15,),
                      InkWell
                        (
                        onTap: (){

                          Navigator.pushNamedAndRemoveUntil(context, RegisterScreen.routeName, (route) => false);
                        },
                          child: Text('Sign Up',style: AppTheme.lighttheme.textTheme.bodyMedium,)),

                    ],
                  ),
                      

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void login() async {
   if(formkey.currentState?.validate() ??false){
     DialogUtils.showLoadingDialog(context);
     try {
       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailController.text,
         password: PasswordController.text,
       );
       DialogUtils.hideDialog(context);
       Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);

     } on FirebaseAuthException catch (e) {
       DialogUtils.hideDialog(context);
       if (e.code == 'user-not-found') {
         DialogUtils.showMessage(context: context, message: "Enter the correct Email",postiveText: "Ok",postivePress: (){Navigator.pop(context);});
         print('No user found for that email.');
       } else if (e.code == 'wrong-password') {
         DialogUtils.showMessage( context: context, message: "Enter the correct Password",postiveText: "Ok",postivePress: (){Navigator.pop(context);});
         print('Wrong password provided for that user.');
       }
       return;
     }
   }
  }
}
