%=========================================================================
% CBX Slides Class
%=========================================================================
% This is a class for creating technical presentations.
%
% Author : Christopher Batten
% Date   : January 6, 2009
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxslides}[2008/08/17 ver 0.1]

%-------------------------------------------------------------------------
% Class Options
%-------------------------------------------------------------------------

\gdef\cbx@handoutopt{}

\DeclareOption{handout}
{%
  \gdef\cbx@handout{handout}%
  \gdef\cbx@handoutopt{,handout}%
}

\ProcessOptions

%-------------------------------------------------------------------------
% Base Class
%-------------------------------------------------------------------------

\LoadClass[t,mathsans,hyperref={draft}\cbx@handoutopt]{beamer}

%-------------------------------------------------------------------------
% Packages
%-------------------------------------------------------------------------

\RequirePackage{eulervm}
\RequirePackage[scaled]{helvet}
\RequirePackage{tikz}

\RequirePackage{svg}          % Automatically handle svg files
\RequirePackage{graphicx}     % To include graphics
\RequirePackage{dblfloatfix}  % Fixes some issues with dbl col floats
\RequirePackage{textcomp}     % For non-math characters (eg. mu)
\RequirePackage{cite}         % Sort cite lists [1,2,3]
\RequirePackage{balance}      % Balance last columns
\RequirePackage{fancyhdr}     % For headers and footers
\RequirePackage{booktabs}     % Very nice table formatting
\RequirePackage{datetime}     % Allow date/time revision numbers
\RequirePackage{calc}         % Basic math operations
\RequirePackage{xifthen}      % Conditional code
\RequirePackage{array}        % Better table handling
\RequirePackage{multirow}     % Table cell stretch across multiple rows
\RequirePackage{varwidth}     % Variable width minipages
\RequirePackage{relsize}      % Relative font sizes
\RequirePackage{fancyvrb}     % Pretty code formatting
\RequirePackage{listings}
\RequirePackage{pifont}
\RequirePackage{colortbl}

%-------------------------------------------------------------------------
% Document Parameters
%-------------------------------------------------------------------------

\gdef\cbx@title{}
\gdef\cbx@subtitle{}
\gdef\cbx@author{}
\gdef\cbx@affiliation{}
\gdef\cbx@abbrvinst{}

\gdef\cbx@name{}
\gdef\cbx@address{}
\gdef\cbx@email{}
\gdef\cbx@web{}

\renewcommand{\title}[1]{\gdef\cbx@title{#1}}
\renewcommand{\subtitle}[1]{\gdef\cbx@subtitle{#1}}
\renewcommand{\author}[1]{\gdef\cbx@author{#1}}
\newcommand{\affiliation}[1]{\gdef\cbx@affiliation{#1}}
\newcommand{\abbrvinst}[1]{\gdef\cbx@abbrvinst{#1}}

\newcommand{\name}[1]{\gdef\cbx@name{#1}}
\newcommand{\address}[1]{\gdef\cbx@address{#1}}
\newcommand{\email}[1]{\gdef\cbx@email{#1}}
\newcommand{\web}[1]{\gdef\cbx@web{#1}}

\newcommand{\headerwidth}[1] {\gdef\cbx@headerwidth{#1}}
\newcommand{\finalslide}[1]  {\gdef\cbx@finalslide{#1}}

%-------------------------------------------------------------------------
% Misc Setup
%-------------------------------------------------------------------------

% Setup date/time formats suitable for revision numbers

\newdateformat{revdate}{\THEYEAR-\twodigit{\THEMONTH}-\twodigit{\THEDAY}}
\newtimeformat{revtime}{\twodigit{\THEHOUR}-\twodigit{\THEMINUTE}}

% By default included graphics should be less than textwidth x textheight

%\setkeys{Gin}{width=\textwidth,height=2.75in,keepaspectratio}

%-------------------------------------------------------------------------
% \cbx@setfontsize{pts} Macro
%-------------------------------------------------------------------------
% We explicitly set the font sizes in points so that we know exactly how
% big each font. Notice we always calculate the the line spacing to be
% 1.2 times the font size.

\newlength{\cbx@templen}
\newcommand{\cbxsetfontsize}[1]
{%
  \setlength{\cbx@templen}{#1 * \real{1.2}}%
  \fontsize{#1}{\the\cbx@templen}\selectfont%
}

%-------------------------------------------------------------------------
% Beamer Colors
%-------------------------------------------------------------------------

\mode<presentation>

\selectcolormodel{rgb}

\definecolor{cbxgreenA}    {RGB}{230, 248, 219}
\definecolor{cbxgreenB}    {RGB}{190, 227, 169}
\definecolor{cbxgreenC}    {RGB}{ 88, 171,  30}
\definecolor{cbxgreenD}    {RGB}{ 42,  76,  19}
\definecolor{cbxbluegreen} {RGB}{ 19,  76,  51}
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
\definecolor{cbxblueitem}  {RGB}{ 40, 100, 150}
\definecolor{dmlgrayBG}    {RGB}{240, 240, 240}
\definecolor{dmlgrayTXT}   {RGB}{ 54,  54,  54}
%\definecolor{dmlgrayTXT}   {RGB}{ 64,  64,  64}
%\definecolor{dmlgrayFOOT}  {RGB}{150, 150, 150}

\colorlet{cbxschemeA}{cbxblueA}
\colorlet{cbxschemeB}{cbxblueB}
\colorlet{cbxschemeC}{cbxblueC}
%\colorlet{cbxschemeD}{cbxblueD}
\colorlet{cbxschemeD}{dmlgrayTXT}

\setbeamercolor{palette primary}
{%
  use=structure,
  fg=black,
  bg=structure.fg!20!white
}

\setbeamercolor{palette secondary}
{%
  use=structure,
  fg=black,
  bg=structure.fg!25!white
}

\setbeamercolor{palette tertiary}
{%
  use=structure,
  fg=black,
  bg=structure.fg!30!white
}

\setbeamercolor{palette quaternary}
{%
  use=structure,
  fg=black,
  bg=structure.fg!35!white
}

\setbeamercolor{structure}{fg=black}
\setbeamercolor{cbxheadline}{fg=cbxschemeD,bg=white}
\setbeamercolor{cbxfootline}{fg=cbxschemeD!40!white,bg=white}
\setbeamercolor*{titlelike}{bg=white,fg=black}
\setbeamercolor*{separation line}{}
\setbeamercolor*{fine separation line}{}
%\setbeamercolor{section in head/foot}{palette quaternary}
\setbeamercolor{section in head/foot}{fg=black,bg=white}
\setbeamercolor{frametitle}{bg=white,fg=black}
\setbeamercolor{itemize item}{fg=cbxblueD}
\setbeamercolor{itemize subitem}{fg=cbxblueD}

\setbeamertemplate{subsection in toc}%
{%
  \vspace*{0.03in}\hspace*{0.1in}\inserttocsubsection\par%
}

\mode
<all>

%-------------------------------------------------------------------------
% Beamer Fonts
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamerfont{normal text}{} % ignored currently
\setbeamerfont{alerted text}{}
\setbeamerfont{example text}{}

\setbeamerfont{structure}{}
\setbeamerfont{tiny structure}{size=\tiny}

\setbeamerfont{title}{size=\Large,parent=structure}
\setbeamerfont{title in head/foot}{}
\setbeamerfont{title in sidebar}{size=\tiny}

\setbeamerfont{subtitle}{size=\normalsize,parent=title}

\setbeamerfont{author}{}
\setbeamerfont{author in head/foot}{}
\setbeamerfont{author in sidebar}{size=\tiny}

\setbeamerfont{institute}{size=\scriptsize}
\setbeamerfont{institute in head/foot}{}
\setbeamerfont{institute in sidebar}{}

\setbeamerfont{date}{}
\setbeamerfont{date in head/foot}{}
\setbeamerfont{date in sidebar}{}

\setbeamerfont{part name}{size=\Large}
\setbeamerfont{part title}{parent=title}

\setbeamerfont{section in toc}{size=\Large}
\setbeamerfont{section in toc shaded}{parent=section in toc}
\setbeamerfont{section in head/foot}{}
\setbeamerfont{section in sidebar}{size=\tiny}
\setbeamerfont{section number projected}{size=\small,parent={section in toc,projected text}}

\setbeamerfont{subsection in toc}{size=\large}
\setbeamerfont{subsection in toc shaded}{parent=subsection in toc}
\setbeamerfont{subsection in head/foot}{}
\setbeamerfont{subsection in sidebar}{}

\setbeamerfont{subsubsection in toc}{size=\footnotesize}
\setbeamerfont{subsubsection in toc shaded}{parent=subsubsection in toc}
\setbeamerfont{subsubsection in head/foot}{}
\setbeamerfont{subsubsection in sidebar}{}

\setbeamerfont{headline}{parent={tiny structure}}
\setbeamerfont{footline}{parent={tiny structure}}

\setbeamerfont{sidebar}{size=\Tiny,parent={tiny structure}}
\setbeamerfont{sidebar left}{parent=sidebar}
\setbeamerfont{sidebar right}{parent=sidebar}

\setbeamerfont{frametitle}{parent=structure,size=\Large}
\setbeamerfont{framesubtitle}{parent=frametitle,size=\footnotesize}

\setbeamerfont{caption}{size=\small}
\setbeamerfont{caption name}{parent={structure,caption}}

\setbeamerfont{button}{size=\tiny}

\setbeamerfont{block body}{}
\setbeamerfont{block body alerted}{}
\setbeamerfont{block body example}{}
\setbeamerfont{block title}{size=\large,parent={structure,block body}}
\setbeamerfont{block title alerted}{parent={block title,alerted text}}
\setbeamerfont{block title example}{parent={block title,example text}}

\setbeamerfont{item}{parent=structure}
\setbeamerfont{subitem}{parent=item}
\setbeamerfont{subsubitem}{parent=subitem}

\setbeamerfont{item projected}{size=\tiny,parent={item,projected text}}
\setbeamerfont{subitem projected}{parent=item projected}
\setbeamerfont{subsubitem projected}{parent=subitem projected}

\setbeamerfont{itemize item}{parent=item}
\setbeamerfont{itemize subitem}{parent=subitem}
\setbeamerfont{itemize subsubitem}{parent=subsubitem}

\setbeamerfont{enumerate item}{parent=item}
\setbeamerfont{enumerate subitem}{parent=subitem}
\setbeamerfont{enumerate subsubitem}{parent=subsubitem}

\setbeamerfont{itemize/enumerate body}{}
\setbeamerfont{itemize/enumerate subbody}{size=\small}
\setbeamerfont{itemize/enumerate subsubbody}{size=\footnotesize}

\setbeamerfont{description item}{parent=item}

\setbeamerfont{projected text}{parent={tiny structure}}

\setbeamerfont{abstract}{size=\small}
\setbeamerfont{abstract title}{parent={abstract,structure},size=\normalsize}

\setbeamerfont{verse}{family=\rmfamily,shape=\itshape}

\setbeamerfont{quotation}{shape=\itshape}
\setbeamerfont{quote}{parent=quotation}

\setbeamerfont{note page}{size=\small}

\setbeamerfont{title}{size=\Large,series=\bfseries}
\setbeamerfont{author}{size=\normalsize}
\setbeamerfont{institute}{size=\scriptsize}

\mode
<all>

%-------------------------------------------------------------------------
% Misc Configuration
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamertemplate{itemize subitem}{$\triangleright$}
\setbeamertemplate{navigation symbols}{}

\setbeamersize{text margin left=0.2in,text margin right=0.2in}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\fboxsep}{0pt}

\setlength{\smallskipamount}{0.08in}
\setlength{\medskipamount}{0.24in}
\setlength{\bigskipamount}{0.72in}

\setlength{\abovedisplayshortskip}{0pt}
\setlength{\belowdisplayshortskip}{0pt}
\setlength{\abovedisplayskip}{0pt}
\setlength{\belowdisplayskip}{0pt}

\mode
<all>

%-------------------------------------------------------------------------
% Headline Template
%-------------------------------------------------------------------------

\mode<presentation>

% Format for current and non-current section names in the header
\usesectionheadtemplate
  % Current section
  {\hfill{\color{cbxschemeD}\textbf{$\Big($~\parbox{0.5in}{\centering\insertsectionhead\vphantom{g}\rule{0pt}{1em}}}~$\Big)$}}
  % Non-current section
  {\hfill{\color{cbxschemeD!40!bg}\parbox{0.5in}{\centering\insertsectionhead\vphantom{g}\rule{0pt}{1em}}}}

\setbeamertemplate{headline}
{%
  \begin{beamercolorbox}
%    [wd=\paperwidth,ht=2.5ex,dp=1.2ex]{cbxheadline}%
%    \centerline{\insertsectionnavigationhorizontal{\cbx@headerwidth}{}{}}%
    [wd=\paperwidth,ht=4ex,dp=2.4ex]{cbxheadline}%
    \centerline{\insertsectionnavigationhorizontal{\cbx@headerwidth}{}{}}%
  \end{beamercolorbox}%
  %{\color{cbxschemeD}\rule{\paperwidth}{0.25pt}}
}

\mode
<all>

%-------------------------------------------------------------------------
% Title Page Template
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamertemplate{title page}
{%
  \tiny
  \vspace{-1.9ex}
  \begin{beamercolorbox}
    [wd=\paperwidth,ht=2.5ex,dp=1.2ex]{cbxheadline}
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=\paperwidth,ht=0pt,dp=0pt]{}
    %{\color{cbxschemeD}\rule[0.045in]{\paperwidth}{0.25pt}}
  \end{beamercolorbox}%
  \vskip0pt plus 1filll
  \normalsize
  \vskip2ex
  \begin{centering}
%    \vspace{0.1in}
%    {\cbxsetfontsize{14pt}\cbx@subtitle\par}%
    \vspace{0.1in}
    {\cbxsetfontsize{16pt}\textbf{\cbx@title}\par}%
    \vspace{0.2in}
    {\cbxsetfontsize{14pt}\cbx@author\par}%
    \vspace{0.2in}
    {\cbxsetfontsize{11pt}\cbx@affiliation\par}%
    \vspace{0.2in}
  \end{centering}
  \vskip0pt plus 1filll
  \tiny
  \begin{beamercolorbox}[wd=\paperwidth,ht=0pt,dp=0pt]{}
    %{\color{cbxschemeD}\rule[-0.013in]{\paperwidth}{0.25pt}}
  \end{beamercolorbox}%
  \begin{beamercolorbox}
    [wd=\paperwidth,ht=2.5ex,dp=1.2ex]{cbxfootline}
  \end{beamercolorbox}%
}

\mode
<all>

%-------------------------------------------------------------------------
% Frame Title Template
%-------------------------------------------------------------------------

\mode<presentation>

\newcounter{taskseccount}
\newcounter{taskcount}[taskseccount]
\gdef\cbx@task{false}

\newenvironment{task}
{%
  \gdef\cbx@task{true}%
}{%
  \gdef\cbx@task{false}%
}

\setbeamertemplate{frametitle}
{%
  \ifbeamercolorempty[bg]{frametitle}{}{\nointerlineskip}%
  \@tempdima=\textwidth%
  \advance\@tempdima by\beamer@leftmargin%
  \advance\@tempdima by\beamer@rightmargin%
  \begin{beamercolorbox}[sep=0.3cm,left,wd=\the\@tempdima]{frametitle}
    \centering%
    \usebeamerfont{frametitle}%
    \vbox{}\vskip-1ex%
    \if@tempswa\else\csname beamer@fteleft\endcsname\fi%
    \strut\textbf{%
    \ifthenelse{ \equal{\cbx@task}{true} }%
    {%
      \stepcounter{taskcount}
      \textcolor{cbxredC}{\ding{72} Task \thetaskseccount{}.\thetaskcount{}:~%
      \insertframetitle{}%
      ~\ding{72}}%
    }{%
      \insertframetitle{}%
    }%
    }\strut\par%
    {%
      \ifx\insertframesubtitle\@empty%
      \else%
      {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}\insertframesubtitle\strut\par}%
      \fi%
    }%
    \vskip-1.5ex%
    \if@tempswa\else\vskip-.3cm\fi% set inside beamercolorbox... evil here...
    \ifthenelse{ \equal{\cbx@task}{true} }%
    {%
      \textcolor{cbxredC}{\rule{0.95\paperwidth}{0.5pt}}%
    }{%
      \rule{0.95\paperwidth}{0.5pt}%
    }%
  \end{beamercolorbox}%
  \vspace*{-0.1in}%
}

\mode
<all>

%-------------------------------------------------------------------------
% Footline Template
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamertemplate{footline}
{%
  %{\color{cbxschemeD}\rule{\paperwidth}{0.25pt}}
  \begin{beamercolorbox}
    [wd=\paperwidth,ht=2.3ex,dp=1.4ex,
     leftskip=.15cm,rightskip=.15cm]{cbxfootline}
    \parbox{0.5in}{\cbx@abbrvinst} \hfill \cbx@name \hfill \parbox{0.5in}{\hfill\insertframenumber~/~\cbx@finalslide}
    %\parbox{1in}{\cbx@abbrvinst} \hfill \cbx@name \hfill \parbox{1in}{\hfill??~/~??}
  \end{beamercolorbox}%
  \vskip0pt%
}

\mode
<all>

%-------------------------------------------------------------------------
% Handouts
%-------------------------------------------------------------------------

\mode<handout>
{%
  \RequirePackage{pgfpages}
  \pgfpagesuselayout{resize to}[letterpaper,landscape,border shrink=0.25in]
  \pgfpageslogicalpageoptions{1}{border code=\pgfstroke}

%  \pgfpagesphysicalpageoptions
%  {%
%    logical pages=6,%
%    physical height=11in,%
%    physical width=8.5in,%
%  }
%
%  \pgfpageslogicalpageoptions{1}
%  {%
%    resized width=.47\pgfphysicalwidth,%
%    resized height=0.33\pgfphysicalheight,%
%    center=\pgfpoint{.265\pgfphysicalwidth}{.795\pgfphysicalheight},%
%    border code=\pgfstroke,%
%    border shrink=0.1in,%
%  }
%
%  \pgfpageslogicalpageoptions{2}
%  {%
%    resized width=.47\pgfphysicalwidth,%
%    resized height=0.33\pgfphysicalheight,%
%    center=\pgfpoint{.735\pgfphysicalwidth}{.795\pgfphysicalheight},%
%    border code=\pgfstroke,%
%    border shrink=0.1in,%
%  }
%
%  \pgfpageslogicalpageoptions{3}
%  {%
%    resized width=.47\pgfphysicalwidth,%
%    resized height=0.33\pgfphysicalheight,%
%    center=\pgfpoint{.265\pgfphysicalwidth}{.5\pgfphysicalheight},%
%    border code=\pgfstroke,%
%    border shrink=0.1in,%
%  }
%
%  \pgfpageslogicalpageoptions{4}
%  {%
%    resized width=.47\pgfphysicalwidth,%
%    resized height=0.33\pgfphysicalheight,%
%    center=\pgfpoint{.735\pgfphysicalwidth}{.5\pgfphysicalheight},%
%    border code=\pgfstroke,%
%    border shrink=0.1in,%
%  }
%
%  \pgfpageslogicalpageoptions{5}
%  {%
%    resized width=.47\pgfphysicalwidth,%
%    resized height=0.33\pgfphysicalheight,%
%    center=\pgfpoint{.265\pgfphysicalwidth}{.205\pgfphysicalheight},%
%    border code=\pgfstroke,%
%    border shrink=0.1in,%
%  }
%
%  \pgfpageslogicalpageoptions{6}
%  {%
%    resized width=.47\pgfphysicalwidth,%
%    resized height=0.33\pgfphysicalheight,%
%    center=\pgfpoint{.735\pgfphysicalwidth}{.205\pgfphysicalheight},%
%    border code=\pgfstroke,%
%    border shrink=0.1in,%
%  }
}

\def\h#1{| handout:#1}

% \ifthenelse{ \equal{\cbx@handout}{partialhandout} }
% {%
%   \def\p#1{| handout:#1}
%   \def\H#1{| handout:0}
%   \def\h#1{| handout:#1}
% }{%
%   \def\p#1{| handout:0}
%   \def\H#1{| handout:#1}
%   \def\h#1{| handout:#1}
% }

% Use this macro inside overlay specifications to indicate that the
% corresponding object should only be shown on certain handout pages.
% The following will include the second graphic as the first page of the
% handout and the third graphic as the second page.
%
%  \cbxfig<1\h0>{figure-0.pdf}
%  \cbxfig<2\h1>{figure-1.pdf}
%  \cbxfig<3\h2>{figure-2.pdf}
%
%  - \p : only on partial handout
%  - \H : only on full handout
%  - \h : on both partial and full handout

%-------------------------------------------------------------------------
% Compact formatting
%-------------------------------------------------------------------------

\newcommand{\TT}[1]{\texttt{#1}}
\newcommand{\BF}[1]{\textbf{#1}}
\newcommand{\IT}[1]{\textit{#1}}
\newcommand{\RM}[1]{\textrm{#1}}

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
% Blocks
%-------------------------------------------------------------------------

\newenvironment{cbxblock}[1][\tw]
{%
  \begin{minipage}{#1}\centering%
}{%
  \end{minipage}%
}

\newenvironment{cbxblk}[2][\tw]
{%
  \begin{cbxblock}[#1]%
    #2%
  \end{cbxblock}%
}

\newsavebox{\cbx@cbxblockpbox}
\newenvironment{cbxblockp}[1][0.8\tw]
{%
  \medskip%
  \begin{lrbox}{\cbx@cbxblockpbox}%
  \begin{minipage}{#1}\centering%
}{%
  \end{minipage}%
  \end{lrbox}%
  \setlength{\fboxrule}{1pt}%
  \setlength{\fboxsep}{0.07in}%
  \centerline{\fcolorbox{cbxredC}{white}{\usebox{\cbx@cbxblockpbox}}}%
  \setlength{\fboxsep}{0in}%
}

%-------------------------------------------------------------------------
% Lists
%-------------------------------------------------------------------------
% This is inspired by the outlines package by Charles Pecheur except my
% version only allows two levels of nesting and formats each level
% differently. Supports the following optional specifier:
%
%  - tt, t : tight outer list,  tight inner list
%  - lt    : looser outer list, tight inner list
%  - tl    : tight outer list,  loose inner list
%  - ll, l : loose outer list,  loose inner list
%

\gdef\cbx@outerfontsize{\normalsize}
\gdef\cbx@innerfontsize{\small}

\newcommand{\cbxlistfontsize}[2]
{%
  \gdef\cbx@outerfontsize{#1}%
  \gdef\cbx@innerfontsize{#2}%
}

\newcommand{\cbxlistfontsizereset}
{%
  \cbxlistfontsize{\normalsize}{\small}%
}

\newenvironment{cbxlistbase}[4][\textbullet]
{%
  \begin{list}{#1}%
  {%
    \setlength{\leftmargin}{#2}%
    \setlength{\rightmargin}{#3}%
    \setlength{\topsep}{0pt}%
    \setlength{\parsep}{0pt}%
    \setlength{\listparindent}{0pt}%
    \setlength{\itemsep}{#4}%
    \raggedright%
  }%
}{%
  \end{list}%
}

\newenvironment{cbxlistouter}[1][0.7em]
{%
  \cbx@outerfontsize%
  \begin{cbxlistbase}
    [{\color{cbxblueitem}%
      \raisebox{0.3ex}{$\blacktriangleright$}}]{1.2em}{0em}{#1}%
}{%
  \end{cbxlistbase}%
  \cbx@outerfontsize%
}

\newenvironment{cbxlistoutertight}[1][0.1em]
{%
  \cbx@outerfontsize%
  \begin{cbxlistbase}
    [{\color{cbxblueitem}%
      \raisebox{0.3ex}{$\blacktriangleright$}}]{1.2em}{0em}{#1}%
}{%
  \end{cbxlistbase}%
  \cbx@outerfontsize%
}

\newenvironment{cbxlistinner}[1][0.5em]
{%
  \cbx@innerfontsize%
  \begin{cbxlistbase}
    [{\color{cbxblueitem}%
      $\triangleright$}]{1em}{0em}{#1}%
}{%
  \end{cbxlistbase}%
  \cbx@outerfontsize%
}

\newenvironment{cbxlistinnertight}[1][0.1em]
{%
  \cbx@innerfontsize%
  \begin{cbxlistbase}
    [{\color{cbxblueitem}%
      $\triangleright$}]{1em}{0em}{#1}%
}{%
  \end{cbxlistbase}%
  \cbx@outerfontsize%
}

% The outer and inner list styles

\newcommand{\cbxlist@inci}{}
\newcommand{\cbxlist@deci}{}
\newcommand{\cbxlist@incii}{}
\newcommand{\cbxlist@decii}{}

% \cbxlist@toz .. \cbxlist@toiiii "transition" to indentation level 0..4 by opening
% or closing nested list levels as needed. They are dynamically modified
% according to the current level.

\newcommand{\cbxlist@toz}{}
\newcommand{\cbxlist@toi}{}
\newcommand{\cbxlist@toii}{}

% \cbxlist@commands{C0}{C1}{C2}{C3}{C4} set the level transition commands
% above to C0..C4

\newcommand{\cbxlist@commands}[3]
{%
  \renewcommand{\cbxlist@toz}{#1}%
  \renewcommand{\cbxlist@toi}{#2}%
  \renewcommand{\cbxlist@toii}{#3}%
}

% \cbxlist@exit resets transition commands. Not mandatory, just cleaner

\newcommand{\cbxlist@exit}
{%
  \cbxlist@commands{}{}{}{}{}%
}

% \cbxlist@z .. \cbxlist@iiii update all transitions for level 0..4

\newcommand{\cbxlist@z}
{%
  \cbxlist@commands{}{\cbxlist@inci}{\cbxlist@inci\cbxlist@incii}%
}

\newcommand{\cbxlist@i}
{%
  \cbxlist@commands{\cbxlist@deci}{}{\cbxlist@incii}%
}

\newcommand{\cbxlist@ii}
{%
  \cbxlist@commands{\cbxlist@decii\cbxlist@deci}{\cbxlist@decii}{}%
}

\newcommand{\0}{\cbxlist@toz\cbxlist@z}
\newcommand{\1}{\cbxlist@toi\cbxlist@i\item}
\newcommand{\2}{\cbxlist@toii\cbxlist@ii\item}

\newenvironment{cbxlist}[1][lt]
{%
  % For some reason I need this to avoid weird extra space
  \begin{varwidth}{\tw}%
  \cbxlist@z%
  \ifthenelse{ \equal{#1}{l} }%
  {%
    \renewcommand{\cbxlist@inci}{\begin{cbxlistouter}}%
    \renewcommand{\cbxlist@deci}{\end{cbxlistouter}}%
    \renewcommand{\cbxlist@incii}{\vspace{0.5em}\begin{cbxlistinner}}%
    \renewcommand{\cbxlist@decii}{\end{cbxlistinner}}%
  }{}%
  \ifthenelse{ \equal{#1}{ll} }%
  {%
    \renewcommand{\cbxlist@inci}{\begin{cbxlistouter}}%
    \renewcommand{\cbxlist@deci}{\end{cbxlistouter}}%
    \renewcommand{\cbxlist@incii}{\vspace{0.5em}\begin{cbxlistinner}}%
    \renewcommand{\cbxlist@decii}{\end{cbxlistinner}}%
  }{}%
  \ifthenelse{ \equal{#1}{lt} }%
  {%
    \renewcommand{\cbxlist@inci}{\begin{cbxlistouter}}%
    \renewcommand{\cbxlist@deci}{\end{cbxlistouter}}%
    \renewcommand{\cbxlist@incii}{\vspace{0.2em}\begin{cbxlistinnertight}}%
    \renewcommand{\cbxlist@decii}{\end{cbxlistinnertight}}%
  }{}%
  \ifthenelse{ \equal{#1}{tl} }%
  {%
    \renewcommand{\cbxlist@inci}{\begin{cbxlistoutertight}}%
    \renewcommand{\cbxlist@deci}{\end{cbxlistoutertight}}%
    \renewcommand{\cbxlist@incii}{\vspace{0.1em}\begin{cbxlistinner}}%
    \renewcommand{\cbxlist@decii}{\end{cbxlistinner}}%
  }{}%
  \ifthenelse{ \equal{#1}{tt} }%
  {%
    \renewcommand{\cbxlist@inci}{\begin{cbxlistoutertight}}%
    \renewcommand{\cbxlist@deci}{\end{cbxlistoutertight}}%
    \renewcommand{\cbxlist@incii}{\vspace{0.1em}\begin{cbxlistinnertight}}%
    \renewcommand{\cbxlist@decii}{\end{cbxlistinnertight}}%
  }{}%
  \ifthenelse{ \equal{#1}{t} }%
  {%
    \renewcommand{\cbxlist@inci}{\begin{cbxlistoutertight}}%
    \renewcommand{\cbxlist@deci}{\end{cbxlistoutertight}}%
    \renewcommand{\cbxlist@incii}{\vspace{0.1em}\begin{cbxlistinnertight}}%
    \renewcommand{\cbxlist@decii}{\end{cbxlistinnertight}}%
  }{}%
}{%
  \cbxlist@toz\cbxlist@exit%
  \renewcommand{\cbxlist@inci}{}%
  \renewcommand{\cbxlist@deci}{}%
  \renewcommand{\cbxlist@incii}{}%
  \renewcommand{\cbxlist@decii}{}%
  \end{varwidth}\par%
}

%-------------------------------------------------------------------------
% Float right
%-------------------------------------------------------------------------

\newlength{\cbx@floatrightboxheight}
\newsavebox{\cbx@floatrightbox}
\newcommand{\cbxfloatright}[1]
{%
  \savebox{\cbx@floatrightbox}{#1}%
  \settoheight{\cbx@floatrightboxheight}%
              {\usebox{\cbx@floatrightbox}}
  \hfill\usebox{\cbx@floatrightbox}%
  \vspace{-\cbx@floatrightboxheight}%
}

%-------------------------------------------------------------------------
% Columns
%-------------------------------------------------------------------------

\newenvironment{cbxcols}
{%
  \vspace*{-0.1in}%
  \begin{columns}[T]%
}{%
  \end{columns}%
}

\newcommand{\cbxcol}[2]
{%
  \begin{column}{#1}%
    #2%
  \end{column}%
}

%-------------------------------------------------------------------------
% cbxfig
%-------------------------------------------------------------------------

\newcommand<>{\cbxfig}[2][\tw]{\includegraphics#3[width=#1,height=2.85in,keepaspectratio]{#2}}
\newcommand<>{\cbxfigb}[2][\tw]{\fbox{\includegraphics#3[width=#1,height=2.85in,keepaspectratio]{#2}}}
\newcommand<>{\cbxfigc}[2][\tw]{{\centering\includegraphics#3[width=#1,height=2.85in,keepaspectratio]{#2}\par}}
\newcommand<>{\cbxfigcx}[2][\tw]{{\centering\includegraphics#3[width=#1,height=3.25in,keepaspectratio]{#2}\par}}
\newcommand<>{\cbxfigbc}[2][\tw]{{\centering\fbox{\includegraphics#3[width=#1,height=2.85in,keepaspectratio]{#2}}}}

%-------------------------------------------------------------------------
% Code block formatting
%-------------------------------------------------------------------------

%\renewcommand{\FancyVerbFormatLine}[1]
%{%
%  \parbox{2.5ex}{\raggedleft\theFancyVerbLine} #1%
%}

%-------------------------------------------------------------------------
% Useful Macros
%-------------------------------------------------------------------------

\newcommand{\RD}[1]{{\color{cbxredC}#1}}
\newcommand{\RDA}[1]{{\color{cbxblueC}#1}}
\newcommand{\RDB}[1]{{\color{cbxgreenC}#1}}
\newcommand{\wu}[2]{\mbox{#1\,#2}}
\newcommand{\tmu}{\textmu{}}
\newcommand{\um}{\mbox{\textmu m}}
\newcommand{\X}{$\times$}
\newcommand{\x}{\thinspace$\times$\thinspace}
\newcommand{\by}{$\times$}
\newcommand{\tw}{\textwidth}
\newcommand{\cw}{\columnwidth}
\newcommand{\rarrow}{$\rightarrow$}
\newcommand{\larrow}{$\leftarrow$}

