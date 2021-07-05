import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth2/provider/google_sign_in.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          if (user!.photoURL != null)
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(user.photoURL.toString()),
            ),
          SizedBox(height: 8),
          if (user.displayName != null)
            Text(
              'Name: ' + user.displayName.toString(),
              style: TextStyle(color: Colors.white),
            ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email.toString(),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}
