import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/Iteam_card.dart';
import '../providers/User_Provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(provider.user?.displayName != null
            ? provider.user!.displayName!
            : ''),
        actions: [
          IconButton(
              onPressed: () async => await provider.logOut().then((value) =>
                  Navigator.pushReplacementNamed(context, '/launcher')),
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              runAlignment: WrapAlignment.spaceAround,
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 10,
              children: const [
                Iteam_card(
                  title:
                      'This is First data ahdfjayhd alshfaohf asflkhoifhaoihf',
                  subtitle:
                      'this is subtitle ahdfuwiayd ceioyfhqoyf cqiolhfdoiqhfoqhf',
                  image: 'img1.jpg',
                ),
                Iteam_card(
                  title: 'This is second data',
                  subtitle: 'this is subtitle for 2nd',
                  image: 'img2.jpg',
                ),
                Iteam_card(
                  title: 'This is 3rd data of album',
                  subtitle: 'only subtitle',
                  image: 'img3.jpg',
                ),
                Iteam_card(
                  title: 'This is 4th',
                  subtitle: 'this is subtitle ',
                  image: 'img4.jpg',
                ),
                Iteam_card(
                  title: 'This is only a demo',
                  subtitle: 'this is subtitle demo',
                  image: 'img5.jpg',
                ),
                Iteam_card(
                  title: 'Music album demo app',
                  subtitle: 'album subtitle demo for music',
                  image: 'img6.jpg',
                ),
                Iteam_card(
                  title:
                      'This is First data ahdfjayhd alshfaohf asflkhoifhaoihf',
                  subtitle:
                      'this is subtitle ahdfuwiayd ceioyfhqoyf cqiolhfdoiqhfoqhf',
                  image: 'img7.jpg',
                ),
                Iteam_card(
                  title:
                      'This is First data ahdfjayhd alshfaohf asflkhoifhaoihf',
                  subtitle:
                      'this is subtitle ahdfuwiayd ceioyfhqoyf cqiolhfdoiqhfoqhf',
                  image: 'img8.jpg',
                ),
                Iteam_card(
                  title:
                      'This is First data ahdfjayhd alshfaohf asflkhoifhaoihf',
                  subtitle:
                      'this is subtitle ahdfuwiayd ceioyfhqoyf cqiolhfdoiqhfoqhf',
                  image: 'img9.jpg',
                ),
                Iteam_card(
                  title:
                      'This is First data ahdfjayhd alshfaohf asflkhoifhaoihf',
                  subtitle:
                      'this is subtitle ahdfuwiayd ceioyfhqoyf cqiolhfdoiqhfoqhf',
                  image: 'img10.jpg',
                ),
                Iteam_card(
                  title:
                      'This is First data ahdfjayhd alshfaohf asflkhoifhaoihf',
                  subtitle:
                      'this is subtitle ahdfuwiayd ceioyfhqoyf cqiolhfdoiqhfoqhf',
                  image: 'img11.jpg',
                ),
                Iteam_card(
                  title:
                      'This is First data ahdfjayhd alshfaohf asflkhoifhaoihf',
                  subtitle:
                      'this is subtitle ahdfuwiayd ceioyfhqoyf cqiolhfdoiqhfoqhf',
                  image: 'img12.jpg',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
