import javax.swing.*; import java.awt.*; import java.lang.reflect.*;
public class Verify { public static void main(String[] a) throws Exception {
  Class<?> K=Class.forName("eu.sknine.skcrackme1.KClass"); Object k=K.getDeclaredConstructor().newInstance();
  Method aa=K.getDeclaredMethod("aa"); aa.setAccessible(true); aa.invoke(k);
  Field u=K.getDeclaredField("unknown"); u.setAccessible(true); Object U=u.get(k);
  ((JTextField)U.getClass().getMethod("e").invoke(U)).setText(a[0]);
  ((JTextField)U.getClass().getMethod("d").invoke(U)).setText(a[1]);
  JButton b=(JButton)U.getClass().getMethod("a").invoke(U);
  SwingUtilities.invokeLater(b::doClick); Thread.sleep(3000);
  for (Window w: Window.getWindows()) if (w instanceof JDialog && w.isShowing()) {
    JDialog d=(JDialog)w; JOptionPane p=(JOptionPane)d.getContentPane().getComponent(0);
    System.out.println("DIALOG: "+d.getTitle()+" / "+p.getMessage()); }
  System.exit(0);}}
