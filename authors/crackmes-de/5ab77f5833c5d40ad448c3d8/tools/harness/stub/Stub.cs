namespace System.Windows.Forms {
  public class Control { public virtual string Text { get; set; } = ""; }
  public class TextBoxBase : Control {}
  public class TextBox : TextBoxBase {}
  public class Form : Control {}
}
