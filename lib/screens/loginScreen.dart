import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/controller/auth_controller.dart'; // Adjust path if needed

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController authController = Get.put(AuthController());
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Local state just for the password visibility toggle (keeps the AuthController clean)
  final RxBool isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    // Premium Dark Theme Constants
    const backgroundColor = Color(0xFF0F0F0F); 
    const surfaceColor = Color(0xFF272727);     
    const accentColor = Color(0xFFFF0000);      
    const textSecondary = Color(0xFFAAAAAA);

    // Reusable Input Decoration for clean code
    InputDecoration buildInputDecoration({required String hint, required IconData icon}) {
      return InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: textSecondary),
        prefixIcon: Icon(icon, color: textSecondary, size: 22),
        filled: true,
        fillColor: surfaceColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          // ConstrainedBox ensures the UI doesn't stretch massively on tablets or desktop
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              // Smooth Slide & Fade In Animation on Load
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 40 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ==========================================
                    // BRANDING HEADER
                    // ==========================================
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_circle_filled, size: 48, color: accentColor),
                        SizedBox(width: 12),
                        Text(
                          "YouTube",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Typography: Headings
                    const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Continue to access your account.",
                      style: TextStyle(color: textSecondary, fontSize: 16),
                    ),
                    const SizedBox(height: 32),

                    // ==========================================
                    // INPUT FIELDS
                    // ==========================================
                    TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: buildInputDecoration(
                        hint: "Email address", 
                        icon: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Obx(() => TextField(
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      obscureText: !isPasswordVisible.value,
                      decoration: buildInputDecoration(
                        hint: "Password", 
                        icon: Icons.lock_outline,
                      ).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                            color: textSecondary,
                            size: 20,
                          ),
                          onPressed: () => isPasswordVisible.toggle(),
                        ),
                      ),
                    )),
                    
                    // Forgot Password Link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Add forgot password routing
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        ),
                        child: const Text("Forgot Password?"),
                      ),
                    ),

                    // ==========================================
                    // ERROR DISPLAY & BUTTONS
                    // ==========================================
                    Obx(() {
                      if (authController.errorMessage.value.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              const Icon(Icons.error, color: accentColor, size: 18),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  authController.errorMessage.value,
                                  style: const TextStyle(color: accentColor, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }),

                    Obx(() {
                      if (authController.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Primary Sign In Button (Pill Shape)
                          ElevatedButton(
                            onPressed: () {
                              authController.loginWithEmail(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              elevation: 0,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Secondary Create Account Button
                          OutlinedButton(
                            onPressed: () {
                              authController.registerWithEmail(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(color: surfaceColor, width: 2),
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                              "Create Account",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    }),
                    
                    const SizedBox(height: 32),

                    // ==========================================
                    // SOCIAL LOGIN DIVIDER
                    // ==========================================
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade800, thickness: 1)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("OR", style: TextStyle(color: textSecondary, fontWeight: FontWeight.bold)),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade800, thickness: 1)),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Google Sign-In Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Connect Google Sign-In logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: surfaceColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      // Standard Material G icon placeholder
                      icon: const Icon(Icons.g_mobiledata, size: 28),
                      label: const Text(
                        "Continue with Google",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    
                    const SizedBox(height: 48),

                    // ==========================================
                    // FOOTER
                    // ==========================================
                    const Text(
                      "By continuing, you agree to the Terms of Service\nand Privacy Policy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}