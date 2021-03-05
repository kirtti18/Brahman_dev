import 'package:flutter/material.dart';

import 'brahmanprofile.dart';

class T extends StatelessWidget {
  final List chat = [
    "Dhrupad Jagannath",
    "Sangram Panda",
    "A Mishra",
    "B Panda",
    "Hrusikesh Panda",
    "S K Tripathy",
    "Trilochan Panda",
  ];
  final List photo = [
    "https://wallpapercave.com/wp/wp6688438.jpg",
    "https://scontent.fshl1-1.fna.fbcdn.net/v/t1.0-9/125464917_2878645419075534_5462803119017108400_o.jpg?_nc_cat=109&ccb=2&_nc_sid=09cbfe&_nc_ohc=Dunpe0sgFFcAX_dCjNA&_nc_ht=scontent.fshl1-1.fna&oh=4f478ad3f9b270c226fab73b3bbc7e27&oe=60411A19",
    "https://lh3.googleusercontent.com/proxy/F7VfO78MnHuQimSuYmoK2BxoJ72ld_FeIaXNPsQAjmdKxwRXZO5Mchak86TgYwl311FUedc3gkfWtuMryxysFR8nrYhHAgPdeUeDTJ4-mLNQm-tduGHzgG4ujcEBMl3cU40d3cw3Nbp98ud-N_RKCg",
    "https://c8.alamy.com/comp/2B017TW/a-brahmin-also-brahman-is-a-member-of-the-priestly-class-in-the-indian-subcontinent-and-belongs-to-the-upper-caste-society-in-hinduism-brahmins-were-charged-with-performing-religious-duties-as-priests-and-preaching-dharma-as-one-who-prays-a-devout-or-religious-man-a-brhman-who-is-well-versed-in-vedic-texts-one-versed-in-sacred-knowledge-2B017TW.jpg",
    "https://c8.alamy.com/comp/E1H5FK/basari-india-2008-a-blind-hindu-brahmin-smoking-E1H5FK.jpg",
    "https://www.sanskritimagazine.com/wp-content/uploads/2014/05/brahmin-300x225.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNVbp4GcnAFpqpJB8pIuJ0AqUgU4dYEkgkOg&usqp=CAU",
  ];
  final List des = [
    "brahman are brahman, who are brahman they are brahman ",
    "brahman are brahman, who are brahman they are brahman ",
    "brahman are brahman, who are brahman they are brahman ",
    "brahman are brahman, who are brahman they are brahman ",
    "brahman are brahman, who are brahman they are brahman ",
    "brahman are brahman, who are brahman they are brahman ",
    "brahman are brahman, who are brahman they are brahman ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chat.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bprofile()),
                );
              },
              title: Text(chat[index]),
              leading: Image(
                image: NetworkImage(photo[index]),
              ),
              subtitle: Text(des[index]),
              isThreeLine: true,
              trailing: Text("rating"),
            ),
          );
        },
      ),
    );
  }
}
