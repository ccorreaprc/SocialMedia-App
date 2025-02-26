import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/utils/constants.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_backspace),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        title: Text(
          "Settings",
          style: TextStyle(),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
             ListTile(
               onTap: _showDialog(context),
              title: Text(
                "About",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("About this app"),
              trailing: Icon(Icons.error)
            ),
            Divider(),
            ListTile(
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("Use the dark mode"),
              trailing: Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => CupertinoSwitch(
                  onChanged: (val) {
                    notifier.toggleTheme();
                  },
                  value: notifier.dark,
                  activeColor: Theme.of(context).accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _showDialog(context){
    return showDialog<void>(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title: const Text('About',textAlign: TextAlign.center),
          content: Text('A full functional Social Media Application Made by CharlyKeleb'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Close')
            )
          ],
        );
      }
    );
  }
}
