#!/bin/sh
CAT=/bin/cat

echo Content-type: text/html
echo ""

$CAT << EOM
<HTML>
<HEAD><TITLE>List environment variables</TITLE>
</HEAD>
<BODY bgcolor="#cccccc" text="#000000">
<P>
<SMALL>
<PRE>
EOM

/usr/bin/env

$CAT << EOM
</PRE>
</SMALL>
<P>
</BODY>
</HTML>
EOM

