
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:minimal_login_sign_up/views/login_screen.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Icon(
                Icons.android_outlined,
                color: Colors.pinkAccent,
                size: 150,
              ),

              const Text(
                "Register",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Your Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: "Please Enter Your Email",
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Please Enter Password",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: (){
                    Register(emailController.text.toString(),passwordController.text.toString());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),color: Colors.pinkAccent
                    ),
                    padding: const EdgeInsets.all(15),
                    child: const Center(
                      child: Text("Register",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const Text("Already have a Account?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                  },child: const Text("Login!",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blueAccent,fontSize: 16),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void Register(String email , String password) async{
  try{
    Response response= await post(Uri.parse("https://reqres.in/api/register"),body: {
      'email':email,
      'password':password
    });

    if(response==200){
      print(" Register successfully");
    }
    else{
      print('Registeration Failed');
    }
  }
  catch(e){
    print(e.toString());
  }
}
