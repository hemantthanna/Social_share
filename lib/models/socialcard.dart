import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialCard extends StatelessWidget {
  String icon;
  String idkey;
  String idvalue;
  String url = '';
  SocialCard({required this.icon, required this.idkey, required this.idvalue});

  String encode(data, key) {
    if (key == 'instagram') {
      url = 'https://www.instagram.com/$data';
    } else if (key == 'twitter') {
      url = 'https://www.twitter.com/$data';
    } else if (key == 'phonenumber') {
      url = 'tel:+91$data';
    } 
     else if (key == 'email') {
      url = 'mailto:$data';
    } 
    else {
       url = data;
     }
    return url;
  }

  void _launchUrl() async {
    if (!await launchUrl(Uri.parse(encode(idvalue, idkey)))) {}
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      child: SizedBox(
        height: 200,
        width: 200,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage(icon),
              ),
              Text(
                idkey,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
