using System;
class V {
  static bool Activate(string name, string key) {
    char[] a = name.ToCharArray();
    char[] b = key.ToCharArray();
    if (b.Length != a.Length * 2) return false;
    int i = 0, j = 0;
    while (j < b.Length) {
      if (b[j] != (char)(a[i] + j)) return false;
      i = (i + 1) % a.Length;
      j++;
    }
    return true;
  }
  static void Main() {
    string name = "petik";
    char[] a = name.ToCharArray();
    char[] k = new char[a.Length * 2];
    int i = 0;
    for (int j = 0; j < k.Length; j++) { k[j] = (char)(a[i] + j); i = (i + 1) % a.Length; }
    string key = new string(k);
    Console.WriteLine(key);
    Console.WriteLine(Activate(name, key));
    Console.WriteLine(Activate(name, "wrong!!!!"));
  }
}
