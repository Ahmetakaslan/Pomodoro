# pomodoro

A new Flutter project.

## Getting Started
https://drive.google.com/file/d/155lhBp1sErMneeoLORNtmdNljAAAF6-9/view?usp=sharing
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Açma</title>
</head>
<body>
    <button id="videoButton">Videoyu Aç</button>

    <script src="script.js"></script>
</body>
</html>
// Videonuzun Google Drive'da herkese açık paylaşım bağlantısını buraya ekleyin
var videoLink = "[https://drive.google.com/file/d/VIDEO_ID/preview](https://drive.google.com/file/d/155lhBp1sErMneeoLORNtmdNljAAAF6-9/view?usp=sharing)"; 

document.getElementById("videoButton").addEventListener("click", function() {
    // Yeni bir pencere veya sekme açarak videoyu görüntüle
    window.open(videoLink, "_blank");
});

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
