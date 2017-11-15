%Filename: AAAI.bst
% BibTeX `aaai' style file for BibTeX version 0.99c, LaTeX version 2.09
% Version of 22 February 2008
% Place it in a file called aaai.bst in the BibTeX search path. (Placing it
% in the same directory as the LaTeX document should also work.)
% Support for named citations is provided by named.sty
% This version was made by modifying the master file made by
% Oren Patashnik (PATASHNIK@SCORE.STANFORD.EDU)
% Copyright (C) 1985, all rights reserved.
% Modifications Copyright (C) 1988, 1989, 1994, Peter F. Patel-Schneider
% Copying of this file is authorized only if either
% (1) you make absolutely no changes to your copy, including name, or
% (2) if you do make changes, you name it something other than
% btxbst.doc, plain.bst, unsrt.bst, alpha.bst, and abbrv.bst.
% This restriction helps ensure that all standard styles are identical.
% This style is NOT guaranteed to work. It is provided in the hope
% that it will make the preparation of papers easier.
%
% There are undoubtably bugs in this style. If you make bug fixes,
% improvements, etc. please us know (www.aaai.org)
% The preparation of this modified file was supported by Schlumberger Palo
% Alto Research and AT\&T Bell Laboratories.
% Modifications Copyright (C) 1990. Sunil Issar si@cs.cmu.edu
% Modified the file so that the Bibliography style is closer to the
% one specified in the Instructions to Authors for AAAI papers.
% This style is NOT guaranteed to work. It is provided in the hope
% that it will make the preparation of papers easier.
% Standard disclaimers apply. Send comments etc., to si@cs.cmu.edu
% This file can be used in other conferences as long as credit to the
% authors and supporting agencies is retained, this notice is not changed,
% and further modification or reuse is not restricted. 
%  Name format in citations: 
% single authorFirst
% two authorsFirst and Second
% three authorsFirst, Second, and Third
% more authorsFirst et al.
%
% Bibliography format
% author. date. other.
% Author format
% single authorFirst, Initials
% two authorsFirst, Initials, and Second, Initials
% more authorsFirst, Initials; ...; and Last, Initials
%
% Reference list ordering: alphabetical by author or whatever passes
% for author in the absence of one.
%
% This BibTeX style has support for short (year only) citations. This
% is done by having the citations actually look like
%  \citeauthoryear{author-info}{year}
% The LaTeX style has to have support for this
ENTRY
{ address
author
booktitle
chapter
edition
editor
howpublished
institution
journal
key
month
note
number
organization
pages
publisher
school
series
title
type
volume
year
}
{}
{ label extra.label sort.label }
INTEGERS { output.state before.all mid.sentence after.sentence after.block }
FUNCTION {init.state.consts}
{ #0 'before.all :=
#1 'mid.sentence :=
#2 'after.sentence :=
#3 'after.block :=
}
STRINGS { s t }
FUNCTION {output.nonnull}
{ 's :=
output.state mid.sentence =
{ ", " * write$ }
{ output.state after.block =
{ add.period$ write$
newline$
"\newblock " write$
}
{ output.state before.all =
'write$
{ add.period$ " " * write$ }
if$
}
if$
mid.sentence 'output.state :=
}
if$
s
}
FUNCTION {sioutput.nonnull}
{ 's :=
output.state mid.sentence =
{ " " * write$ }
{ output.state after.block =
{ add.period$ write$
newline$
"\newblock " write$
}
{ output.state before.all =
'write$
{ add.period$ " " * write$ }
if$
}
if$
mid.sentence 'output.state :=
}
if$
s
}
FUNCTION {output}
{ duplicate$ empty$
'pop$
'output.nonnull
if$
}
FUNCTION {sioutput}
{ duplicate$ empty$
'pop$
'sioutput.nonnull
if$
}
FUNCTION {output.check}
{ 't :=
duplicate$ empty$
{ pop$ "empty " t * " in " * cite$ * warning$ }
'output.nonnull
if$
}
FUNCTION {output.bibitem}
{ newline$
"\bibitem[" write$
label write$
"]{" write$
cite$ write$
"}" write$
newline$
""
before.all 'output.state :=
}
FUNCTION {fin.entry}
{ add.period$
write$
newline$
}
FUNCTION {new.block}
{ output.state before.all =
'skip$
{ after.block 'output.state := }
if$
}
FUNCTION {new.sentence}
{ output.state after.block =
'skip$
{ output.state before.all =
'skip$
{ after.sentence 'output.state := }
if$
}
if$
}
FUNCTION {not}
{  { #0 