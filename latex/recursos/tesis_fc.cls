%%
%% This is file `book.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% classes.dtx  (with options: `book')
%% 
%% This is a generated file.
%% 
%% Copyright 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004
%% The LaTeX3 Project and any individual authors listed elsewhere
%% in this file.
%% 
%% This file was generated from file(s) of the LaTeX base system.
%% --------------------------------------------------------------
%% This is file `tesis_fc.cls',
%% 
%% 
%% Author: Andrea Avena Koenigsberger (FC-UAEM)
%%         now at: aiavenak@indiana.edu
%% 
%% -------------------------------------------------------------- 

\NeedsTeXFormat{LaTeX2e}
\def\fileversion{v.1.0}\def\filedate{2011/06/13}
\ProvidesClass{tesis_fc}[\filedate\space\fileversion\space
    Diseño para tesis de licenciatura de la Facultad de Ciencias UAEM]

\LoadClass{book}

\RequirePackage{fancyhdr}             % Encabezados y Pies               
\RequirePackage{graphicx}
\RequirePackage[spanish]{babel} 
\RequirePackage{amsmath, amsthm}
\RequirePackage{hyperref}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{epsfig} % for postscript graphics files



\pagestyle{plain}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Opciones de Tamao y unlado/doslados paginas

%% tamao standar de tesis de la facultad
\DeclareOption{chico}{
  \geometry{papersize={17cm,23cm},body={11.5cm,17cm},%
    left=20pt,top=0.5cm,offset={2cm,2.5cm}}
  %%%%    left=66pt,top=2cm,offset={2cm,2.5cm}}

  %\ifpdf
   % \AtBeginDocument{%
   % \pdfpagewidth=8.5in
   % \pdfpageheight=11in}
  %\fi
}

%% tamao carta, para borradores
\DeclareOption{grande}{
	\geometry{papersize={17cm,23cm}}
	
}

%% para borradores
\DeclareOption{dobleespacio}{
	\renewcommand{\baselinestretch}{1.66}
}

\newif\if@two
\DeclareOption{unlado}{\@twofalse\geometry{asymmetric}}
\DeclareOption{doslados}{\@twotrue\geometry{twoside}}

\ProcessOptions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comandos para la portada

\newcommand{\titulo}[1]{\def\eltitulo{#1}}
\newcommand{\carrera}[1]{\def\lacarrera{#1}}
\newcommand{\area}[1]{\def\elarea{#1}}
\newcommand{\nombre}[1]{\def\elnombre{#1}}    
\newcommand{\director}[1]{\def\eldirector{#1}}
\newcommand{\codirector}[1]{\def\elcodirector{#1}}
\def\elcodirector{}
\newcommand{\fecha}[1]{\def\lafecha{#1}}

\renewcommand{\maketitle}{

%\thispagestyle{empty}
\begin{titlepage}

  \begin{picture}(18,4)
    \put(-20,-30){\includegraphics[height=2.5cm]{uaem}}
    \put(190.0,-30){\includegraphics[height=2.5cm]{iicba}}
  \end{picture}

% Barra derecha - Titulos
\begin{minipage}[c][9.5cm][s]{11.5cm}
  \begin{center}
  
    % Barra superior
    \vskip55pt
    {\large \scshape Universidad  Aut\'onoma del Estado de  Morelos} \\ [1\baselineskip] 
    {\scshape Instituto de Investigaci\'on en Ciencias B\'asicas y Aplicadas} \\[1\baselineskip] 
    {\scshape Centro de Investigaci\'on en Ciencias} \\
    
    % Titulo del trabajo
    \vspace{1.0cm}
    {\textbf{\eltitulo}} 
    \vspace{0.7cm}
	
    % Tipo de trabajo
    \textbf{T\ E\ S\ I\ S}\\
    QUE PARA OBTENER EL T\'ITULO DE\\[3pt]
	\vskip .3cm
     \textbf{\lacarrera} \\[5pt]
	\textbf{\elarea}
	
	%Nombre del autor
	\vskip .7cm
    PRESENTA:\\[3pt]
	\vskip .1cm
    {\textbf{\elnombre}}

    \vspace{1.0cm}

    {\normalsize DIRECTOR DE TESIS\\ DR. \eldirector}

    \ifx\elcodirector\empty\else
    \vspace{0.6cm}

    {\normalsize CO-DIRECTOR DE TESIS\\ DR. \elcodirector}
    \fi

    \vspace{3.0cm}
   
\begin{center}                                                                  
	CUERNAVACA, MORELOS \hfill \normalsize\lafecha                                     
\end{center}

 
  \end{center}
\end{minipage}

\end{titlepage}

}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comandos para agradecimientos, dedicatoria, prefacio, resumen
% \long para contenidos mayores que un parrafo

\long\def\dedicatoria#1{\gdef\@dedicatoria{#1}}
\long\def\dedicatoria#1{\gdef\@dedicatoria{#1}}
\long\def\agradecimientos#1{\gdef\@agradecimientos{#1}}
\long\def\resumen#1{\gdef\@resumen{#1}}

% si los campos estan vacios:
\def\@dedicatoria{\@latex@warning@no@line{No [optional]
    \noexpand\dedicatoria provided}}
\def\@agradecimientos{\@latex@warning@no@line{No [optional]
    \noexpand\agradecimientos given}}
\def\@resumen{\@latex@warning@no@line{No \noexpand\resumen given}}


% la dedicatoria:
\newcommand{\makededicatoria}{
	\thispagestyle{plain}
    {\Large\bfseries{Dedicatoria}}
	\vskip 30\p@
   \@dedicatoria \par%
   \global\let\makededicatoria\relax
   \global\let\dedicatoria\relax
   \global\let\@dedicatoria\@empty

   \setcounter{footnote}{0}
   \setcounter{page}{0}
%   \newpage
  }

% Los agradecimientos:
\newcommand{\makeagradecimientos}{
	\thispagestyle{plain}
    {\Large\bfseries{Agradecimientos}}
	\vskip 30\p@
   \@agradecimientos \par%
   \global\let\makeagradecimientos\relax
   \global\let\agradecimientos\relax
   \global\let\@agradecimientos\@empty

   %\newpage
   \setcounter{footnote}{0}
   \setcounter{page}{0}
}

% El resumen:
\newcommand{\makeresumen}%
  {\begin{titlepage}%
     \null
     \begin{center}%
       {\Large\bfseries\MakeUppercase{Resumen}}
       \vskip 20\p@
       {\bfseries\eltitulo}
       \vskip 9\p@
        \elnombre
     \end{center}
     \vskip 20\p@
     \noindent \@resumen \par
   \end{titlepage}%
   \global\let\makeresumen\relax
   \global\let\resumen\relax
   \global\let\@resumen\@empty
   
   
   \setcounter{footnote}{0}
   \setcounter{page}{0}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% iniciar numeracion arabica de paginas a partir de capitulo 1

\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}%
  \addtocontents{toc}{%
    \vspace{1em}\vspace{1pt}%
    \hbox{\bfseries \MakeUppercase\chaptername}%
    \vspace{10pt}}%
  }
  

% toc
\newcommand*\l@chap{\@dottedtocline{1}{0.5em}{3.5em}}
\renewcommand*\l@figure{\@dottedtocline{1}{0.5em}{3.5em}}

% indice de figuras con letra pequea y espacio sencillo en caso de dobleespacio
\renewcommand\listoffigures{%
	\begin{singlespacing}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\small\listfigurename}%
              {\MakeUppercase\small\listfigurename}%
    \@starttoc{lof}%\newpage
    \if@restonecol\twocolumn\fi
	\end{singlespacing}
	
    }


% modifica los espacios en toc:
\renewcommand*\l@section{\@dottedtocline{2}{5.0em}{2.3em}}
\renewcommand*\l@subsection{\@dottedtocline{3}{8.3em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{4}{12.5em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{5}{15.7em}{5em}}
\setcounter{tocdepth}{3}


\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

\def\@makechapterhead#1{%
%  \vspace*{10\p@}%
  {\parindent \z@ \raggedright \normalfont
    \begin{flushright}
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
%          \Large\bfseries 
          {\Large \scshape \@chapapp\space \thechapter}
          \par\nobreak
%        \vskip 0\p@
        \fi
      \fi
      \interlinepenalty\@M
      \huge \bfseries #1\par\nobreak
      \hrulefill
    \end{flushright}
    \vskip 20\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
%  \vspace*{10\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \begin{flushright}
	\huge \bfseries  #1\par\nobreak
    \end{flushright}
    \vskip 20\p@
  }}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Para insertar graficas

% args: <label> <fileName> <height> <caption> <explanation> 
\newcommand{\figone}[5]{
\begin{figure}[ht]
\begin{sl}
\begin{center}
\includegraphics[height=#3cm]{#2}
\caption{\label{#1} \small{#4}}
\end{center}
\small{#5}
\end{sl}
\end{figure}
}

% args: <label> <fileName> <height> <caption> <explanation> 
\newcommand{\figtwo}[5]{
\begin{figure}[ht]
\begin{sl}
\begin{center}
\fbox{\includegraphics[height=#3cm]{#2}}
\caption{\label{#1} \small{#4}}
\end{center}
\small{#5}
\end{sl}
\end{figure}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliografia


\renewenvironment{thebibliography}[1]
 {\chapter*{\bibname}
  \@mkboth{\bibname}{\bibname}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
 {\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}} %--' 
  \endlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Encabezados: Cap\'itulo y secci\'on 

 \pagestyle{fancy}
  %\renewcommand{\chaptermark}[1]{\markboth{\thechapter}{#1}}
  %\renewcommand{\sectionmark}[1]{\markright{\thesection}{#1}}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
  \fancyhf{}%
  \if@two
    \fancyhead[RE]{\nouppercase{\rightmark}}
    \fancyhead[LO]{\nouppercase{\leftmark}}
    \fancyhead[RO,LE]{\thepage}
  \else
    \fancyhead[LO,LE]{\nouppercase{\leftmark}}
    \fancyhead[RO,RE]{\thepage}
  \fi



%% Para asegurar que no ponga encabezados en las p\'ginas blancas al
%% final de los cap\'itulos que terminan en p\'gina impar.

 \def\cleardoublepage{\clearpage
 \if@twoside
   \ifodd\c@page\else
     \hbox{}
     \thispagestyle{empty}
     \newpage
     \if@twocolumn\hbox{}\newpage\fi
   \fi
 \fi}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\appendix}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \bgroup%
    \null\vfil
    \centering
    \Large \bfseries \MakeUppercase\appendicesname\par
    \addcontentsline{toc}{chapter}{\MakeUppercase\appendicesname}%
    \vfil\newpage
  \egroup%
  \if@twoside\null\thispagestyle{plain}\newpage\fi
  \if@tempswa\twocolumn\fi
  \setcounter{chapter}{0}%
  \@appendixtrue
  \renewcommand\@chapapp{\appendixname}%
  \renewcommand\thechapter{\@Alph\c@chapter}
  \renewcommand\thesection{\thechapter.\@arabic\c@section}
  \renewcommand\theequation{\thechapter.\@arabic\c@equation}
  \renewcommand\thefigure{\thechapter.\@arabic\c@figure}
  \renewcommand\thetable{\thechapter.\@arabic\c@table}
  \renewcommand\thefootnote{\thechapter\@arabic\c@footnote}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%

\endinput

%%
%% End of file `tesis_fc.cls'.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% para incluir la portada cuando esta en otro archivo
\newif\if@portada
\@portadafalse

\newcommand{\p@rtada}
  {\AtBeginDocument{\if@portada%
    \IfFileExists{portada.tex}
      {\frontmatter\input{portada}}
    {}\else\fi} % Insertar código de error
  }