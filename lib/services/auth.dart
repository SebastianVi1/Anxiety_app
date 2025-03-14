import 'package:anxiety_app/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService {
  



  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
     
  }

  Future<void> signup({
    
    required String email,
    required String password,
    required BuildContext context
    
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
        
        );
      
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen()
          )
        );

      
    }on FirebaseAuthException catch(e){
    
      String message = '';

      if (e.code=='weak-password'){
        message = 'La contrasenia es debil.';
      }
      else if (e.code == 'email-alredy-in-use'){
        message = 'Ya hay una cuenta con ese email';
      }
      else{
        message = e.code;
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }catch(e){
      

    }
  }


  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
        );


      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen()
          )
        );
    

    }on FirebaseAuthException catch(e){
    
      String message = '';

      if (e.code=='user-not-found'){
        message = 'No se encontro ningun usuario con este correo.';
      }
      else if (e.code == 'wrong-password'){
        message = 'Contrasenia incorrecta';
      }
      else if (email.isEmpty || password.isEmpty){
        message = 'Llena bien los campos';
      }
      else if (e.code == 'too-many-requests'){
        message = 'Intentalo de nuevo en unos minutos';
      }
      else {
        message = e.code;
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        
        
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }catch(e){
      

    }
    
  }
}