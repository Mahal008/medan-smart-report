# Medan Smart Report

Medan Smart Report is a bilingual mobile application built with Flutter for Android, designed as the official citizen reporting platform for Kota Medan, Sumatera Utara, Indonesia. The app empowers citizens to report city infrastructure problems instantly and transparently, while providing government officials with a powerful built-in dashboard to monitor and manage all reports in real time.

# Description

Kota Medan faces ongoing challenges with road damage, flooding, garbage, broken street lights, and fire incidents. Traditional reporting channels are slow and lack transparency. Medan Smart Report solves this by giving every citizen a direct and easy way to report problems, and giving government officials the tools to respond efficiently — all within one single application.

# Purpose

The purpose of this application is to bridge the gap between the citizens of Medan and the city government. Citizens can submit reports, receive a unique Tracking ID, and monitor the status of their reports at any time. Government officials can access a secure Official Portal inside the app to view all reports, update statuses, and analyze data through a built-in analytics dashboard.

# Features

The application has two sides. The citizen side allows users to submit reports by selecting an issue type from six categories which are Road Damage, Garbage, Flood, Street Light, Fire Incident, and Other. Users also select a severity level from four options which are Low, Medium, High, and Critical. The form also includes a description field, GPS location capture, and a manual address or landmark field. After submitting, the citizen receives a unique Tracking ID in the format MSR followed by a timestamp. This ID can be used at any time to check the status of the report. The entire interface is available in both English and Bahasa Indonesia.
The Official Government Portal is a secure section inside the application protected by a secret access code. Once inside, authorized officials see a professional dashboard with live statistics including total reports, pending reports, resolved reports, and critical reports. Officials can view all submitted reports with full details including reporter name, phone number, location, description, severity, and date. They can update the status of any report to Pending, In Progress, Resolved, or Rejected. The dashboard also includes an analytics page showing status distribution, severity breakdown, and issue type breakdown, as well as a notifications page showing critical alerts and pending report alerts.

# Technologies Used

This application was built using Flutter and Dart for the mobile frontend. Firebase was used for backend services including Firebase Core and Cloud Firestore for real-time database storage. The user interface follows Material Design principles with a professional navy blue color scheme.
How to Run
Clone the repository, run flutter pub get to install dependencies, and then run flutter run to launch the application on an Android device or emulator. To access the Official Government Portal inside the app, open the navigation menu and tap Official Portal, then enter the access code MEDAN2025.

# Authors
This application was developed by Mahmud Lawan, Setyadi, and Alena Aurelia Rohiman, under the supervision of Mhd. Basri, S.Si, M.Kom, at Universitas Muhammadiyah Sumatera Utara, Medan, Indonesia.

Copyright
© 2025 Medan Smart Report. Developed for the Mobile Application Development Competition. City of Medan, Sumatera Utara, Indonesia.
