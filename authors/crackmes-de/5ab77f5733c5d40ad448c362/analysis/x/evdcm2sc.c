#include <stdio.h>
#include <conio.h>
#include <string.h>

main()
{
	int i, letter, total, serial;
	char username[25];

	clrscr();

 	printf("-----------------------------------------\n"   );
 	printf("Key Generator for Evidence trial crackme\n\n"  );
	printf("          Written by: HaQue\n"                 );
	printf("            13 march 2001\n\n"                 );
	printf("-----------------------------------------\n"   );
	printf("                                         \n"   );

	printf("Enter your Name      : ");
	gets(username);

	total = 0;
	for (i=0; i < strlen(username); i++)
		if ( username[i] != 32 )
			{
				letter = username[i];
				total += letter;
				total += 47;
			}
         
         serial = ((( total * total ) + 2) ^ (total + 6667)) - 776;

	printf("your serial Number is: %lu\n",serial);

return (0);
}
