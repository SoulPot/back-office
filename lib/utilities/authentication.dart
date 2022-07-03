import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:soulpot_manager/views/HomeView.dart';

import 'firestore.dart';


class Authentication {

  static final FirebaseAuth auth = FirebaseAuth.instanceFor(app: Firebase.apps.first);

  static Future<User?> signInWithPwd( BuildContext context, String email, String password) async {
    User? user;
    try {
      UserCredential userCredential =
      await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user!;
      print(auth.currentUser);
      if(await FirestoreManager.checkIfUserIsAdmin(user.uid)) {
        user.reload();
        enterApp(context);
      }
      return user;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  static void enterApp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageTransition(
          alignment: Alignment.bottomCenter,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 600),
          reverseDuration: Duration(milliseconds: 600),
          type: PageTransitionType.fade,
          child: HomeView(selectedIndex: 0,),
          childCurrent: context.widget),
    );
  }
}

