import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/view/first/otpScreen.dart';

class FirebaseService{
  //authenticatation instance create
  FirebaseAuth auth=FirebaseAuth.instance;
  Future<User?>signupWithEmailAndPassword(String email,String password)async{
 try{
  UserCredential credential=await auth.createUserWithEmailAndPassword(email: email, password: password);
  return credential.user;
 }on FirebaseAuthException catch(e){
  if(e.code =='email-already-in-use'){
    print("the email already in use");
  }
  else{
    print("an error occured:${e.code}");
  }
 }
 return null;
  }


  Future<User?>signinWithEmailAndPassword(String email,String password)async{
 try{
  UserCredential credential=await auth.signInWithEmailAndPassword(email: email, password: password);
  return credential.user;
 }on FirebaseAuthException catch(e){
  if(e.code =='user-not-found' || e.code=='wrong-password'){
    print("invalid email and password");
  }
  else{
    print("an error occured:${e.code}");
  }
 }
 return null;
  }


  Future<User?>forgetPassword(email)async{
try{
   await auth.sendPasswordResetEmail(email: email);
}
on FirebaseAuthException catch(e){
  print(e);
}
  }

  Future<void>sendOtp(phoneNumber,context)async{
    try{
      auth.verifyPhoneNumber(
        phoneNumber:phoneNumber ,
        verificationCompleted: (PhoneAuthCredential credential) {
          
        }, 
      verificationFailed: (FirebaseException e){
        print(e.code);

      }, 
      codeSent: (String vid, int? token,){
        Navigator.push(context, MaterialPageRoute(builder: ((context) => OtpScreen())));
      }, 
      codeAutoRetrievalTimeout: (String vid){});
    }
    on FirebaseAuthException catch(e){
      print("$e.error occured");

    }

  }
}