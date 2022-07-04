import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import '../views/home_view.dart';
import 'firestore.dart';


class Authentication {

  static final FirebaseAuth auth = FirebaseAuth.instanceFor(app: Firebase.apps.first);

  static Future<User?> signInWithPwd( BuildContext context, String email, String password) async {
    User? user;
    try {
      UserCredential userCredential =
      await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user!;
      if(await FirestoreManager.checkIfUserIsAdmin(user.uid)) {
        user.reload();
        enterApp(context);
      }
      return user;
    } on FirebaseAuthException catch (_) {
      return null;
    }
  }

  static void enterApp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageTransition(
          alignment: Alignment.bottomCenter,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 600),
          reverseDuration: const Duration(milliseconds: 600),
          type: PageTransitionType.fade,
          child: const HomeView(selectedIndex: 0),
          childCurrent: context.widget),
    );
  }
}

