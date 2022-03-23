import 'package:authstate/firebaseauth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: TextButton(
          onPressed: ()  {
             context.read<AuthProvider>().signOut(context);
            
          },
          child: const Text("Sign out"),
        ),
      ),
    );
  }
}
