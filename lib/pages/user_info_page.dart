
import 'package:flutter_form/pages/home_page.dart';
import 'package:flutter_form/models/user.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final _user = User();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
        backgroundColor: Colors.green,
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    initialValue: 'User Name',
                    decoration: InputDecoration(labelText: 'First Name'),
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Enter your first name';
                    //   }
                    // },
                    onSaved: (value) => setState(() => _user.firstName = value),
                  ),
                  TextFormField(
                    initialValue: 'User Last Name',
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter your last name';
                      }
                    },
                    onSaved: (value) => setState(() => _user.lastName = value),
                  ),
                  TextFormField(
                    initialValue: 'user@gmail.com',
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter your email';
                      }
                    },
                    onSaved: (value) => setState(() => _user.email = value),
                  ),
                  TextFormField(
                    initialValue: 'q1w2e3r4',
                    decoration: InputDecoration(labelText: 'Passwors'),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter your password';
                      }
                    },
                    onSaved: (value) => setState(() => _user.password = value),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[Text('Subscribe')],
                    ),
                  ),
                  SwitchListTile(
                    title: Text('Monthly newslatter'),
                    value: _user.newslatter,
                    onChanged: (bool value) {
                      setState(() {
                        _user.newslatter = value;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[Text('Interests')],
                    ),
                  ),
                  CheckboxListTile(
                    title: Text('Qooking'),
                    value: _user.passions[User.PassionCooking],
                    onChanged: (bool value) {
                      setState(() {
                        _user.passions[User.PassionCooking] = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Hiking'),
                    value: _user.passions[User.PassionHiking],
                    onChanged: (bool value) {
                      setState(() {
                        _user.passions[User.PassionHiking] = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Traveling'),
                    value: _user.passions[User.PassionTraveling],
                    onChanged: (bool value) {
                      setState(() {
                        _user.passions[User.PassionTraveling] = value;
                      });
                    },
                  ),
                  RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: submitForm,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Text('Save')],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void submitForm() {
    var form = _formKey.currentState;
    
    print({
      'FIRST NAME':_user.lastName,
      'LAST NAME':_user.lastName,
      'EMAIL' : _user.email,
      'PASSWORD' : _user.password,
      'NEWSLETTER' : _user.newslatter,
      'PASSIONS' : _user.passions,
      });

    if (!form.validate()) {
      return null;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }
}
