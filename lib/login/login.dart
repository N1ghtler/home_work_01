import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 50.0),
            Container(
              alignment: Alignment.center,
              child: Text(
                "LOGIN FORM",
                style: GoogleFonts.abel(color: Colors.blue, fontSize: 40),
              ),
            ),
            const SizedBox(height: 50.0),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              autofillHints: const [AutofillHints.email],
            ),
            // spacer
            const SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Clear'),
                  onPressed: () {
                    _emailController.clear();
                    _passwordController.clear();
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: Text(
                    "Forget Password?",
                    style: GoogleFonts.abel(color: Colors.blue),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const IconButton(
                    onPressed: null, icon: Icon(Icons.email_outlined))
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.abel(color: Colors.blue),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const IconButton(
                    onPressed: null, icon: Icon(Icons.person_off_outlined))
              ],
            )
          ],
        )),
        floatingActionButton: Container(
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.call_sharp,
              size: 40,
              color: Colors.blue,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            )));
  }
}
