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
