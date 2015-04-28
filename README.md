ExtendedTheme
===============

An Xcode IDE Plugin that extends Xcode themes capabilities.

### Installation and Usage

- Simply compile the Xcode project and the plugin will automatically be installed. After installing, restart Xcode.
- The colors are read from your current .dvtcolortheme file. You should add a `FZExtendedTheme` key to the file.
  - Inside this key, you can use any class that is being use in Xcode, this plugin will change the background if it's a view or the text color if it's some kind of text. Keys starting with `DVTheme_` will actually modify the memory version of the builtin theme [check this to see all DVTheme keys](https://raw.githubusercontent.com/onevcat/VVPluginDemo/master/DemoPlugin/DVTKit.framework/Versions/A/Resources/Default.dvttheme) 

Example:

```xml
<key>FZExtendedTheme</key>
<dict>
    <key>IBCanvasBackgroundView</key>
	<string>0.098 0.098 0.098 1</string>
    <key>IBICDetailDocumentView</key>
	<string>0.098 0.098 0.098 1</string>
    <key>IBICImageSlicingView</key>
	<string>0.098 0.098 0.098 1</string>
    <key>IBICSourceListOutlineView</key>
	<string>0.098 0.098 0.098 1</string>
    <key>IBICDetailPlaceholderView</key>
	<string>0.098 0.098 0.098 1</string>
    <key>IBOutlineViewImageAndTextCell</key>
	<string>1.0 1.0 1.0 1</string>
    <key>IBICMultipartImageSectionTitleView</key>
	<string>1.0 1.0 1.0 1</string>
    <key>IBICImageSlicingViewContainer</key>
	<string>1.0 1.0 1.0 1</string>

    <key>DVTheme_ibDockInactiveBackgroundColor</key>
	<string>0.098 0.098 0.098 1</string>
    <key>DVTheme_ibDockActiveBackgroundColor</key>
	<string>0.098 0.098 0.098 1</string>
</dict>
```

You can also [download my full dvtcolortheme](/../gh-pages/Fz (Based on ego).dvtcolortheme?raw=true)
##Screenshots

![screenshot](/../gh-pages/screenshot-assets.png?raw=true)
![screenshot](/../gh-pages/screenshot-storyboard.png?raw=true)
