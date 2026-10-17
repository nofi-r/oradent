
import 'package:flutter/material.dart';
import '../main.dart';
import 'detail_screen.dart';

// ---------- Treatment model ----------
class Treatment {
  final String name;
  final String category;
  final String description;
  final String duration;
  final String price;
  final String followUp;
  final String image;

  const Treatment({
    required this.name,
    required this.category,
    required this.description,
    required this.duration,
    required this.price,
    required this.followUp,
    required this.image,
  });
}

// ---------- Treatment data ----------
const List<Treatment> treatments = [
  Treatment(
    name: 'Teeth Cleaning',
    category: 'Preventive',
    description:
    'Professional scaling removes plaque and tartar to keep your gums and teeth healthy.',
    duration: '30 min',
    price: 'Rs. 3,000',
    followUp: 'After 6 months',
    image: 'assets/images/icon_cleaning.png',
  ),
  Treatment(
    name: 'Dental Filling',
    category: 'Restorative',
    description:
    'Repairs a cavity by removing the decayed part and filling it with a tooth-colored material.',
    duration: '45 min',
    price: 'Rs. 4,000',
    followUp: 'After 2 weeks',
    image: 'assets/images/icon_filling.png',
  ),
  Treatment(
    name: 'Root Canal',
    category: 'Restorative',
    description:
    'Removes the infected pulp inside the tooth, cleans the canal and seals it to save the tooth.',
    duration: '90 min',
    price: 'Rs. 12,000',
    followUp: 'After 1 week',
    image: 'assets/images/icon_root_canal.png',
  ),
  Treatment(
    name: 'Tooth Extraction',
    category: 'Restorative',
    description:
    'Safe removal of a damaged or problematic tooth under local anesthesia.',
    duration: '45 min',
    price: 'Rs. 3,500',
    followUp: 'After 1 week',
    image: 'assets/images/icon_extraction.png',
  ),
  Treatment(
    name: 'Dental Implants',
    category: 'Restorative',
    description:
    'A titanium post replaces the missing tooth root and holds a natural-looking crown.',
    duration: '2 hours',
    price: 'Rs. 60,000',
    followUp: 'After 2 weeks',
    image: 'assets/images/icon_implant.png',
  ),
  Treatment(
    name: 'Crowns and Bridges',
    category: 'Restorative',
    description:
    'Caps that cover a weak tooth or fill the gap left by missing teeth.',
    duration: '2 visits',
    price: 'Rs. 15,000',
    followUp: 'After 2 weeks',
    image: 'assets/images/icon_crown.png',
  ),
  Treatment(
    name: 'Teeth Whitening',
    category: 'Cosmetic',
    description:
    'Removes stains and brightens your smile by several shades in one session.',
    duration: '60 min',
    price: 'Rs. 15,000',
    followUp: 'After 6 months',
    image: 'assets/images/icon_whitening.png',
  ),
  Treatment(
    name: 'Braces',
    category: 'Cosmetic',
    description:
    'Gradually moves crooked or crowded teeth into the right position.',
    duration: '60 min',
    price: 'Rs. 80,000',
    followUp: 'Every 4 weeks',
    image: 'assets/images/icon_braces.png',
  ),
];

// ---------- Home screen ----------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = const [
    'All',
    'Preventive',
    'Restorative',
    'Cosmetic',
  ];

  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Treatment> treatmentsFor(String tab) {
    if (tab == 'All') return treatments;
    return treatments.where((t) => t.category == tab).toList();
  }

  void openDetails(Treatment treatment) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(treatment: treatment),
      ),
    );
  }

  void showAboutOradent() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'About Oradent',
          style: TextStyle(
            color: navyBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Oradent is a smart dental care app. Choose a treatment, '
              'book an appointment and get follow-up reminders.',
          style: TextStyle(color: Colors.black54, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: navyBlue),
            ),
          ),
        ],
      ),
    );
  }

  void goToTab(int index) {
    Navigator.pop(context);
    tabController.animateTo(index);
  }

  Widget drawerItem(String image, String title, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(image, width: 26, height: 26),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(color: navyBlue),
            child: Row(
              children: [
                // Oradent logo
                Container(
                  width: 70,
                  height: 70,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    'assets/images/oradent_logo.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.health_and_safety_outlined,
                        size: 40,
                        color: navyBlue,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ORADENT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Smart Dental Care',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          drawerItem('assets/images/icon_home.png', 'Home', () => goToTab(0)),
          drawerItem(
            'assets/images/icon_preventive.png',
            'Preventive',
                () => goToTab(1),
          ),
          drawerItem(
            'assets/images/icon_restorative.png',
            'Restorative',
                () => goToTab(2),
          ),
          drawerItem(
            'assets/images/icon_cosmetic.png',
            'Cosmetic',
                () => goToTab(3),
          ),
          const Divider(),
          drawerItem('assets/images/icon_about.png', 'About', showAboutOradent),
        ],
      ),
    );
  }

  Widget buildTreatmentList(String tab) {
    final items = treatmentsFor(tab);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final treatment = items[index];

        return Card(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: iceBlue.withValues(alpha: 0.6),
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            leading: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: iceBlue.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(treatment.image, fit: BoxFit.contain),
              ),
            ),
            title: Text(
              treatment.name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: navyBlue,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                '${treatment.duration}  |  ${treatment.price}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            trailing: Image.asset(
              'assets/images/icon_arrow.png',
              width: 20,
              height: 20,
            ),
            onTap: () => openDetails(treatment),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: buildDrawer(),
      appBar: AppBar(
        title: const Text(
          'Our Treatments',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: tabs.map((tab) => buildTreatmentList(tab)).toList(),
      ),
    );
  }
}


