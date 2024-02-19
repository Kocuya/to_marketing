import 'package:flutter/material.dart';
import 'login.dart';
import 'contact_schedule.dart';
import 'debug_page.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<SignupPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text('サインイン'),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 180,),
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
            const TextField(
              decoration: InputDecoration(
                label: Text('確認パスワード')
              ),
            ),
            const SizedBox(height: 50,),
            TextButton(
              child:const Text('確認', style: TextStyle(color: Colors.blue, fontSize: 18)),
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SchedulePage()));
              },    
            ),
            TextButton(
              child:const Text('利用規約', style: TextStyle(color: Colors.blue, fontSize: 18)),
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DebugPage()));
              },    
            ),
            TextButton(
              child:const Text('アカウントをお持ちの方はこちら', style: TextStyle(color: Colors.blue)),
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            )
          ]
        ),
      ),
    );
  }
}