import 'package:contactsapp/import.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

/// it is a simple widget that displays a contact
///
/// contactimage: if you are useing the plugin use a [memoryimage]
/// contactname: name of the contact
class ContactTile extends StatelessWidget {
  final Function ontap;
  final bool selected;
  final Contact contact;

  const ContactTile({Key key, this.ontap, this.selected, this.contact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == true
          ? Theme.of(context).primaryColor
          : Colors.transparent,
      child: ListTile(
          selected: selected,
          onTap: ontap,
          leading: contact.avatar != null && contact.avatar.length > 0
              ? CircleAvatar(
                  backgroundImage: MemoryImage(contact.avatar),
                )
              : CircleAvatar(
                  backgroundColor: Colors.lightBlue[100],
                  child: Text(contact.initials()),
                ),
          title: Text(contact.displayName,
              style: selected == true
                  ? TextStyle(color: Theme.of(context).accentColor)
                  : null),
          trailing: Responsive.ismobil(context)
              ? CircleIconButton(
                  iconsize: 20.0,
                  icon: Icons.phone_outlined,
                  radious: 35.0,
                  ontap: () {},
                )
              : CircleIconButton(
                  icon: Icons.video_call_outlined,
                  radious: 35.0,
                  ontap: () {},
                )),
    );
  }
}
