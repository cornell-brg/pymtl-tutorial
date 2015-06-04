%=========================================================================
% CBX Document Class
%=========================================================================
% This class file is for generic documents such as reports, problem sets,
% and laboratory assignments. It uses the Palatino font which is a nice
% sans serif font, and at least a little more modern than the ironically
% named Computer Modern default. The class file puts the title and
% subtitle at the top of each page and page numbers are centered at the
% bottom.
%
% Author : Christopher Batten
% Date   : September 6, 2010
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxdoc}[2010/09/06 ver 0.1]
\LoadClass[10pt]{article}

%-------------------------------------------------------------------------
% Packages
%-------------------------------------------------------------------------

\RequirePackage[T1]{fontenc}  % Make sure we use T1 font encoding
\RequirePackage{mathpazo}     % Use palatino for serif font
\linespread{1.05}             % http://www.tug.dk/FontCatalogue/palatino

\RequirePackage{geometry}     % Page layout
\RequirePackage{caption}      % Flexibly configure captions
\RequirePackage{subfig}       % -> we should move to subcaption soon
\RequirePackage{graphicx}     % To include graphics
\RequirePackage{textcomp}     % For non-math characters (eg. mu)
\RequirePackage{cite}         % Sort cite lists [1,2,3]
\RequirePackage{fancyhdr}     % For headers and footers
\RequirePackage{booktabs}     % Very nice table formatting
\RequirePackage{xcolor}       % Colored text
\RequirePackage{datetime}     % Date/time formatting
\RequirePackage{url}          % Format URLs
\RequirePackage{fancyvrb}     % Pretty code formatting
\RequirePackage{array}        % More table options
\RequirePackage{tikz}
\RequirePackage{titlesec}
\RequirePackage{rotating}
\RequirePackage{listings}
\RequirePackage{bold-extra}
\RequirePackage{afterpage}
\RequirePackage{marginnote}
\RequirePackage{pifont}
\RequirePackage{verbatim}
\RequirePackage{varwidth}
\RequirePackage{etoolbox}
%\RequirePackage{floatpag}

\RequirePackage{calc}         % Basic math operations
\RequirePackage{xifthen}      % Conditional code

%-------------------------------------------------------------------------
% Document Parameters
%-------------------------------------------------------------------------

\renewcommand{\title}[1]      {\gdef\cbx@title{#1}}
\newcommand{\subtitle}[1]     {\gdef\cbx@subtitle{#1}}
\renewcommand{\author}[1]     {\gdef\cbx@author{#1}}
\newcommand{\institution}[1]  {\gdef\cbx@institution{#1}}

%-------------------------------------------------------------------------
% Misc Setup
%-------------------------------------------------------------------------

\preto{\@verbatim}{\topsep=0.2em \partopsep=0.2em }

% This may be a bad idea?
% http://tex.stackexchange.com/questions/20890/define-an-escape-underscore-environment

\catcode`\_=12

\reversemarginpar
\newcommand{\cbxstar}{\mbox{}\marginnote{\ding{72}}}

% Setup date/time formats suitable for revision numbers

\newdateformat{revdate}{\THEYEAR-\twodigit{\THEMONTH}-\twodigit{\THEDAY}}
\newtimeformat{revtime}{\twodigit{\THEHOUR}-\twodigit{\THEMINUTE}}

% Paragraph setup

\setlength{\parskip}{0.6em}
\setlength{\parindent}{0pt}

% Float spacing

\setlength{\floatsep}{0.15in}
\renewcommand{\floatpagefraction}{0.9}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.9}
\renewcommand{\textfraction}{0.1}
\setcounter{totalnumber}{50}
\setcounter{topnumber}{50}
\setcounter{bottomnumber}{50}

% Widows and orphans

\widowpenalty10000
\clubpenalty10000

%-------------------------------------------------------------------------
% Page Layout
%-------------------------------------------------------------------------
% A margin of 1.2in seems to be a good compromise between number of
% characters per line vs. compactness.

\geometry
{%
  margin=1.2in,
  marginparsep=0.11in,
  headheight=15pt,
}

%-------------------------------------------------------------------------
% Header/Footers
%-------------------------------------------------------------------------
% We put the title and subtitle in the header and the page numbers are
% centered in the footer.

\fancypagestyle{mainpagestyle}%
{%
  \fancyhead{}%
  \fancyfoot{}%
  %
  % Header Left
  %
  \fancyhead[L]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@title}%
    }{}%
  }%
  %
  % Header Center
  %
  \fancyhead[C]
  {%
    \ifthenelse{ \isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@title}%
    }{}%
  }%
  %
  % Header Right
  %
  \fancyhead[R]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@subtitle}%
    }{}%
  }%
  %
  % Footer
  %
  \fancyfoot[C]{\thepage}%
}%

\fancypagestyle{nopagenumpagestyle}%
{%
  \fancyhead{}%
  \fancyfoot{}%
  %
  % Header Left
  %
  \fancyhead[L]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@title}%
    }{}%
  }%
  %
  % Header Center
  %
  \fancyhead[C]
  {%
    \ifthenelse{ \isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@title}%
    }{}%
  }%
  %
  % Header Right
  %
  \fancyhead[R]
  {%
    \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
    {%
      \textit{\cbx@subtitle}%
    }{}%
  }%
}%

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\pagestyle{mainpagestyle}

%-------------------------------------------------------------------------
% Title Block
%-------------------------------------------------------------------------

\renewcommand{\@maketitle}
{%
  \centering%
  %
  % Title
  %
  {\Large\textbf{\cbx@title}\par}%
  %
  % Subtitle
  %
  \ifthenelse{ \NOT\isundefined{\cbx@subtitle} }%
  {%
    {\Large\textbf{\cbx@subtitle}\par}%
  }{}%
  %
  % Author
  %
  \ifthenelse{ \NOT\isundefined{\cbx@author} }%
  {%
    \vspace{0.15in}%
    {\large\cbx@author\par}%
  }{}%
  %
  % Institution
  %
  \ifthenelse{ \NOT\isundefined{\cbx@institution} }%
  {%
    \vspace{0.1in}%
    {\cbx@institution\par}%
  }{}%
  %
  % Revision
  %
  \vspace{0.1in}%
  revision: \revdate\today{}-\revtime\par%
  %
  \thispagestyle{empty}%
}

%-------------------------------------------------------------------------
% Section Formatting
%-------------------------------------------------------------------------

\titleformat{\section}
  {\normalfont\bfseries\large}
  {\thesection.}
  {1.5ex}{}{}

\titlespacing{\section}{0pt}{*2}{*1}

\titleformat{\subsection}
  {\normalfont\bfseries}
  {\thesubsection.}
  {1.5ex}{}{}

\titleformat{\subsubsection}
  {\normalfont\itshape}
  {}
  {0ex}{}{}

\titlespacing{\subsection}{0pt}{*1}{*1}
% \renewcommand{\thesubsection}{\thesection.\Alph{subsection}}

\titlespacing{\subsubsection}{0pt}{*2}{*1}

%-------------------------------------------------------------------------
% \cbxarticle@setfontsize{pts} Macro
%-------------------------------------------------------------------------
% We explicitly set the font sizes in points so that we know exactly how
% big each font. Subsection headers are supposed to be 11pt, but there
% is no equivalent built-in LaTeX font size which corresponds to 11pt
% (normalsize is 10pt and large is 12pt). Notice we always calculate the
% the line spacing to be 1.2 times the font size.

\newlength{\cbxarticle@Templen}
\newcommand{\cbxsetfontsize}[1]
{%
  \setlength{\cbxarticle@Templen}{#1 * \real{1.19}}%
  \fontsize{#1}{\the\cbxarticle@Templen}\selectfont%
}

%-------------------------------------------------------------------------
% Caption Setup
%-------------------------------------------------------------------------

\DeclareCaptionFont{capfont}{\cbxsetfontsize{9pt}}
\newcommand{\cbxcaptionsize}{\cbxsetfontsize{9pt}}

\captionsetup
{%
  font={capfont},%
  labelfont={bf},%
  skip=8pt%
}

%-------------------------------------------------------------------------
% Colors
%-------------------------------------------------------------------------

\definecolor{cbxgreenA}    {RGB}{230, 248, 219}
\definecolor{cbxgreenB}    {RGB}{190, 227, 169}
\definecolor{cbxgreenC}    {RGB}{ 88, 171,  30}
\definecolor{cbxgreenD}    {RGB}{ 42,  76,  19}
\definecolor{cbxblueA}     {RGB}{223, 238, 255}
\definecolor{cbxblueB}     {RGB}{183, 206, 233}
\definecolor{cbxblueC}     {RGB}{ 69, 136, 214}
\definecolor{cbxblueD}     {RGB}{ 20,  50,  85}
\definecolor{cbxbrownA}    {RGB}{247, 243, 204}
\definecolor{cbxbrownB}    {RGB}{213, 205, 124}
\definecolor{cbxbrownC}    {RGB}{143, 132,  19}
\definecolor{cbxbrownD}    {RGB}{ 84,  67,   0}
\definecolor{cbxredA}      {RGB}{254, 217, 217}
\definecolor{cbxredB}      {RGB}{223, 167, 159}
\definecolor{cbxredC}      {RGB}{176,  24,  24}
\definecolor{cbxredD}      {RGB}{ 98,   9,   9}

%-------------------------------------------------------------------------
% Compact formatting
%-------------------------------------------------------------------------

\newcommand{\TT}[1]{\texttt{#1}}
\newcommand{\BF}[1]{\textbf{#1}}
\newcommand{\IT}[1]{\textit{#1}}
\newcommand{\RM}[1]{\textrm{#1}}
\newcommand{\RD}[1]{\textcolor[RGB]{202,0,32}{#1}}

%-------------------------------------------------------------------------
% Table row formatting
%-------------------------------------------------------------------------

\newcolumntype{+}
{%
  >{\global\let\currentrowstyle\relax}%
}

\newcolumntype{^}
{%
  >{\currentrowstyle}%
}

\newcommand{\rs}
{%
  \gdef\currentrowstyle{\lastrowstyle}%
  \lastrowstyle\ignorespaces%
}

\newcommand{\rowstyle}[1]
{%
  \gdef\lastrowstyle{#1}%
  \gdef\currentrowstyle{#1}%
  #1\ignorespaces%
}

%-------------------------------------------------------------------------
% Code block formatting
%-------------------------------------------------------------------------

\gdef\cbx@verblinenum{off}
\newcommand{\verblinenum}[1]{\gdef\cbx@verblinenum{#1}}

\renewcommand{\FancyVerbFormatLine}[1]
{%
  \ifthenelse{ \equal{\cbx@verblinenum}{on} }%
  {%
    \parbox{0.5ex}{\raggedleft\theFancyVerbLine} #1%
  }{%
    #1
  }%
}

\newenvironment{code}%
{%
  \vspace{-0.05in}%
}{%
  \vspace{-0.05in}%
}

%-------------------------------------------------------------------------
% Lists
%-------------------------------------------------------------------------

\newenvironment{cbxlist}[4][\textbullet]
{%
  \begin{list}{#1}
  {%
    \setlength{\leftmargin}{#2}
    \setlength{\rightmargin}{#3}
    \setlength{\topsep}{0pt}
    \setlength{\parsep}{0pt}
    \setlength{\listparindent}{0pt}
    \setlength{\itemsep}{#4}
  }
}{%
  \end{list}
}

%-------------------------------------------------------------------------
% Task
%-------------------------------------------------------------------------

% \newenvironment{task}
% {%
%   \rule[0.4em]{\tw}{0.5pt}
%   \cbxstar\textit{To-Do On Your Own:}\hspace{-0.05in}
% }{%
%   \par
%   \rule[0.6em]{\tw}{0.5pt}%
%
%   \vspace{-0.05in}
% }

\newlength{\templen}
\newsavebox{\taskbox}
\newenvironment{task}
{%
  \begin{lrbox}{\taskbox}%
  \hspace{0.05in}%
  \setlength{\templen}{\textwidth-0.22in}
  \begin{minipage}{\templen}
    \setlength{\parskip}{0.5em}
    \vspace{0.01in}
    \cbxstar\textit{To-Do On Your Own:}\hspace{-0.05in}
}{%
    \vspace{0.07in}
  \end{minipage}
  \end{lrbox}

  \vspace*{0.05in}
  \colorbox{gray!10!white}{\parbox{0.99\tw}{\usebox{\taskbox}}}
}

%-------------------------------------------------------------------------
% Simple Macros
%-------------------------------------------------------------------------

\newcommand{\fixme}[1]{{\color{red}\bfseries [ FIXME: #1 ]}}
\newcommand{\wu}[2]{\mbox{#1\,#2}}
\newcommand{\um}{\mbox{\textmu m}}
\newcommand{\X}{$\times$}
\newcommand{\x}{\thinspace$\times$\thinspace}
\newcommand{\by}{$\times$}
\newcommand{\tw}{\textwidth}
\newcommand{\cw}{\columnwidth}

\renewcommand{\paragraph}[1]
{%
  \textbf{#1} --%
}

