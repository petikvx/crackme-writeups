// LD_PRELOAD harness — injecte un system code puis capture QMessageBox.
// Build: see termbreaker-solve.py --check (g++ + Qt 6.11 from ~/Qt)
#include <QApplication>
#include <QLineEdit>
#include <QLabel>
#include <QTimer>
#include <QKeyEvent>
#include <QString>
#include <dlfcn.h>
#include <cstdio>
#include <cstdlib>
#include <unistd.h>

static void inject_code()
{
    const char *code = getenv("TB_CODE");
    if (!code || !*code)
        code = "TERMATUR";

    for (QWidget *w : QApplication::allWidgets()) {
        auto *le = qobject_cast<QLineEdit *>(w);
        if (!le)
            continue;
        le->setFocus(Qt::OtherFocusReason);
        le->setText(QString::fromLatin1(code));
        // returnPressed → slot auth (sub_60B0)
        QKeyEvent press(QEvent::KeyPress, Qt::Key_Return, Qt::NoModifier, QString("\n"));
        QKeyEvent release(QEvent::KeyRelease, Qt::Key_Return, Qt::NoModifier);
        QCoreApplication::sendEvent(le, &press);
        QCoreApplication::sendEvent(le, &release);
        // fallback: emit signal directly
        QMetaObject::invokeMethod(le, "returnPressed", Qt::DirectConnection);
        return;
    }
    std::fputs("tb-live: no QLineEdit found\n", stderr);
    _exit(2);
}

extern "C" int _ZN12QApplication4execEv()
{
    using ExecFn = int (*)();
    static ExecFn real = nullptr;
    if (!real)
        real = reinterpret_cast<ExecFn>(dlsym(RTLD_NEXT, "_ZN12QApplication4execEv"));

    QTimer::singleShot(400, qApp, [] { inject_code(); });
    // safety timeout
    QTimer::singleShot(5000, qApp, [] {
        std::fputs("tb-live: timeout\n", stderr);
        _exit(3);
    });
    return real();
}

// QMessageBox::information(QWidget*, const QString&, const QString&, StandardButtons, StandardButton)
extern "C" int _ZN11QMessageBox11informationEP7QWidgetRK7QStringS4_6QFlagsINS_14StandardButtonEES6_(
    void *parent, const QString &title, const QString &text, int buttons, int def)
{
    (void)parent;
    (void)buttons;
    (void)def;
    std::printf("QMessageBox title=%s\n", title.toUtf8().constData());
    std::printf("QMessageBox text=%s\n", text.toUtf8().constData());
    std::fflush(stdout);
    const bool ok = text.contains(QStringLiteral("ACCESS GRANTED"))
                    || text.contains(QStringLiteral("Congratulations"));
    _exit(ok ? 0 : 1);
}

// Also observe status QLabel::setText
extern "C" void _ZN6QLabel7setTextERK7QString(QLabel *self, const QString &text)
{
    using Fn = void (*)(QLabel *, const QString &);
    static Fn real = nullptr;
    if (!real)
        real = reinterpret_cast<Fn>(dlsym(RTLD_NEXT, "_ZN6QLabel7setTextERK7QString"));
    std::printf("QLabel::setText %s\n", text.toUtf8().constData());
    std::fflush(stdout);
    real(self, text);
}
