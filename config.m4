dnl $Id$
dnl config.m4 for extension noeval

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(noeval, for noeval support,
dnl Make sure that the comment is aligned:
dnl [  --with-noeval             Include noeval support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(noeval, whether to enable noeval support,
Make sure that the comment is aligned:
[  --enable-noeval           Enable noeval support])

if test "$PHP_NOEVAL" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-noeval -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/noeval.h"  # you most likely want to change this
  dnl if test -r $PHP_NOEVAL/$SEARCH_FOR; then # path given as parameter
  dnl   NOEVAL_DIR=$PHP_NOEVAL
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for noeval files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       NOEVAL_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$NOEVAL_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the noeval distribution])
  dnl fi

  dnl # --with-noeval -> add include path
  dnl PHP_ADD_INCLUDE($NOEVAL_DIR/include)

  dnl # --with-noeval -> check for lib and symbol presence
  dnl LIBNAME=noeval # you may want to change this
  dnl LIBSYMBOL=noeval # you most likely want to change this

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $NOEVAL_DIR/$PHP_LIBDIR, NOEVAL_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_NOEVALLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong noeval lib version or lib not found])
  dnl ],[
  dnl   -L$NOEVAL_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(NOEVAL_SHARED_LIBADD)

  PHP_NEW_EXTENSION(noeval, noeval.c, $ext_shared)
fi
