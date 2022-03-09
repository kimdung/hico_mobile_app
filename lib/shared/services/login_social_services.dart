import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginSocialServices {
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? _verificationIdController;

  /// VerifyPhoneNumber Using Firebase Auth
  Future<void> verifyPhoneNumber({
    @required String? phone,
    Function? onCodeSent,
    Function(FirebaseAuthException)? onVerificationFailed,
    Function(PhoneAuthCredential)? onVerificationCompleted,
  }) async {
    await _firebaseAuth.setLanguageCode("vi");
    return await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$phone',
      timeout: Duration(seconds: 90),
      verificationCompleted: (PhoneAuthCredential credential) {
        onVerificationCompleted?.call(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        onVerificationFailed?.call(e);
      },
      codeSent: (String? verificationId, int? resendToken) {
        this._verificationIdController = verificationId;
        onCodeSent?.call();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this._verificationIdController = verificationId;
      },
    );
  }

  /// OTP Phone Authentication
  Future<UserCredential> authenPhoneCode({required String opt}) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: this._verificationIdController!,
      smsCode: opt,
    );
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    return userCredential;
  }

  /// LogOut Firebase User
  Future<void> logOutFirebaseUser() async {
    await _firebaseAuth.signOut();
  }

  /// Login With Apple Account
  // Future<AuthorizationCredentialAppleID> loginWithApple() {
  //   return SignInWithApple.getAppleIDCredential(
  //     scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ],
  //   );
  // }

  /// Login With Facebook Account
  Future<LoginResult> loginWithFacebook() async {
    return await _facebookAuth.login();
  }

  /// LogOut With Facebook Account
  // Future<void> logOutWithFacebook() async {
  //   final AccessToken accessToken = await _facebookAuth.accessToken;
  //   if (accessToken != null) {
  //     await _facebookAuth.logOut();
  //   }
  // }

  /// Login With Google Account
  Future<GoogleSignInAuthentication> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    return googleAuth;
  }

  /// Logout Google Account
  Future<void> logOutGoogle() async {
    final bool rs = await _googleSignIn.isSignedIn();
    if (rs) {
      await _googleSignIn.signOut();
    }
  }
}
