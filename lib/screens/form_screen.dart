import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // GlobalKey for Form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingControllers for form fields
  final TextEditingController _fullNameController = TextEditingController(text: 'Vijay Karthik');
  final TextEditingController _emailController = TextEditingController(text: 'vijaykarthiktk@gmail.com');
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  // State variables for form interactions
  bool _obscurePassword = true;
  bool _agreeToTerms = false;
  Map<String, String>? _submittedData;

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  // Form submission handler
  void _submitForm() {
    // Trigger validation on all Form fields
    if (_formKey.currentState!.validate()) {
      if (!_agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.white),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Please agree to the terms & conditions.',
                    style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            backgroundColor: const Color(0xFFD97706),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
        return;
      }

      // Collect validated data
      setState(() {
        _submittedData = {
          'Name': _fullNameController.text.trim(),
          'Email': _emailController.text.trim(),
          'Phone': _phoneController.text.trim(),
          'Bio': _bioController.text.trim(),
        };
      });

      // Show comprehensive success SnackBar
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Form Validated & Submitted!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Welcome, ${_fullNameController.text.trim()}!',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF059669),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 4),
          action: SnackBarAction(
            label: 'DISMISS',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    } else {
      // Validation error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.error_outline_rounded, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Please correct the errors in the form before submitting.',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFFDC2626),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  // Clean form reset handler
  void _resetForm() {
    _formKey.currentState?.reset();
    _fullNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
    _bioController.clear();

    setState(() {
      _agreeToTerms = false;
      _submittedData = null;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.refresh_rounded, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Form has been reset successfully.',
                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF475569),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // Custom InputDecoration generator
  InputDecoration _buildInputDecoration({
    required String labelText,
    required String hintText,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      labelStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: Color(0xFF64748B),
        fontWeight: FontWeight.w500,
      ),
      hintStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 13,
        color: Colors.grey.shade400,
      ),
      prefixIcon: Icon(prefixIcon, color: const Color(0xFF4F46E5), size: 22),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF4F46E5), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFDC2626), width: 2),
      ),
      errorStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFFDC2626),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'User Input & Form Validation',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E293B),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFE2E8F0), height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Info Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF6366F1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4F46E5).withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const CircleAvatar(
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vijay Karthik T K',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'vijaykarthiktk@gmail.com',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Main Form Container
            Card(
              elevation: 2,
              shadowColor: Colors.black.withValues(alpha: 0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Field 1: Full Name
                      TextFormField(
                        controller: _fullNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: _buildInputDecoration(
                          labelText: 'Full Name',
                          hintText: 'e.g. Alex Johnson',
                          prefixIcon: Icons.person_outline_rounded,
                          suffixIcon: _fullNameController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear, size: 18),
                                  onPressed: () {
                                    setState(() {
                                      _fullNameController.clear();
                                    });
                                  },
                                )
                              : null,
                        ),
                        onChanged: (val) => setState(() {}),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your full name';
                          }
                          if (value.trim().length < 3) {
                            return 'Name must be at least 3 characters long';
                          }
                          if (!RegExp(r"^[a-zA-Z\s\.\'-]+$").hasMatch(value.trim())) {
                            return 'Name can only contain alphabets and spaces';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // Field 2: Email Address
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: _buildInputDecoration(
                          labelText: 'Email Address',
                          hintText: 'vijaykarthiktk@gmail.com',
                          prefixIcon: Icons.mail_outline_rounded,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email address is required';
                          }
                          final emailRegex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          );
                          if (!emailRegex.hasMatch(value.trim())) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // Field 3: Phone Number
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: _buildInputDecoration(
                          labelText: 'Phone Number',
                          hintText: '10-digit mobile number',
                          prefixIcon: Icons.phone_outlined,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Phone number is required';
                          }
                          final cleanPhone = value.replaceAll(RegExp(r'\D'), '');
                          if (cleanPhone.length != 10) {
                            return 'Enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // Field 4: Password
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        decoration: _buildInputDecoration(
                          labelText: 'Password',
                          hintText: 'Min. 6 chars with 1 number',
                          prefixIcon: Icons.lock_outline_rounded,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFF64748B),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password must contain at least one digit';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // Field 5: Bio / Query
                      TextFormField(
                        controller: _bioController,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        decoration: _buildInputDecoration(
                          labelText: 'Short Bio / Inquiry',
                          hintText: 'Tell us a bit about yourself or inquiry...',
                          prefixIcon: Icons.edit_note_rounded,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please provide a brief bio or inquiry';
                          }
                          if (value.trim().length < 10) {
                            return 'Bio must be at least 10 characters long';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Terms & Conditions Checkbox
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        value: _agreeToTerms,
                        activeColor: const Color(0xFF4F46E5),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'I accept the terms, privacy policy and conditions',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: Color(0xFF475569),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _agreeToTerms = val ?? false;
                          });
                        },
                      ),

                      const SizedBox(height: 20),

                      // Action Buttons Row: Submit & Reset
                      Row(
                        children: [
                          // Reset Button
                          Expanded(
                            flex: 1,
                            child: OutlinedButton.icon(
                              onPressed: _resetForm,
                              icon: const Icon(Icons.restart_alt_rounded, size: 20),
                              label: const Text(
                                'Reset',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                foregroundColor: const Color(0xFF64748B),
                                side: const BorderSide(color: Color(0xFFCBD5E1), width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 14),

                          // Submit Button
                          Expanded(
                            flex: 2,
                            child: ElevatedButton.icon(
                              onPressed: _submitForm,
                              icon: const Icon(Icons.send_rounded, size: 20),
                              label: const Text(
                                'Submit Form',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: const Color(0xFF4F46E5),
                                foregroundColor: Colors.white,
                                elevation: 3,
                                shadowColor: const Color(0xFF4F46E5).withValues(alpha: 0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Submitted Data Card (shows upon successful submission)
            if (_submittedData != null) ...[
              const SizedBox(height: 24),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: Color(0xFF10B981), width: 1.5),
                ),
                color: const Color(0xFFECFDF5),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.verified_user_rounded, color: Color(0xFF059669), size: 24),
                          SizedBox(width: 10),
                          Text(
                            'Submitted Form Data',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF065F46),
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Color(0xFFA7F3D0), height: 24),
                      ..._submittedData!.entries.map(
                        (entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 75,
                                child: Text(
                                  '${entry.key}:',
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Color(0xFF047857),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  entry.value,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
