
# how to deal with lua lexer stuff to make loadable long string.

-- in lua source code 
-- the function read_long_string used to process long string ...
-- ENDOFLINE = < "\n" | "\r" | "\r\n" | "\n\r"> 
-- * drop the first 1-2 character if it match ENDOFLINE
-- * split each line at ENDOFLINE

-- [1]:
-- llex.c:264:static void read_long_string (LexState *ls, SemInfo *seminfo, int sep) {

-- [1a]:
-- llex.c:267:  if (currIsNewline(ls))  /* string starts with a newline? */
-- llex.c-268-    inclinenumber(ls);  /* skip it */

-- [2]:
-- llex.c:148:** increment line number and skips newline sequence (any of
-- llex.c-149-** \n, \r, \n\r, or \r\n)


```
io.open("end-of-line.lua", "w"):write( ("return assert([[A\nB\rC\r\nD\n\rE]]==%s)"):format([["A\nB\nC\nD\nE"]]) )
```
