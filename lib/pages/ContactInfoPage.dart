import 'package:contactsapp/import.dart';

class ContactInfoPage extends StatelessWidget {
  final Contact contactinfo;
  final Function ondeletetapped;
  final bool isfullscreen;

  ContactInfoPage(
      {Key key,
      this.contactinfo,
      this.isfullscreen = false,
      this.ondeletetapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: contactinfo != null && contactinfo.displayName != null
            ? Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    // APPBAR
                    ContactInfoAppBar(
                        isfullscreen: isfullscreen,
                        contactinfo: contactinfo,
                        ondeletetapped: ondeletetapped),
                    ShortcutButtons(
                      ondeletetaped: () {
                        ondeletetapped();
                      },
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 5.0,
                      ),
                    ),
                    contactinfo.phones.length != null &&
                            contactinfo.phones.length > 0
                        ? PhonesList(
                            contact: contactinfo,
                          )
                        : SliverTextBox(
                            text: 'No Phone Numbers',
                          ),
                    SliverDivider(
                      hight: 35.0,
                    ),
                    contactinfo.emails.length > 0
                        ? EmailsList(
                            contact: contactinfo,
                          )
                        : SliverTextBox(
                            text: 'No Emails',
                          ),
                  ],
                ),
              )
            : SizedBox.shrink());
  }
}

class ContactInfoAppBar extends StatelessWidget {
  const ContactInfoAppBar({
    Key key,
    @required this.isfullscreen,
    @required this.contactinfo,
    @required this.ondeletetapped,
  }) : super(key: key);

  final bool isfullscreen;
  final Contact contactinfo;
  final Function ondeletetapped;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      elevation: 1.0,
      forceElevated: true,
      expandedHeight: 250.0,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_outlined,
              color: Theme.of(context).accentColor,
            )),
        isfullscreen == false && Responsive.istablet(context)
            ? IconButton(
                onPressed: () {
                  var route = MaterialPageRoute(
                      builder: (BuildContext) => ContactInfoPage(
                            contactinfo: contactinfo,
                            ondeletetapped: () {
                              Navigator.pop(context);
                              ondeletetapped();
                            },
                            isfullscreen: true,
                          ));
                  Navigator.of(context).push(route);
                },
                icon: Icon(
                  Icons.fullscreen,
                  color: Theme.of(context).accentColor,
                ))
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Responsive.istablet(context)
                    ? Icon(Icons.fullscreen_exit)
                    : SizedBox.shrink())
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        title: Text(contactinfo.displayName),
        centerTitle: true,
        stretchModes: [
          //StretchMode.blurBackground,
          StretchMode.zoomBackground,
          StretchMode.fadeTitle
        ],
        background: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: contactinfo.avatar != null && contactinfo.avatar.length > 0
                  ? Column(
                      children: [
                        CircleAvatar(
                          radius: 80.0,
                          backgroundImage: MemoryImage(contactinfo.avatar),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.lightBlue[100],
                          radius: 80.0,
                          child: Text(
                            contactinfo.initials(),
                            style: TextStyle(fontSize: 55.0),
                          ),
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}

class ShortcutButtons extends StatelessWidget {
  final Function ondeletetaped;

  const ShortcutButtons({Key key, this.ondeletetaped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleIconButton(
                  disabled: Responsive.istablet(context),
                  icon: Icons.phone_outlined,
                  color: Theme.of(context).accentColor,
                  outlined: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleIconButton(
                  color: Theme.of(context).accentColor,
                  icon: Icons.message_outlined,
                  outlined: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleIconButton(
                  ontap: () {},
                  color: Theme.of(context).accentColor,
                  icon: Icons.video_call_outlined,
                  outlined: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleIconButton(
                  color: Theme.of(context).accentColor,
                  icon: Icons.email_outlined,
                  outlined: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleIconButton(
                  ontap: () async {
                    ondeletetaped();
                  },
                  color: Colors.red,
                  icon: Icons.delete_outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailsList extends StatelessWidget {
  final Contact contact;
  const EmailsList({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext, index) {
      String currentemail = contact.emails.elementAt(index).value;
      String currentemailname = contact.emails.elementAt(index).label;
      return ContactInfoTile(
        phonename: currentemailname,
        phonenumber: currentemail,
        trailing: CircleIconButton(
          icon: Icons.video_call_outlined,
          radious: Responsive.ismobil(context) ? 40.0 : 50.0,
        ),
      );
    }, childCount: contact.emails.length));
  }
}

class PhonesList extends StatelessWidget {
  final Contact contact;

  const PhonesList({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext, index) {
      String currentphone = contact.phones.elementAt(index).value;
      String currentphonename = contact.phones.elementAt(index).label;
      return ContactInfoTile(
        phonenumber: currentphone,
        phonename: currentphonename,
        icon: Icons.phone_outlined,
        trailing: CircleIconButton(
            radious: Responsive.ismobil(context) ? 40.0 : 50.0,
            icon: Icons.message_outlined),
      );
    }, childCount: contact.phones.length));
  }
}
