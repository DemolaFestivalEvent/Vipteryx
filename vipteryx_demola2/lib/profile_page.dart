import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color background = const Color(0xFF181828);
    final Color cardColor = const Color(0xFF23233A);
    final Color iconColor = Colors.white70;
    final Color accent = Colors.redAccent;

    return Container(
      color: background,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          // Profile picture and name
          Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: cardColor,
                    child: Icon(Icons.person, size: 60, color: iconColor),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: accent,
                      child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Text(
                "Festival Goer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
          // Profile options
          _ProfileCard(
            color: cardColor,
            icon: Icons.person,
            text: "Personal Information",
            iconColor: iconColor,
            onTap: () => _showPersonalInfoSheet(context, cardColor, accent),
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.settings,
            text: "Preferences",
            iconColor: iconColor,
            onTap: () => _showPreferencesSheet(context, cardColor, accent),
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.bookmark_border,
            text: "Saved events",
            iconColor: iconColor,
            onTap: () => _showSavedEvents(context, cardColor, accent),
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.link,
            text: "Connected apps",
            iconColor: iconColor,
            onTap: () => _showConnectedAppsDialog(context, cardColor, accent),
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.confirmation_num_outlined,
            text: "My tickets",
            iconColor: iconColor,
            onTap: () => _showTicketsCarousel(context, cardColor, accent),
          ),
          _ProfileCard(
            color: cardColor,
            icon: Icons.settings_outlined,
            text: "Settings",
            iconColor: iconColor,
            onTap: () => _showSettingsLauncher(context, cardColor, accent),
          ),
          const SizedBox(height: 24),
          // Friends section
          Text(
            "Friends",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          _ProfileCard(
            color: cardColor,
            icon: Icons.people_outline,
            text: "Manage Friends",
            iconColor: iconColor,
            onTap: () => _showFriendManager(context, cardColor, accent),
          ),
        ],
      ),
    );
  }

  void _showPersonalInfoSheet(
    BuildContext context,
    Color cardColor,
    Color accent,
  ) {
    final messenger = ScaffoldMessenger.of(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return _BottomSheetContainer(
          cardColor: cardColor,
          accent: accent,
          title: 'Personal snapshot',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Update the vibe of your profile so friends know where to find you.',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white12,
                    child: Icon(Icons.person, color: Colors.white.withOpacity(.9), size: 40),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Festival Goer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Loves sunset sets & late-night electronica.',
                          style: TextStyle(color: Colors.white60),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(sheetContext);
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text('Shared your profile highlight reel!'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.share_outlined),
                      label: const Text('Share'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white24),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.pop(sheetContext);
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text('Profile mood board refreshed ✨'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.auto_awesome),
                      label: const Text('Remix avatar'),
                      style: FilledButton.styleFrom(
                        backgroundColor: accent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPreferencesSheet(
    BuildContext context,
    Color cardColor,
    Color accent,
  ) {
    final messenger = ScaffoldMessenger.of(context);
    bool notifications = true;
    bool darkMode = true;
    bool hapticFeedback = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return _BottomSheetContainer(
              cardColor: cardColor,
              accent: accent,
              title: 'Quick preferences',
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Festival notifications', style: TextStyle(color: Colors.white)),
                    subtitle: const Text('Personalized schedule alerts & lineup drops.', style: TextStyle(color: Colors.white54)),
                    value: notifications,
                    activeColor: accent,
                    onChanged: (value) => setState(() => notifications = value),
                  ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Neon night mode', style: TextStyle(color: Colors.white)),
                    subtitle: const Text('Keep the interface luminous after dark.', style: TextStyle(color: Colors.white54)),
                    value: darkMode,
                    activeColor: accent,
                    onChanged: (value) => setState(() => darkMode = value),
                  ),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Haptic bass boosts', style: TextStyle(color: Colors.white)),
                    subtitle: const Text('Feel the drop whenever your crew checks in.', style: TextStyle(color: Colors.white54)),
                    value: hapticFeedback,
                    activeColor: accent,
                    onChanged: (value) => setState(() => hapticFeedback = value),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {
                      Navigator.pop(sheetContext);
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text(
                            'Preferences tuned: ${notifications ? 'Alerts on' : 'Alerts muted'}, ${darkMode ? 'Night mode' : 'Daylight mode'}, ${hapticFeedback ? 'Bass bumps active' : 'Haptics off'}.',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.rocket_launch),
                    label: const Text('Amplify experience'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showSavedEvents(
    BuildContext context,
    Color cardColor,
    Color accent,
  ) {
    final events = [
      {
        'title': 'Sunset Serenade',
        'time': 'Today · 18:30',
        'stage': 'Aurora Stage',
      },
      {
        'title': 'Midnight Synthwave',
        'time': 'Tonight · 23:00',
        'stage': 'Nebula Dome',
      },
      {
        'title': 'Brunch & Beats',
        'time': 'Tomorrow · 11:00',
        'stage': 'Garden Terrace',
      },
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return _BottomSheetContainer(
          cardColor: cardColor,
          accent: accent,
          title: 'Saved line-up',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...events.map(
                (event) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: _SavedEventTile(
                    title: event['title']!,
                    subtitle: event['time']!,
                    stage: event['stage']!,
                    accent: accent,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.explore_outlined, color: Colors.white70),
                label: const Text('Discover more sets', style: TextStyle(color: Colors.white70)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showConnectedAppsDialog(
    BuildContext context,
    Color cardColor,
    Color accent,
  ) {
    final messenger = ScaffoldMessenger.of(context);
    bool spotify = true;
    bool instagram = false;
    bool appleMusic = false;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: cardColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.link, color: accent),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Connected apps',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          icon: const Icon(Icons.close, color: Colors.white54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Sync playlists and stories with your festival profile.',
                      style: TextStyle(color: Colors.white60),
                    ),
                    const SizedBox(height: 12),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: spotify,
                      onChanged: (value) => setState(() => spotify = value ?? false),
                      activeColor: accent,
                      title: const Text('Spotify', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Share what you are vibing to in real-time.', style: TextStyle(color: Colors.white54)),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: instagram,
                      onChanged: (value) => setState(() => instagram = value ?? false),
                      activeColor: accent,
                      title: const Text('Instagram Stories', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Auto-post your highlight clips.', style: TextStyle(color: Colors.white54)),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: appleMusic,
                      onChanged: (value) => setState(() => appleMusic = value ?? false),
                      activeColor: accent,
                      title: const Text('Apple Music', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Merge upcoming sets with your library.', style: TextStyle(color: Colors.white54)),
                    ),
                    const SizedBox(height: 8),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: accent,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        final activeConnections = [
                          if (spotify) 'Spotify',
                          if (instagram) 'IG Stories',
                          if (appleMusic) 'Apple Music',
                        ];
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(
                              activeConnections.isEmpty
                                  ? 'No new connections yet — keep exploring!'
                                  : 'Links updated: ${activeConnections.join(' • ')}',
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.sync),
                      label: const Text('Sync now'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showTicketsCarousel(
    BuildContext context,
    Color cardColor,
    Color accent,
  ) {
    final messenger = ScaffoldMessenger.of(context);
    final pageController = PageController();
    final tickets = [
      {
        'title': 'VIP Sunset Gala',
        'time': 'Jul 24 • 19:00',
        'seat': 'Sky Deck • Seat 12A',
      },
      {
        'title': 'Afterglow Lounge',
        'time': 'Jul 25 • 00:30',
        'seat': 'Neon Loft • Booth 5',
      },
      {
        'title': 'Wellness Wind-Down',
        'time': 'Jul 26 • 09:00',
        'seat': 'Zen Garden • Mat 3',
      },
    ];
    int currentPage = 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return _BottomSheetContainer(
              cardColor: cardColor,
              accent: accent,
              title: 'Your festival passes',
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 220,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: tickets.length,
                      onPageChanged: (value) => setState(() => currentPage = value),
                      itemBuilder: (context, index) {
                        final ticket = tickets[index];
                        return _TicketCard(
                          title: ticket['title']!,
                          subtitle: ticket['time']!,
                          seat: ticket['seat']!,
                          accent: accent,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      tickets.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 6,
                        width: currentPage == index ? 24 : 10,
                        decoration: BoxDecoration(
                          color: currentPage == index ? accent : Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {
                      Navigator.pop(sheetContext);
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text('Ticket ${currentPage + 1} ready for scanning!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.qr_code_2),
                    label: const Text('Show QR code'),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() => pageController.dispose());
  }

  void _showSettingsLauncher(
    BuildContext context,
    Color cardColor,
    Color accent,
  ) {
    final messenger = ScaffoldMessenger.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return _BottomSheetContainer(
          cardColor: cardColor,
          accent: accent,
          title: 'Lightning settings',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _QuickActionChip(
                    icon: Icons.palette_outlined,
                    label: 'Theme studio',
                    onTap: () {
                      Navigator.pop(sheetContext);
                      messenger.showSnackBar(
                        const SnackBar(content: Text('Launching theme studio… 🎨')),
                      );
                    },
                  ),
                  _QuickActionChip(
                    icon: Icons.notifications_active_outlined,
                    label: 'Alert tones',
                    onTap: () {
                      Navigator.pop(sheetContext);
                      messenger.showSnackBar(
                        const SnackBar(content: Text('Cycling through alert tones 🔔')),
                      );
                    },
                  ),
                  _QuickActionChip(
                    icon: Icons.security_outlined,
                    label: 'Privacy pulse',
                    onTap: () {
                      Navigator.pop(sheetContext);
                      messenger.showSnackBar(
                        const SnackBar(content: Text('Privacy pulse activated 🛡️')),
                      );
                    },
                  ),
                  _QuickActionChip(
                    icon: Icons.language_outlined,
                    label: 'Change language',
                    onTap: () {
                      Navigator.pop(sheetContext);
                      messenger.showSnackBar(
                        const SnackBar(content: Text('Hola! Language switched. 🌍')),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Dive into deep settings from the theme studio for a full control center.',
                style: TextStyle(color: Colors.white60),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showFriendManager(
    BuildContext context,
    Color cardColor,
    Color accent,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final controller = TextEditingController();
    final suggestions = [
      'Maya “The Dancer”',
      'Leo from Camp Nova',
      'DJ Orbit',
      'Avery · Art Crew',
    ];
    final pending = <String>[];

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return _BottomSheetContainer(
              cardColor: cardColor,
              accent: accent,
              title: 'Friend radar',
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Send an instant ping so your crew knows where to meet you.',
                    style: TextStyle(color: Colors.white60),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Add by handle…',
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.white54),
                    ),
                    onSubmitted: (value) {
                      if (value.isEmpty) return;
                      setState(() {
                        pending.add(value);
                        controller.clear();
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: suggestions
                        .map(
                          (name) => ActionChip(
                            backgroundColor: Colors.white12,
                            label: Text(
                              name,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            onPressed: () {
                              setState(() {
                                pending.add(name);
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  if (pending.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Pending invites',
                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ...pending.map(
                      (name) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: accent.withOpacity(.3),
                          child: const Icon(Icons.waves, color: Colors.white),
                        ),
                        title: Text(name, style: const TextStyle(color: Colors.white)),
                        subtitle: const Text('Invite ready to send', style: TextStyle(color: Colors.white54)),
                        trailing: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white38),
                          onPressed: () => setState(() => pending.remove(name)),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {
                      Navigator.pop(sheetContext);
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text('Sent ${pending.isEmpty ? 'a vibe check' : '${pending.length} invite${pending.length == 1 ? '' : 's'}'} to your crew!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.wifi_tethering),
                    label: const Text('Broadcast location'),
                  ),
                  SizedBox(height: MediaQuery.of(sheetContext).viewInsets.bottom),
                ],
              ),
            );
          },
        );
      },
    );

    controller.dispose();
  }
}

class _ProfileCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Color iconColor;
  final VoidCallback? onTap;

  const _ProfileCard({
    required this.color,
    required this.icon,
    required this.text,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white38),
    onTap: onTap,
      ),
    );
  }
}

class _BottomSheetContainer extends StatelessWidget {
  final Color cardColor;
  final Color accent;
  final String title;
  final Widget child;

  const _BottomSheetContainer({
    required this.cardColor,
    required this.accent,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.45),
              blurRadius: 30,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const Spacer(),
                Icon(Icons.bolt, size: 18, color: accent),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _SavedEventTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String stage;
  final Color accent;

  const _SavedEventTile({
    required this.title,
    required this.subtitle,
    required this.stage,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [accent.withOpacity(.25), Colors.white.withOpacity(.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 18, color: accent),
              const SizedBox(width: 6),
              Text(stage, style: const TextStyle(color: Colors.white60)),
            ],
          ),
        ],
      ),
    );
  }
}

class _TicketCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String seat;
  final Color accent;

  const _TicketCard({
    required this.title,
    required this.subtitle,
    required this.seat,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [accent.withOpacity(.4), Colors.deepPurple.withOpacity(.3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.white12),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.confirmation_number, color: Colors.white70),
                SizedBox(width: 8),
                Text('VIPTERYX', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.event_seat, color: Colors.white70),
                const SizedBox(width: 8),
                Expanded(child: Text(seat, style: const TextStyle(color: Colors.white70))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white70),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}