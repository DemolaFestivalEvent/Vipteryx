import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class edit_profile_page extends StatefulWidget {
  const edit_profile_page({super.key});

  @override
  State<edit_profile_page> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<edit_profile_page> {
  bool showUsernameChange = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? usernameError;
  String? passwordError;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitUsername() {
    final newUsername = _usernameController.text.trim();
    setState(() {
      if (newUsername.isEmpty) {
        usernameError = 'Username cannot be empty';
      } else {
        usernameError = null;
        // TODO: Save new username logic here
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username changed to: $newUsername')),
        );
        _usernameController.clear();
      }
    });
  }

  void _showUsernameDialog() {
    usernameError = null;
    _usernameController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Username'),
          content: StatefulBuilder(
            builder: (context, setStateDialog) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'New Username',
                      errorText: usernameError,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (_) {
                      setStateDialog(() {
                        usernameError = null;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  usernameError = null;
                });
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {}); // To update error state
                _submitUsername();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _submitPassword() {
    final newPassword = _passwordController.text;
    setState(() {
      if (newPassword.isEmpty) {
        passwordError = 'Password cannot be empty';
      } else if (newPassword.length < 6) {
        passwordError = 'Password must be at least 6 characters';
      } else {
        passwordError = null;
        // TODO: Save new password logic here
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password changed successfully')),
        );
        _passwordController.clear();
      }
    });
  }

  void _showPasswordDialog() {
    passwordError = null;
    _passwordController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: StatefulBuilder(
            builder: (context, setStateDialog) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      errorText: passwordError,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (_) {
                      setStateDialog(() {
                        passwordError = null;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  passwordError = null;
                });
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {}); // To update error state
                _submitPassword();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: ListView(
        children: [
          const Center(
            child: Text('Edit Profile Page', style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Change Username'),
            onTap: _showUsernameDialog,
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: _showPasswordDialog,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              // TODO: Logout logic
            },
          ),
        ],
      ),
    );
  }
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool locationSharing = true;
  ThemeMode themeMode = ThemeMode.system;
  String selectedLanguage = 'Suomi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Account',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const edit_profile_page()),
              );
              // TODO: Navigate to profile editing page
            },
          ),
          
          

          const Divider(),

          const ListTile(
            title: Text('Notifications',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text('Push Notifications'),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() => notificationsEnabled = value);
            },
          ),

          const Divider(),

          const ListTile(
            title: Text('Privacy & Location',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.location_on),
            title: const Text('Share Location'),
            value: locationSharing,
            onChanged: (value) {
              setState(() => locationSharing = value);
            },
          ),

          const Divider(),

          const ListTile(
            title:
                Text('Ulkoasu', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Theme'),
            trailing: DropdownButton<ThemeMode>(
              value: themeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('Automatic'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => themeMode = value);
                }
              },
            ),
          ),

          const Divider(),

          const ListTile(
            title:
                Text('Language & Payments', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              items: const [
                DropdownMenuItem(value: 'English', child: Text('English')),
                DropdownMenuItem(value: 'Suomi', child: Text('Suomi')),
                
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedLanguage = value);
                }
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Payment Methods'),
            onTap: () {
              // TODO: Navigoi maksutietoihin
            },
          ),

          const Divider(),

          const ListTile(
            title: Text('About & Support',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Privacy Policy & Terms of Service'),
            onTap: () {
              // TODO
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Contact / Feedback'),
            onTap: () {
              // TODO
            },
          ),
        ],
      ),
    );
  }
}
