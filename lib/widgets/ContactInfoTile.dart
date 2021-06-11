import 'package:flutter/material.dart';

class ContactInfoTile extends StatelessWidget {
  final String phonenumber;
  final String phonename;
  final IconData icon;
  final Widget trailing;
  final Function ontap;

  const ContactInfoTile(
      {Key key,
      this.icon = Icons.email_outlined,
      this.phonenumber,
      this.trailing = const SizedBox.shrink(),
      this.ontap,
      this.phonename})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
        ],
      ),
      title: Text(phonenumber),
      subtitle: Text(
        phonename,
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      trailing: trailing,
    );
  }
}
