import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iq_app/core/preference_services/preference_services.dart';
import 'package:iq_app/home_page/home_page_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;

  void getName() async {
    String? nameD = await PreferencesServices.getName();
    if (nameD != null) {
      setState(() {
        nameD = name;
      });
    }
  }

  @override
  void initState() {
    // Future.delayed(Duration.zero, () {});
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Container(
          height: 120,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
              ),
              SvgPicture.asset(
                'assets/images/Component 1.svg',
                height: 70,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Hi ' '$name',
              style: const TextStyle(fontSize: 24),
            ),
            const Text(
              'Welcome to Dr.iQ',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HomePageItem(
                  icon: Icons.text_increase_sharp,
                  text: 'Take IQ Test',
                  color: Color(0xffc30010),
                ),
                HomePageItem(
                  icon: Icons.data_object_outlined,
                  text: 'History',
                  color: Color(0xff17181d),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomePageItem(
                  icon: Icons.school_outlined,
                  text: 'Improve IQ',
                  color: Colors.blue.shade900,
                ),
                const HomePageItem(
                  icon: Icons.settings_suggest_outlined,
                  text: 'Settings',
                  color: Color(0xff2ecc71),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HomePageItem(
                  icon: Icons.person_add_alt_1_outlined,
                  text: 'Profile ',
                  color: Color(0xfffd830d),
                ),
                HomePageItem(
                  icon: Icons.adobe_outlined,
                  text: 'About',
                  color: Color(0xff13481d),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _showMyDialog();
    });
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Personal Info',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _nameController,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Age',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _ageController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                final name = _nameController.text.trim();
                final age = _ageController.text.trim();
                await PreferencesServices.saveName(name);
                await PreferencesServices.saveAge(age);

                CircularProgressIndicator();

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [],
        ));
  }
}
