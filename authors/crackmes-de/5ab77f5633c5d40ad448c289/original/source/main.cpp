#include <windows.h>
#include <string.h>
#define IDE_NAME 100
#define IDE_KEY  101
#define IDB_BTN  102
#define IDB_EXT  103
void createSerial(char* name, char* buf)
{
     int len=strlen(name);
     char fp[20],sp[20];
     long int st,cc,serial=0x87654321;
     if(len<5 || len>30)
     {
              MessageBox(NULL,"I'm sorry, but you're name length has to be between 5 and 30 characters in length","Error",MB_OK|MB_ICONWARNING);
     }else{
           for(int a=0;a<len;a++)
           {
               cc = name[a];
               st = cc*66;
               st *= cc^5;
               serial -= st;
           }
           wsprintf(fp,"%lX",serial);
           serial *= ((name[0]*65)*10)^12;
           wsprintf(sp,"%1X",serial);
           wsprintf(buf,"%C-%s-%s",name[0],fp,sp);
     }
}
/*  Declare Windows procedure  */
LRESULT CALLBACK WindowProcedure (HWND, UINT, WPARAM, LPARAM);
HBRUSH back=CreateSolidBrush(RGB(230,230,230));
/*  Make the class name into a global variable  */
char szClassName[ ] = "WindowsApp";

int WINAPI WinMain (HINSTANCE hThisInstance,
                    HINSTANCE hPrevInstance,
                    LPSTR lpszArgument,
                    int nFunsterStil)

{
    HWND hwnd;               /* This is the handle for our window */
    MSG messages;            /* Here messages to the application are saved */
    WNDCLASSEX wincl;        /* Data structure for the windowclass */

    /* The Window structure */
    wincl.hInstance = hThisInstance;
    wincl.lpszClassName = szClassName;
    wincl.lpfnWndProc = WindowProcedure;      /* This function is called by windows */
    wincl.style = CS_DBLCLKS;                 /* Catch double-clicks */
    wincl.cbSize = sizeof (WNDCLASSEX);

    /* Use default icon and mouse-pointer */
    wincl.hIcon = LoadIcon (NULL, IDI_APPLICATION);
    wincl.hIconSm = LoadIcon (NULL, IDI_APPLICATION);
    wincl.hCursor = LoadCursor (NULL, IDC_ARROW);
    wincl.lpszMenuName = NULL;                 /* No menu */
    wincl.cbClsExtra = 0;                      /* No extra bytes after the window class */
    wincl.cbWndExtra = 0;                      /* structure or the window instance */
    /* Use Windows's default color as the background of the window */
    wincl.hbrBackground = back;

    /* Register the window class, and if it fails quit the program */
    if (!RegisterClassEx (&wincl))
        return 0;

    /* The class is registered, let's create the program*/
    hwnd = CreateWindowEx (
           0,                   /* Extended possibilites for variation */
           szClassName,         /* Classname */
           "Keygenme",       /* Title Text */
           0, /* default window */
           CW_USEDEFAULT,       /* Windows decides the position */
           CW_USEDEFAULT,       /* where the window ends up on the screen */
           150,                 /* The programs width */
           150,                 /* and height in pixels */
           HWND_DESKTOP,        /* The window is a child-window to desktop */
           NULL,                /* No menu */
           hThisInstance,       /* Program Instance handler */
           NULL                 /* No Window Creation data */
           );

    /* Make the window visible on the screen */
    ShowWindow (hwnd, nFunsterStil);

    /* Run the message loop. It will run until GetMessage() returns 0 */
    while (GetMessage (&messages, NULL, 0, 0))
    {
        /* Translate virtual-key messages into character messages */
        TranslateMessage(&messages);
        /* Send message to WindowProcedure */
        DispatchMessage(&messages);
    }

    /* The program return-value is 0 - The value that PostQuitMessage() gave */
    return messages.wParam;
}


/*  This function is called by the Windows function DispatchMessage()  */

LRESULT CALLBACK WindowProcedure (HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    HWND name,key,btn,ext;
    char nameBuf[30],keyBuf[40],serialBuf[40],congrats[80],pass[3]="43";
    switch (message)                  /* handle the messages */
    {
        case WM_CREATE:
             name=CreateWindowEx(0,"EDIT","",WS_CHILD|WS_VISIBLE|ES_LOWERCASE,15,15,120,15,hwnd,(HMENU)IDE_NAME,NULL,NULL);
             key=CreateWindowEx(0,"EDIT","",WS_CHILD|WS_VISIBLE,15,45,120,15,hwnd,(HMENU)IDE_KEY,NULL,NULL);
             btn=CreateWindowEx(0,"BUTTON","Activate",WS_CHILD|WS_VISIBLE|BS_DEFPUSHBUTTON,30,75,75,20,hwnd,(HMENU)IDB_BTN,NULL,NULL);
             ext=CreateWindowEx(0,"BUTTON","Exit",WS_CHILD|WS_VISIBLE,30,100,75,20,hwnd,(HMENU)IDB_EXT,NULL,NULL);
             return 0;
        case WM_COMMAND:
             switch(wParam)
             {
                 case IDB_BTN:
                      GetDlgItemText(hwnd,IDE_NAME,nameBuf,30);
                      createSerial(nameBuf,keyBuf);
                      GetDlgItemText(hwnd,IDE_KEY,serialBuf,40);
                      if(keyBuf[0] == serialBuf[0])
                      {
                      wsprintf(congrats,"YOU DID IT! Now make a keygen!\nThe key to the source code .zip is %s",pass);
                      MessageBox(hwnd,congrats,"Congrats!",MB_ICONINFORMATION|MB_OK);
                      }else{
                      MessageBox(hwnd,"Crap, keep going! I sense you are close >:D","Failure!",MB_ICONWARNING|MB_OK);                        
                      }
                      break;
                 case IDB_EXT:
                      PostQuitMessage(0);
                      break;
             }
             return 0;
        case WM_DESTROY:
            PostQuitMessage (0);       /* send a WM_QUIT to the message queue */
            break;
        default:                      /* for messages that we don't deal with */
            return DefWindowProc (hwnd, message, wParam, lParam);
    }

    return 0;
}
