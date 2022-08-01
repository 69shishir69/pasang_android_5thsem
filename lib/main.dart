


import 'package:flutter/material.dart';
import 'package:nailroom/screen/bottomnav.dart';
import 'package:nailroom/screen/login.dart';
import 'package:nailroom/screen/product.dart';

import 'package:nailroom/screen/register.dart';
import 'package:nailroom/screen/wearos.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      
     '/': (context) => const LoginScreen(),

      '/register':(context) => const RegisterScreen(),
      '/dashboard':(context) => const ProductScreen(),
      '/wearos': (context) => const WearSmartWatch(),
      '/bottomnav':(context)=> const BottomNav(),
      // '/profile':(context)=> const Profile(),
       },
  ));
}