import 'package:flutter/material.dart';
import 'package:shopping_app/views/products_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hiddenpass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? errorMessage;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "SignUp Page",
          style: TextStyle(
              fontSize: 25,
              color: Color(0xFF954535),
              fontWeight: FontWeight.w200),
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 120,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Full Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    errorMessage = "Name cannot be empty !";
                    return "Name cannot be empty !";
                  }
                  if (value[0] != value[0].toUpperCase()) {
                    errorMessage = "The first letter must be capital !";
                    return "The first letter must be capital !";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    errorMessage = "Email cannot be empty !";

                    return "Email cannot be empty !";
                  }
                  if (!value.contains('@')) {
                    errorMessage = "Email must contain '@' ";

                    return "Email must contain '@' ";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passController,
                obscureText: hiddenpass,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    errorMessage = "Password must be more than 6 characters !";

                    return "Password must be more than 6 characters !";
                  }
                },
                decoration: InputDecoration(
                    labelText: "password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        togglePassword();
                      },
                      icon: Icon(
                          hiddenpass ? Icons.visibility : Icons.visibility_off),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: confirmPassController,
                obscureText: hiddenpass,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    errorMessage = "Please confirm your password!";

                    return "Please confirm your password!";
                  }
                  if (value != passController.text) {
                    errorMessage = "Passwords do not match!";

                    return "Passwords do not match!";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                    onPressed: togglePassword,
                    icon: Icon(
                      hiddenpass ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      debugPrint(emailController.text);
                      debugPrint(passController.text);
                      if (_formKey.currentState!.validate()) {
                        showSuccessDialog(context);
                      } else {
                        SnackBar snakbar = SnackBar(
                          content: Text("$errorMessage"),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF954535),
                    ),
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  togglePassword() {
    hiddenpass = !hiddenpass;
    setState(() {});
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: const Text(
            "Done",
            style: TextStyle(
              color: Color.fromARGB(255, 47, 200, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text("Your account created successfully "),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate to MyProductPage and close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyProductCard()),
                );
              },
              child: const Text(
                "Close",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
