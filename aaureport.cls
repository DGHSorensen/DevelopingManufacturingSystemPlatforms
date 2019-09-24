%!TEX root = dissertation.tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aaureport}[2017/08/25 Custom AAU document class for student reports, M.Sc. theses and Ph.D. Dissertations]
\LoadClass[showtrims]{memoir}\showtrimsoff

\DeclareOption{b5form}{%B5 format for PhD dissertations
  \setstocksize{240mm}{170mm}
  \settrimmedsize{240mm}{170mm}{*}
  \newcommand{\bbalgn}{\hspace*{-1pt}}%Fix for bluebox spacing
  \newlength{\bboflow}\setlength{\bboflow}{0mm}} 
  
\DeclareOption{a4trim}{%B5 format for PhD dissertations on A4 stock with cutmarks
  \setstocksize{297mm}{210mm}
  \settrimmedsize{240mm}{170mm}{*}
  \settrims{28.5mm}{20mm}
  \showtrimson
  \newcommand{\bbalgn}{}
  \newlength{\bboflow}\setlength{\bboflow}{5mm}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ExecuteOptions{final,a4paper,10pt,onecolumn,openright,twoside,portrait,RGB} %Defaul options

\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Required Packages
\RequirePackage{xcolor}
  \definecolor{aaublue}{RGB/cmyk}{33,26,82/1,0.7,0,0.62} %Official AAU Blue colour
  \definecolor{aaugrey}{RGB/cmyk}{222,223,226/0.16,0.1,0.1,0} %Light AAU Grey colour
  \definecolor{aaugrey2}{RGB/cmyk}{162,172,182/0.41,0.26,0.22,0.04} %Light variant of AAU Grey
  \definecolor{aaudarkgrey}{RGB/cmyk}{84,97,110/0.64,0.43,0.34,0.18} %Dark AAU Grey colour
  \definecolor{aaupurp}{RGB/cmyk}{89,79,191/0.82,0.63,0,0} %Official AAU Purple Colour
\RequirePackage[final]{pdfpages}
\RequirePackage[final,babel]{microtype}
  \SetTracking[spacing = {100*,166, }]{encoding = *, shape = sc}{50}
\RequirePackage{fontspec}%Requires either LuaLaTex (recommended) or XeLaTeX
\setmainfont{Garamond}
\setsansfont{Arial}
\setmonofont[Scale=MatchLowercase]{Courier new}
\newfontfamily\narrowFont{Arial Narrow}[%New narrow font family
  BoldFont = Arial Narrow Bold,
  ItalicFont = Arial Narrow Italic,
  BoldItalicFont = Arial Narrow Bold Italic%
  ]%
\RequirePackage{xspace}
\RequirePackage{xpunctuate}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Document property commands
\newcommand{\docTitle}{Title}
\newcommand{\docSubtitle}{Subtitle}
\newcommand{\docType}{Document Type}
\newcommand{\docAuthor}{Author}
\newcommand{\mainSupervisor}{Main Supervisor}
\newcommand{\assistSupervisor}{Assistant Supervisor}
\newcommand{\Department}{Department}
\newcommand{\ResGroup}{Research Group}
\newcommand{\docSubmission}{Submission Date}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Floats, widows, orphans and pagebreaks
%Allow pages with only a few lines of text
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.6}
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{2}
\renewcommand{\textfraction}{0.07}
\renewcommand{\floatpagefraction}{0.7}
\renewcommand{\dblfloatpagefraction}{0.7}
% flushbottom is in principle better than raggedbottom for twoside. Making a document with lots of figures, section headings equations etc. with flushbottom takes a lot of effort, however. The stretchy topskip is a trick to get (slightly) better pagebreaks:
\widowpenalty=10000 \addtolength{\topskip}{0pt plus 10pt} \raggedbottom%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Styling
\newcommand{\hffont}{%Font for header and footer
  \footnotesize\sffamily}%

%Main pagestyle
\makepagestyle{aaureport}

\makeevenhead{aaureport}{}{%Defines header on even pages
  \hffont\leftmark}{}%

\makeoddhead{aaureport}{}{%Defines header on uneven pages
  \hffont\rightmark}{}%

\makeevenfoot{aaureport}{}{%Defines footer on even pages
  \hffont\thepage}{}%

\makeoddfoot{aaureport}{}{%Defines footer on odd pages
  \hffont\thepage}{}%

\makepsmarks{aaureport}{%Defines marks for header
  \createmark{chapter}{left}{shownumber}{}{:\ }
  \createmark{section}{right}{shownumber}{}{:\ }}

%Plain pagestyle is used for e.g. pages where chapters start
\makeevenfoot{plain}{}{%Sets plain footer on even pages
  \hffont\thepage}{}%

\makeoddfoot{plain}{}{%Sets plain footer on uneven pages
  \hffont\thepage}{}%

%Front- main- and backmatter pagestyles
\newcommand*{\chapnonumname}{}

\renewcommand*{\frontmatter}{%Sets frontmatter style
  \pagestyle{plain}%Disable headers and footers in the frontmatter
  \pagenumbering{roman}%Roman page numbering in the frontmatter
  \renewcommand*{\chapnonumname}{Frontmatter}}%

\renewcommand{\mainmatter}{%Sets mainmatter style
  \pagestyle{aaureport}
  \pagenumbering{arabic} %Arabic page numbering in the mainmatter
  \renewcommand*{\chapnonumname}{}}

\renewcommand{\backmatter}{%Sets backmatter style
  \renewcommand*{\chapnonumname}{Backmatter}}

%Appendix pagestyle and chapter numbering
\renewcommand*{\appendix}{%Sets appendix style
  \par%
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand*{\chaptername}{Appendix}%
  \renewcommand*{\chapnonumname}{}%
  \renewcommand*{\thechapter}{\Alph{chapter}}
  
  \makeevenfoot{aaureport}{}{%Defines footer on even pages
    \hffont\MakeUppercase{app~\thepage}}{}%
  
  \makeoddfoot{aaureport}{}{%Defines footer on odd pages
    \hffont\MakeUppercase{app~\thepage}}{}%
  %Plain pagestyle is used for e.g. pages where chapters start
  \makeevenfoot{plain}{}{%Sets plain footer on even pages
    \hffont\MakeUppercase{app~\thepage}}{}%

  \makeoddfoot{plain}{}{%Sets plain footer on uneven pages
    \hffont\MakeUppercase{app~\thepage}}{}%
  \makeoddhead{aaureport}{}{%Defines header on uneven pages
    \hffont\MakeUppercase{Appended Papers}}{}%
  \anappendixtrue}

%Chapter style
%The aaureport chapterstyle specifies a custom chapter style and matching part style
\makechapterstyle{aaureport}{%Defines aaureport chapter and part style
  \chapterstyle{default}%Bases new style on default

  %Chapter font settings
  \renewcommand*{\chapnumfont}{%
    \sffamily\color{white}\fontsize{48pt}{60pt}\selectfont}%

  \renewcommand*{\chapnamefont}{%
    \chapnumfont}%

  \renewcommand*{\chaptitlefont}{%
    \sffamily\scshape\color{black}\fontsize{18pt}{21pt}\selectfont}%
  
  \settowidth{\chapindent}{%
    \chapnumfont~99}%Originally from memoir

  %Part font settings
  \renewcommand*{\partnamefont}{%
    \chapnamefont}%
  
  \renewcommand*{\partnumfont}{%
    \chapnumfont}%
  
  \renewcommand*{\parttitlefont}{%
    \sffamily\color{black}\fontsize{22pt}{25pt}\selectfont}%

  %Chapter skip settings -- Sets spacing between items in chapterstyle
  \renewcommand*{\chapterheadstart}{%Top of typeblock to chaptername
    \null\vskip2\baselineskip}%

  \renewcommand*{\afterchapternum}{%Chapternum to chaptertitle
    \par\nobreak\vskip}%

  \renewcommand*{\afterchaptertitle}{%Chaptertitle to text
    \par\nobreak\vskip3.2\baselineskip}%

  %Part skip settings -- Sets spacing between items in partstyle
  \renewcommand*{\beforepartskip}{%Top of typeblock to partname
    \null\vskip\baselineskip}%

  \renewcommand*{\midpartskip}{%Partnum to parttitle
    \par\vskip\onelineskip}%

  \renewcommand*{\afterpartskip}{%Parttitle to following page
    \vfil}%

  %Chapter print settings -- Commands in order of execution, see memoir manual
  \renewcommand*{\printchaptername}{}

  \renewcommand*{\chapternamenum}{}
  
  \renewcommand*{\printchapternum}{%
    \smash{%
      \bbalgn\colorbox{aaublue}{%
        \parbox[c][60pt][c]{\textwidth+\marginparwidth+\marginparsep+\bboflow}{%
          \hfill%
          \makebox[\marginparwidth+\marginparsep+2\bboflow][c]{\chapnumfont\thechapter}%
        }
      }
    }
  }
  
  \renewcommand*{\afterchapternum}{\par\vskip4\onelineskip}

  \renewcommand*{\printchapternonum}{%
    \smash{%
      \bbalgn\colorbox{aaublue}{%
        \parbox[c][60pt][c]{\textwidth+\marginparwidth+\marginparsep+\bboflow}{~}
      }
    }\par\vskip4\onelineskip
  }

  \renewcommand{\printchaptertitle}[1]{%
    \vspace*{\baselineskip}
    \smash{%
      \parbox[c][2\baselineskip][t]{\textwidth+\marginparwidth-\marginparsep}{%
        \memRTLraggedleft%
        {\textls*{\chaptitlefont##1}}
      }
    }
  }

  \renewcommand*{\printpartname}{%
    \smash{%
      \colorbox{aaublue}{%
        \parbox[c][1.2\baselineskip][c]{\textwidth-\marginparsep}{%
          \centering%
          {\partnamefont\partname~\partnumfont\thepart}
        }
      }
    }
  }

  \renewcommand*{\partnamenum}{}
  \renewcommand*{\printpartnum}{}
  % \renewcommand*{\printparttitle}[1]{\parttitlefont##1}
}%End makechapterstyle

%Section styles
\setsecheadstyle{%Section
  \sffamily\fontsize{11pt}{21pt}\selectfont%
  \memRTLraggedright}%

\setsubsecheadstyle{%Subsection
  \sffamily\fontsize{10pt}{21pt}\selectfont%
  \memRTLraggedright}%

\setsubsubsecheadstyle{%Subsubsection
  \sffamily\fontsize{10pt}{21pt}\selectfont%
  \memRTLraggedright}%

\setparaheadstyle{%Paragraph
  \sffamily\normalsize%
  \memRTLraggedright}%

\setsubparaheadstyle{%Subparagraph
  \sffamily\normalsize%
  \memRTLraggedright}%

%Caption style
\captionnamefont{%Captionname font
  \bfseries\small} 

\captiontitlefont{%Caption text font
  \small}

%TOC Style
\renewcommand{\cftpartfont}{\large}%Part font in TOC
\renewcommand{\cftpartpagefont}{\large}%Font for part page number in TOC
\renewcommand{\cftchapterfont}{\bfseries}%Chapter font in TOC
\renewcommand{\cftchapterpagefont}{\bfseries}%Chapter page font in TOC
\renewcommand{\cftsectionfont}{\normalfont}%Section font in TOC
\renewcommand{\cftsectionpagefont}{\normalfont}%Section page font in TOC
\renewcommand{\cftsubsectionfont}{\normalfont}%Subsection font in TOC
\renewcommand{\cftsubsectionpagefont}{\normalfont}%Subsection page font in TOC

%\renewcommand*{\cftappendixname}{Appendix\space} %Adds \appendixname to TOC before appendices
\setcounter{tocdepth}{2} %Sets depth of TOC. 0=Chapters, 1=Sections, 2=Subsections, 3=subsubsections
\setcounter{secnumdepth}{2} %Sets depth of section numbering 0=chapters, 1=sections, 2=subsections, 3=subsubsections