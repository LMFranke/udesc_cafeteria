import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/provider/provider.dart';
import 'package:udesc_v2/storage/shared_preference.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isPasswordHide = true;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FocusNode focusNodePassword = FocusNode();

  // final MyDatabase db = MyDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Consumer<MyProvider>(
        builder: (context, provider, child) => Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  "assets/images/nike_logo.png",
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Login"),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                  controller: loginController,
                  validator: (value) {
                    if (loginController.text.isEmpty) {
                      return "Login field is empty";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: passwordController,
                  focusNode: focusNodePassword,
                  obscureText: _isPasswordHide,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordHide = !_isPasswordHide;
                        });
                      },
                      icon: _isPasswordHide
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (passwordController.text.isEmpty) {
                      return "Password field is empty";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      provider
                          .getPersonByEmailAndPassword(
                              loginController.text, passwordController.text)
                          .then(
                        (person) {
                          if (person != null) {
                            SaveSharedPreference().saveUser(
                              person.id,
                              person.name,
                              person.email,
                              person.password,
                            );
                            provider.getAdmByPersonId(person.id).then(
                              (adm) {
                                if (adm.isEmpty) {
                                  Navigator.pushNamed(context, "/homepage");
                                } else {
                                  Navigator.pushNamed(context, "/adm_page");
                                }
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Email or password is incorrect"),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                  onLongPress: () async {
                    await provider.getAllUsers().then(
                      (value) {
                        print(value);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Don't have an account yet? ",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup_page");
                      },
                      child: const Text("SignUp"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
