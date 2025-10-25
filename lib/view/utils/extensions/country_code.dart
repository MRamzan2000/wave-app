/* extension is the feature of dart introduce in  dart 2.7 version
 An Extension is a way add new method or features in existing classes like
 (int String List or DateTime) Without editing those Class

 for Example

 If you want to reverse the String

 String name ="Ramzan";

 String reverseString=name.split('').reverse.join();

 print(reverseString);

  Simple way make a custom method reverse string

 extension nameReverse on String{

 String get reverse =>split('').reverse.join();

 }

 Why do we use extensions?

 1 : Make code cleaner and easier to read.
     → name.reversed looks better than writing a long function every time.

 2 : Add new functionality to existing classes.
     → You can add your own methods to String, int, List, etc.

 3 : Reusability:
     → Once created, you can use it anywhere in your project.

  How it works?
  When you create an extension, Dart doesn’t actually change the original class —
  it just attaches your custom function to it temporarily while your app is running.

 */
extension convertFlag on String {
  String get toFlag {
    return (this).toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }
}