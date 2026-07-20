import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:youtube/screens/mainNavigationScreen.dart';
// 🚨 IMPORTANT: Tell your students to import their actual screen here!
// import 'package:youtube/screens/main_navigation_screen.dart'; 

class AuthController extends GetxController {
  // Grab the Firebase Auth tool
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // We use this to show the spinning circle while waiting for the internet
  var isLoading = false.obs;
  
  // This holds the red error text to show on the screen
  var errorMessage = "".obs; 

  // ==========================================
  // REGISTER A NEW ACCOUNT
  // ==========================================
  Future<void> registerWithEmail(String email, String password) async {
    // Check if the user forgot to type something
    if (!_validateInputs(email, password)) return;

    try {
      isLoading.value = true;   // Start the spinner
      errorMessage.value = "";  // Clear any old error messages

      // 1. Tell Google/Firebase to make the account
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      // 2. SUCCESS! If we reach this line, Firebase didn't crash.
      // Let's navigate to the main screen. 
      // We use Get.offAll() so it deletes the Login Screen from history. 
      // This stops the user from hitting the Android 'Back' button and going back to the login page!
      Get.offAll(() => const MainNavigationScreen());

    } on FirebaseAuthException catch (e) {
      // If Firebase complains (like "password is too weak"), catch the error and show it
      errorMessage.value = e.message ?? "Oops! Something went wrong.";
    } finally {
      isLoading.value = false;  // Stop the spinner no matter what happens
    }
  }

  // ==========================================
  // LOGIN AN EXISTING USER
  // ==========================================
  Future<void> loginWithEmail(String email, String password) async {
    // Check if the user forgot to type something
    if (!_validateInputs(email, password)) return;

    try {
      isLoading.value = true;   // Start the spinner
      errorMessage.value = "";  // Clear any old error messages

      // 1. Tell Google/Firebase to log us in
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // 2. SUCCESS! Let's go to the home page!
      Get.offAll(() => const MainNavigationScreen());

    } on FirebaseAuthException catch (e) {
      // If they type the wrong password, catch the error and show it
      errorMessage.value = e.message ?? "Wrong email or password, bro.";
    } finally {
      isLoading.value = false;  // Stop the spinner
    }
  }

  // ==========================================
  // HELPER: CHECK FOR EMPTY BOXES
  // ==========================================
  bool _validateInputs(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      errorMessage.value = "Hey! You forgot to type your email or password!";
      return false;
    }
    return true; // Everything looks good
  }
}