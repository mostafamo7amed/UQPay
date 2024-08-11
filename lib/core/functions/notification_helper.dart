import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationsHelper {
  // creat instance of fbm
  final _firebaseMessaging = FirebaseMessaging.instance;

  // initialize notifications for this app or device
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    // get device token
    String? deviceToken = await _firebaseMessaging.getToken();
    print(
        "===================Device FirebaseMessaging Token====================");
    print(deviceToken);
    print(
        "===================Device FirebaseMessaging Token====================");
  }

  // handle notifications when received
  void handleMessages(RemoteMessage? message) {

    if (message != null) {
      // navigatorKey.currentState?.pushNamed(NotificationsScreen.routeName, arguments: message);
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        print('=========================================');
        print('${message.notification!.title}');
        print(message.data.toString());
        print('${message.notification!.body}');
        print('=========================================');
      }
    }
  }

  // handel notifications in case app is terminated
  void handleBackgroundNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then((handleMessages));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "uq-pay-e0340",
      "private_key_id": "d60985c0111919739d651896aeb734c3d0afd29f",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC8bf1dq9kZaRDF\nh6/y5oIZS8fgArUskuN6z+2rAuR3I5iKc5FG92EBxy63gfLmqR+cscPhn1nM+Weh\nCDk9an58UnQgrX1MpM6Ro1pXf5LLyTyzwoqr5wH7w03r/QEn2KY57vmInzcyJWbt\n2uz9PEuCUhS6DXfZsjWJ2dvE6RNVrzqO00/0Htjs1DjBZ79o/EdTvi1CMhCn/U2c\nx/TZDoyQZ5LN+fGpzE4XSw8IucBZ0qG+Aieo692gGqXr4bxIKuAUE1R7kNrTEJeB\n591os2OVhAcskh9yJi+VaqhVISWK1BqfoWFMy1tEVwnAJpFJaFMBW8ILCIVABEhX\nhprwaApLAgMBAAECggEAMTCTbmMguyHy52YLGCF1wA3I4WFDk53K9bIXLMgGBVYN\nCcOunrSQpeqt9ujdFLr8ziaX6Kv1QO2w0Fh5vN8yotjRiQBRT/NMG7flqybaFwnz\nJ0g3dDXLjkJHcr4rEZBcoI4SpUhPG++opZo7uMYHPj+YOpOugG2lzVVKqmZgDkNL\nJbqIIli+Qv8FLMxp5paoV8bcWHOjh5YsHCKoZS60snhoQulmDZNG1Tp+RUBsknwR\nEkc7RXC+QURsNNTKgNedMQvgxkGSCyuqFLphU3jHQrV/3gIkFaATGPykPORn52p1\nlpZJO+oMEzD8xt+UWSGbV7ajvajjiiVInbj99qGWUQKBgQD6F12at3WUEC/I8Bp9\nr9MTEbYw5OxLQtXuDqrVtRKxdjAFeUQDQeF1Zo6yKyaNEGI+O7/WyZxAvt1eH6f7\noQh4HrZLeQ5jkMiUmgmyy8uz99QODKJjA9Avp5+x+5dTckbJQ4G0pJpoDi53V9b0\nhlWxTNa7x3oF5jq3GV/lS+JNEQKBgQDA4aycRcDVqIsWG5InAZj3WchM0US5Uucr\nkWTqSuEkAjEbXY8f2kUGN1kzadiDWXhbGCJ3OmwlGxPTMTh32rQn4/1uAp3fygDE\nZ9HdpM/DfrOyp6VtQ3ibRvSnfC0iKOqdM2U7729TJx6RxCDJ7uDqmgb/HzVyn7ia\nPj1HZ/FRmwKBgEOjoChhKAbEnfftoGyP6jmFF85/i70LNYruIpwsHgMrIO/KDXAI\nGG9FLqDXdNTAMqH8TPVNj9ofBQYY77jpo73BKLKe6hpZpTYztx3Jaq2hAJRQLHc1\nJ9BLuLBNiG8EQErc3C68Ohqcg0q50iROVMzgKE+fMsx3qTeuQDZm4KzRAoGALAUV\nLNEqkliV7aS7NVXDAGioMwfrpFQMWEAlhOcz/NDXPkSa/o0FBccp/3bfqBKKSlf2\nvblCpzFH1AI+vfPW++enlizYtRNYG3sKRYhwtlA7WMG0Gny0kNOf0H2hm1M1QE1T\nhFs/z/10l5XoWc2/3Srr/9uyigdzzRf5SkupopMCgYEA4BC8RHxn+bELEY1yWY4J\nwO8lt+iGadvBBWRxNV8vK+zphNDhY6QMNGjEz2oo3M76OfGGvkhiOaqdhC3Rm+j1\nNfjIV8Ad0ABG7slN9f7aUW1pGi6+scgYLHLi5mmshmHKYUK1EhYiD6QFwBXaN6Rp\nb8UjU+SaU51cIecdLUzNLv8=\n-----END PRIVATE KEY-----\n",
      "client_email": "up-pay-service-account-project@uq-pay-e0340.iam.gserviceaccount.com",
      "client_id": "116595452062290538439",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/up-pay-service-account-project%40uq-pay-e0340.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials =
      await auth.obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
          scopes,
          client);

      client.close();
      print("Access Token: ${credentials.accessToken.data}"); // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }
  Future<void> sendNotifications({
    required String fcmToken,
    required String title,
    required String body,
    String? type,
  }) async {
    try {
      var serverKeyAuthorization = await getAccessToken();

      // change your project id
      const String urlEndPoint =
          "https://fcm.googleapis.com/v1/projects/uq-pay-e0340/messages:send";

      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      var response = await dio.post(
        urlEndPoint,
        data:{
          "message":{
            "token": fcmToken,
            "data":{
              "type":type ?? 'message'
            },
            "notification":{
              "title":title,
              "body":body,
            }
          }
        },

      );
      // Print response status code and body for debugging
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data.toString()}');
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}