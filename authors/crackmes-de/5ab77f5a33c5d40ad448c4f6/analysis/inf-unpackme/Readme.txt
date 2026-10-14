Macabre's Infector Crackme v0.1
===============================

This crackme is a self spreading packer.  It encrypts it's host
application with a specified password.  When you run the target application
you are then prompted for a password.  The correct host password will
decrypt and run the embedded application.

There is also an Infector password.  When you get that password correct
the light will go from red to green.  When that happens your menu will
be enabled to allow you to infect another app.  When you choose an
executable the light will go Yellow.  This means that your host is
encrypted and in memory.  You need to save the new file for the light
to turn back to green.

This is just a level 2 because you don't need to know the password for
the embedded host to make an unpacker (assuming you prompt the user for
the correct password)  It of course would be better if your unpacker
didn't prompt for a password but just figured it out and unwrapped it
for you, but we'll see....

Main Goal: Create an Unpacker
  sub Goal1:  Get the password for the host app
  sub Goal2:  Get the enable password for the infector
Level: 2
Rules: for sub Goal2 you can not patch.

