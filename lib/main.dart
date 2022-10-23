import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:installment_demo/providers/addNewSell_Provider.dart';
import 'package:installment_demo/providers/current_user.dart';
import 'package:installment_demo/providers/cust_provider.dart';
import 'package:installment_demo/providers/dropDownProvider.dart';
import 'package:installment_demo/providers/imagePicker.dart';
import 'package:installment_demo/screens/Home.dart';
import 'package:installment_demo/screens/Login_screen.dart';
import 'package:installment_demo/screens/Signup_screen.dart';
import 'package:installment_demo/screens/allInstallments.dart';
import 'package:installment_demo/screens/root.dart';
import 'package:installment_demo/services/customerServices.dart';
import 'package:installment_demo/services/sellServices.dart';
import './providers/current_user.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final custFireStoreService=custServices();
    final allInstallmentServices=SellServices();
    return MultiProvider(
      providers: [
        Provider<currentUserState>(create: (context)=>currentUserState()),
        ChangeNotifierProvider<imagePicker_Provider>(create: (context)=>imagePicker_Provider()),
        ChangeNotifierProvider<dropDownProvider>(create: (context)=>dropDownProvider()),
        ChangeNotifierProvider<custProvider>(create: (context)=>custProvider()),
        StreamProvider(create: (context)=>custFireStoreService.getCustomers()),
        StreamProvider(create: (context)=>allInstallmentServices.getAllSellers()),
        ChangeNotifierProvider<AddNewSell>(create: (context)=>AddNewSell()),
      ],
      child: MaterialApp(
          initialRoute:rootScreen.route_name,
        routes:
        {
          Login_screen.route_name:(context)=>Login_screen(),
          signup_screen.route_name:(context)=>signup_screen(),
          home.route_name:(context)=>home(),
        },
          debugShowCheckedModeBanner: false,
          home: Login_screen(),
      ),
    );
  }
}


// ChangeNotifierProvider<currentUserState>(
// create: (_)=>currentUserState(),