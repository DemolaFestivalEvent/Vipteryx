import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
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
              // TODO: Navigate to profile editing page
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () {
              // TODO
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              // TODO: Logout logic
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
