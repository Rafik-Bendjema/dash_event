import 'dart:convert';

import 'package:dash_event/Feutures/Email/domain/entities/Email.dart';
import 'package:dash_event/Feutures/auth/data/auth.dart';
import 'package:http/http.dart' as http;

abstract class EmailRepo {
  Future<bool> sendEMail(Email email);
  Future<List<int>> brodcastEmail(String content);
}

class EmailRepoImpl implements EmailRepo {
  @override
  Future<bool> sendEMail(Email email) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': 'service_1233ddj',
          'template_id': 'template_cyypfel',
          'user_id': 'otPa2yN2UIRpnwth7',
          'template_params': {
            'to_name': email.name,
            'user_email': email.email,
            'content': email.content
          }
        }));
    print(response.body);
    return response.body == "OK";
  }

  @override
  Future<List<int>> brodcastEmail(String content) async {
    List<int> result = [0, 0];
    bool status;
    List<Map<String, String>> usrs;
    //get the users list
    usrs = await Auth().getAllUsersData();
    print(usrs);
    usrs.forEach((usr) async {
      Email e =
          Email(name: usr['name']!, email: usr['email']!, content: content);
      status = await sendEMail(e);
      if (status) {
        print("heeeeeeer");
        result[0]++;
      } else {
        result[1]++;
      }
    });
    print("this is result");
    print(result);
    //call the sentemail function and every time change the email
    return result;
  }
}
