npm run build
rm hummingbird-custom.zip
zip -r hummingbird-custom.zip ./assets ./config ./modules ./templates ./composer.json ./preview.png
