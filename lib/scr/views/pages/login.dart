import 'package:flutter/material.dart';
import 'signup.dart';
import 'contact_schedule.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text('ログイン'),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 200,),
            const TextField(
              decoration: InputDecoration(
                label: Text('名前')
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text('メールアドレス')
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text('パスワード')
              ),
            ),
            const SizedBox(height: 50,),
            TextButton(
              child:const Text('確認', style: TextStyle(color: Colors.blue, fontSize: 18)),
              onPressed:() {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SchedulePage()), (Route<dynamic> route) => false,);
              },
            ),
            TextButton(
              child:const Text('アカウントをお持ちでない方はこちら', style: TextStyle(color: Colors.blue)),
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
              },
            )
          ]
        ),
      ),
    );
  }
}