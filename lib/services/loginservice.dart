import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marketonline/models/loginusermodel.dart';

class LoginService {
  LoginService() {
    Firebase.initializeApp();
  }

  LoginUserModel? _userModel;

  LoginUserModel? get loggedInUserModel => _userModel;

  Future<bool> signWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return false;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    ) as GoogleAuthCredential;

    UserCredential userCreds =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCreds != null) {
      _userModel = LoginUserModel(
        displayName: userCreds.user!.displayName,
        photoUrl: userCreds.user!.photoURL,
        email: userCreds.user!.email,
      );
    }
    return true;
  }

  void signOut() async {
    await GoogleSignIn().signOut();
    _userModel = null;
  }

  signInWithGoogle() {}
}
