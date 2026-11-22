cd ~/lotty/android
./gradlew bundleRelease
cp app/build/outputs/bundle/release/app-release.aab /tmp/lotty.aab
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
  -keystore /path/to/lotty-upload-key.jks \
  /tmp/lotty.aab my-key-alias
keytool -printcert -jarfile /tmp/lotty.aab | grep SHA1
