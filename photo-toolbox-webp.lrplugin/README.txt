Photo Toolbox — WebP Export Plugin v1.1.0
==========================================

INSTALLATION
------------
1. Decompressez ce dossier (photo-toolbox-webp.lrplugin)
2. Ouvrez Adobe Lightroom Classic
3. Allez dans Fichier > Gestionnaire de modules externes (File > Plug-in Manager)
4. Cliquez sur "Ajouter" (Add)
5. Selectionnez le dossier "photo-toolbox-webp.lrplugin"
6. Le plugin apparait avec un indicateur vert

UTILISATION
-----------
1. Selectionnez vos photos
2. Fichier > Exporter (File > Export)
3. Choisissez "WebP (Photo Toolbox)" en haut du dialogue
4. Configurez vos parametres :
   - Qualite (1-100)
   - Mode lossless
   - Preset (Photo, Drawing, Icon, Text...)
   - Methode (0-6 : vitesse vs compression)
   - Metadonnees (All, EXIF, XMP, ICC, None)
   - Redimensionnement (largeur/hauteur max en pixels)
5. Cliquez sur Exporter

COMPATIBILITE
-------------
- Lightroom Classic 6.0+
- macOS Apple Silicon (arm64)
- Windows 10/11 (x64)

PROBLEME SUR macOS ?
--------------------
Si macOS bloque le plugin, ouvrez Terminal et tapez :
  xattr -cr ~/Library/Application\ Support/Adobe/Lightroom/Modules/photo-toolbox-webp.lrplugin

Puis redemarrez Lightroom.

SUPPORT
-------
https://www.photo-toolbox.fr/lightroom-plugin
https://github.com/adrienlac69/lr-classic-webp
