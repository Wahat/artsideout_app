# ARTSIDEOUT App 
![Flutter Build](https://github.com/csecutsc/artsideout_app/workflows/Flutter%20Build/badge.svg)
A Flutter application for UTSC's ARTSIDEOUT event. This application runs on Android, iOS and the web.

## Getting Started
A few resources to get you started if this is your first Flutter project:
-  [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
-  [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view the [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

Once you get Flutter installed, you must switch to the beta channel to use Flutter on the web
```
$ flutter channel # check your channel
$ flutter channel beta
$ flutter upgrade
$ flutter config --enable-web
```
Setup repo and test Flutter on the web config
```
# cd to where you want the application
$ git clone https://github.com/csecutsc/artsideout_app.git
$ flutter pub get # update your package list
$ flutter run -d chrome # test if web is enabled
```
## Contributing 
Make a feature branch and submitting a pull request
```
$ git branch feature-<mynewfeaturename>
# Then submit a pull request
```
