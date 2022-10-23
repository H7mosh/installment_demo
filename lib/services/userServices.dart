import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:installment_demo/module/userModel.dart';

class UserServices{
  final String uid;
  UserServices({this.uid});
  
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Future<bool>createUser(Users _user)async
  {
    bool retVal=false;
    try{
      await _firestore.collection('users').doc(_user.uid).set({
        'email':_user.Email,
        'fullname':_user.fullName,
        'validity':_user.Validity,
      });
      retVal=true;
    }catch(e)
    {
      print(e);
    }
    return retVal;
  }

}