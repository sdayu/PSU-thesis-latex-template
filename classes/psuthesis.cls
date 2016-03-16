%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ``psuthesis''                                                        %%
%%                                                                            %%
%% A PSU thesis LaTeX template for Prince of Songkla University               %%
%%                                                                            %%
%% Version: v1.0.0                                                            %%
%% Authors: Thanathip Limna                                                   %%
%% Date: 2013/11/16 (inception)                                               %%
%% License: MIT License (c) 2013 Krishna Kumar                                %%
%% Based on: https://github.com/kks32/phd-thesis-template                     %%
%% Git repo: https://github.com/sdayu/PSU-thesis-latex-template               %%
%% Acording to PSU thesis manual http://www.grad.psu.ac.th/thesis_manual.php  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ************************** Class Identification ******************************
\newcommand\fileversion{1.0.0}
\newcommand\filedate{2015/01/07}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{psuthesis}[\filedate\space A PSU thesis class file
 by Thanathip Limna and Teerasak Kroputaponchai (v\fileversion)]
\typeout{https://github.com/sdayu/PSU-thesis-latex-template/}

% ************************* Conditional Statements *****************************
\RequirePackage{ifthen}  % conditional statements
\RequirePackage{ifpdf, ifxetex}    % Check for pdfLaTeX and xelatex

% ******************************************************************************
% **************************** Class Definition ********************************
% ******************************************************************************

% *********************** Define a Print/Online Version ************************
\newif\if@print\@printfalse
\DeclareOption{print}{\@printtrue}

% ****************************** Draft Option **********************************
\newif\ifsetDraft\setDraftfalse
\newif\ifsetDraftClassic\setDraftClassicfalse

% ****************************** Define index **********************************
\newif\ifPSUTHESIS@index\PSUTHESIS@indexfalse
\DeclareOption{index}{\PSUTHESIS@indextrue}

% ***************************** Custom Margins  ********************************
\newif\ifsetTH\setTHfalse % Set Custom Margin
\DeclareOption{th}{\setTHtrue}

% ******************************* Font Option **********************************
%\newif\ifsetFont\setFontfalse                 				% Font is not set
%
%\newif\ifPSUTHESIS@times\PSUTHESIS@timesfalse             % Times with Math Support
%\DeclareOption{times}{
%  \ifsetFont
%    \ClassWarning{PSUTHESIS}{Font selection conflict: A font package was
%      aleady specified. Please check the document class options in case you 
%      have defined two fonts.}
%  \else
%    \PSUTHESIS@timestrue
%    \setFonttrue
%  \fi
%}
%
%\newif\ifPSUTHESIS@fourier\PSUTHESIS@fourierfalse         % Fourier with Math Support
%\DeclareOption{fourier}{
%  \ifsetFont
%    \ClassWarning{PSUTHESIS}{Font selection conflict: A font package was
%      aleady specified. Please check the document class options in case you 
%      have defined two fonts.}
%  \else
%    \PSUTHESIS@fouriertrue
%    \setFonttrue
%  \fi
%}
%
%\newif\ifsetCustomFont\setCustomFontfalse     % Custom Font with Math Support
%\DeclareOption{customfont}{
%  \ifsetFont
%    \ClassWarning{PSUTHESIS}{Font selection conflict: A font package was
%      aleady specified. Please check the document class options in case you 
%      have defined two fonts.}
%  \else
%    \setCustomFonttrue
%    \setFonttrue
%  \fi
%}

% ******************************* Bibliography *********************************
\newif\ifsetBib\setBibfalse                   % Custom Bibliography = true/false
\newif\ifsetBiBLaTeX\setBiBLaTeXfalse         % BiBLaTeX = True / False

\newif\ifPSUTHESIS@biblatex\PSUTHESIS@biblatexfalse       % BiBLaTeX
\DeclareOption{biblatex}{
  \ifsetBib
    \ClassWarning{PSUTHESIS}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PSUTHESIS@biblatextrue
  \fi
}

\newif\ifPSUTHESIS@authoryear\PSUTHESIS@authoryearfalse   % Author-Year citation
\DeclareOption{authoryear}{
  \ifsetBib
    \ClassWarning{PSUTHESIS}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PSUTHESIS@authoryeartrue
    \setBibtrue
  \fi
}

\newif\ifPSUTHESIS@numbered\PSUTHESIS@numberedfalse       % Numbered citiation
\DeclareOption{numbered}{
  \ifsetBib
    \ClassWarning{PSUTHESIS}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PSUTHESIS@numberedtrue
    \setBibtrue
  \fi
}

\newif\ifuseCustomBib\useCustomBibfalse     % Custom Bibliography
\DeclareOption{custombib}{
  \ifsetBib
    \ClassWarning{PSUTHESIS}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \ifPSUTHESIS@biblatex
        \ClassWarning{PSUTHESIS}{Bibliography selection conflict: A
          bibliography style aleady specified. Please check the document class
          options in case you have defined two bibliography styles.}
    \else
      \useCustomBibtrue
      \setBibtrue
    \fi
  \fi
}

% ************************* Header / Footer Styling ****************************
\newif\ifPSUTHESIS@textJustify\PSUTHESIS@textJustifytrue % Set Justification true
\DeclareOption{flushleft}{\PSUTHESIS@textJustifyfalse}

% ***************************** Custom Margins  ********************************
\newif\ifsetCustomMargin\setCustomMarginfalse % Set Custom Margin
\newif\ifsetMargin\setMarginfalse % Set Custom Margin
\DeclareOption{custommargin}{\setCustomMargintrue}


% *************************** Pre-defined Options ******************************
% Font Size

\newcommand\PSUTHESIS@ptsize{11pt} %Set Default Size as 16 Thai font
\PassOptionsToClass{\PSUTHESIS@ptsize}{book}%
\message{psuthesis: Font size is set as \PSUTHESIS@ptsize}

% Page Size
\newcommand\PSUTHESIS@papersize{a4paper} % Set Default as a4paper
\PassOptionsToClass{\PSUTHESIS@papersize}{book}%

% Column layout
\PassOptionsToClass{oneside}{book}

% Draft Mode

\DeclareOption{draftclassic}{\PassOptionsToClass{draft}{book}
  \setDraftClassictrue
  \ClassWarning{psuthesis}{Draft is ON. Don't forget to turn it
    off in your final version. This is the classic version of draft.
    Use `draft' for enhanced mode, which adds watermark with timestamp, 
    line numbering, and version number.}}%

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}
  \setDrafttrue 
  \ClassWarning{psuthesis}{Draft is ON. Don't forget to turn it
    off in your final version. This enhanced `draft' mode adds watermark 
    with timestamp, line numbering, and version number. Use `draftclassic'
    if you prefer the \cite{} lassic draft mode. To tweak options see
    `preamble.tex'}}%


% Deprecated option - use draft instead
\DeclareOption{draftmode}{
\ClassError{psuthesis}{This option is deprecated. Use `draft' 
  instead this option replaces `draftmode'. To use the classic version
  of draft use `draftclassic`}
\stop}% 


% Line Numbers
\newif\ifPSUTHESIS@lineno\PSUTHESIS@linenotrue
\DeclareOption{lineno}{\PSUTHESIS@linenotrue}
\DeclareOption{nolineno}{\PSUTHESIS@linenofalse}


% Generates Warning for unknown options
\DeclareOption*{
  \ClassWarning{psuthesis}{Unknown or non-standard option
'\CurrentOption'. I'll see if I can load it from the book class. If you get a
warning unused global option(s): `\CurrentOption` then the option is not
supported!}
  \PassOptionsToClass{\CurrentOption}{book}
}

% Determine whether to run pdftex or dvips
\ProcessOptions\relax%
\newif\ifsetDVI\setDVIfalse
\ifx\pdfoutput\undefined
  % we are not running PDFLaTeX
  \setDVItrue
  \LoadClass[dvips,fleqn,openright]{book}%
\else % we are running PDFLaTeX
  \ifnum \pdfoutput>0
    %PDF-Output
    \setDVIfalse
    \LoadClass[pdftex,fleqn,openright]{book}%
  \else
    %DVI-output
    \setDVItrue
    \LoadClass[fleqn,openright]{book}%
  \fi
\fi

% ******************************************************************************
% ******************************** Packages ************************************

% ******************************************************************************
% ************************** Layout and Formatting *****************************

\ifpdf
\renewcommand\pdfshellescape{1}
\else
\fi
\RequirePackage{lscape}   % Supports Landscape Layout
\RequirePackage{setspace} % Define line spacing in paragraph
\RequirePackage{calc}     % To calculate vertical spacing

% multicolumn in vitae
\RequirePackage{array}
\newcolumntype{P}[1]{>{\raggedright\arraybackslash}p{#1}}

% *********************** To copy ligatures and Fonts **************************
\ifpdf
	\usepackage[T1]{fontenc}
	\usepackage[utf8x]{inputenc}
	%\usepackage[laksaman]{fonts-tlwg}
\else
	\ifxetex
		\usepackage{fontspec}
		%\usepackage{xunicode}
		\usepackage{xltxtra}
		\usepackage{polyglossia}

		%\defaultfontfeatures{Scale=1.23}

		\ifsetTH
		\XeTeXlinebreaklocale "th_TH"
		\setdefaultlanguage{thai}
		\defaultfontfeatures{Scale=1.54,Mapping=tex-text}
		\else
		\setdefaultlanguage{english}
		\defaultfontfeatures{Scale=1.54,Mapping=tex-text}
		\fi

		\XeTeXlinebreakskip = 0pt plus 1pt


		% for laksaman font
%		\setmainfont{Laksaman}
%		\defaultfontfeatures{Scale=MatchLowercase}
%		\newfontfamily{\thaifont}[Script=thai]{Laksaman}

%		\setmainfont[Mapping=tex-text,Script=thai]{TH Sarabun New}
%		\newfontfamily{\thaifont}[Script=thai]{TH Sarabun New}
		\setmainfont[Mapping=tex-text]{TH Sarabun New}
		\newfontfamily{\thaifont}[]{TH Sarabun New}
	\else
	\fi
\fi

%\input{glyphtounicode}
%\pdfglyphtounicode{f_f}{FB00}
%\pdfglyphtounicode{f_i}{FB01}
%\pdfglyphtounicode{f_l}{FB02}
%\pdfglyphtounicode{f_f_i}{FB03}
%\pdfglyphtounicode{f_f_l}{FB04}
%\pdfgentounicode=1

% Don't break enumeration (etc.) across pages in an ugly manner
\clubpenalty=10000
\widowpenalty=10000

% If building with PDFLaTeX, use microtype spacing adjustments
\RequirePackage[final]{microtype}


% *********************** Table of Contents & Appendices ***********************
% add Bibliography, List of figures and tables to contents
\RequirePackage[nottoc]{tocbibind}
% Add appendices
\RequirePackage[title,titletoc]{appendix}
\usepackage{titletoc}
\usepackage{atbegshi}
\usepackage{tocloft}
\usepackage{etoolbox}

%remove space between chapter
\preto\figure{%
  \ifnum\value{figure}=0\addtocontents{lof}{{\vskip-10pt}}\fi
}
\preto\table{%
  \ifnum\value{table}=0\addtocontents{lot}{{\vskip-10pt}}\fi
}

\newcommand{\contenttopchapter}{Chapter}
\newcommand{\contenttoppage}{Page}
\newcommand{\contenttopfigure}{Figure}
\newcommand{\contenttoptable}{Table}
\newcommand{\contenttopcontinued}{~(Continued)}

\addto{\captionsenglish}{
	\renewcommand{\bibname}{BIBLIOGRAPHY}
	\renewcommand{\chaptername}{CHAPTER}
	\renewcommand{\contentsname}{CONTENTS}
	\renewcommand{\listtablename}{LIST OF TABLES}
	\renewcommand{\listfigurename}{LIST OF FIGURES}
	\renewcommand{\appendixname}{APPENDIX}
}
\addto{\captionsthai}{
		\renewcommand{\listtablename}{รายการตาราง}
		\renewcommand{\listfigurename}{รายการภาพประกอบ}
		\renewcommand{\appendixname}{ภาคผนวก}		
		
		\renewcommand{\contenttopchapter}{เรื่อง}
		\renewcommand{\contenttoppage}{หน้า}
		\renewcommand{\contenttopfigure}{รูป}
		\renewcommand{\contenttoptable}{ตาราง}
		\renewcommand{\contenttopcontinued}{~(ต่อ)}
}

\newcommand{\PSUContentsHeader}[4]{
	\chapter*{#1#2} \noindent #3 \hfill #4\par\kern.5\baselineskip
}


\AtBeginDocument{
	\renewcommand{\tableofcontents}{%
		\newpage	
%		\ifpdf
%  		\else
%			\pdfbookmark[0]{\contentsname}{Contents}
%		\fi

		\cleardoublepage
		\begingroup%
		\parindent\z@\parskip\cftparskip%
		\PSUContentsHeader{\contentsname}{}{\contenttopchapter}{\contenttoppage}
		\@starttoc{toc}%
		\addcontentsline{toc}{chapter}{\contentsname}
		\endgroup%
	}

	\renewcommand{\listoftables}{
		
		\cleardoublepage
		\begingroup%
		\parindent\z@\parskip\cftparskip%
		\PSUContentsHeader{\listtablename}{}{\contenttoptable}{\contenttoppage}
		\@starttoc{lot}%
		\addcontentsline{toc}{chapter}{\listtablename}
		\endgroup%
		
	}

	\renewcommand{\listoffigures}{
		\cleardoublepage
		\begingroup%
		\parindent\z@\parskip\cftparskip%
		\PSUContentsHeader{\listfigurename}{}{\contenttopfigure}{\contenttoppage}
		\@starttoc{lof}%
		\addcontentsline{toc}{chapter}{\listfigurename}
		\endgroup%
	}

}


\newcommand{\PSUContentsHeaderContinued}{\PSUContentsHeader{\contentsname}{\contenttopcontinued}{\contenttopchapter}{\contenttoppage}}

\newcommand{\PSUtableofcontents}{
	\AtBeginShipout{\PSUContentsHeaderContinued}
	\tableofcontents
	\renewcommand{\PSUContentsHeaderContinued}{}
}


\newcommand{\PSULotHeaderContinued}{\PSUContentsHeader{\listtablename}{\contenttopcontinued}{\contenttoptable}{\contenttoppage}}

\newcommand{\PSUlistoftables}[1][]{
	\ifthenelse{\equal{#1}{printchapter}}{
		\preto\table{%
  				\ifnum\value{table}=0\addtocontents{lot}{{\bfseries \chaptername~\thechapter\vskip15pt}}\fi
			}
		% currently this code no effect
		\titlecontents{table}% <section-type>
		[25pt]% <left>
		{}% <above-code>
		{\tablename\ \thecontentslabel~}% <numbered-entry-format>
		{\tablename}% <numberless-entry-format>
		{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>
	}{}
	\AtBeginShipout{\PSULotHeaderContinued}
	\listoftables
	\renewcommand{\PSULotHeaderContinued}{}
}

\newcommand{\PSULofHeaderContinued}{\PSUContentsHeader{\listfigurename}{\contenttopcontinued}{\contenttopfigure}{\contenttoppage}}

\newcommand{\PSUlistoffigures}[1][]{
	\ifthenelse{\equal{#1}{printchapter}}{
		\preto\figure{%
  				\ifnum\value{figure}=0\addtocontents{lof}{{\bfseries \chaptername~\thechapter\vskip15pt}}\fi
			}
		% currently this code no effect
		\titlecontents{figure}% <section-type>
		[25pt]% <left>
		{}% <above-code>
		{\figurename\ \thecontentslabel~}% <numbered-entry-format>
		{\figurename}% <numberless-entry-format>
		{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>
		
	}{}
	\AtBeginShipout{\PSULofHeaderContinued}
	\listoffigures
	\renewcommand{\PSULofHeaderContinued}{}
}

\titlecontents{chapter}% <section-type>
	[0pt]% <left>
	{}% <above-code>
	{\bfseries\chaptername\ \thecontentslabel\quad}% <numbered-entry-format>
	{\bfseries\thecontentslabel}% <numberless-entry-format>
	{\bfseries\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>


\titlecontents{section}% <section-type>
	[25pt]% <left>
	{}% <above-code>
	{\thecontentslabel\quad}% <numbered-entry-format>
	{\thecontentslabel}% <numberless-entry-format>
	{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>


\titlecontents{subsection}% <section-type>
	[50pt]% <left>
	{}% <above-code>
	{\thecontentslabel\quad}% <numbered-entry-format>
	{\thecontentslabel}% <numberless-entry-format>
	{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>


\titlecontents{subsubsection}% <section-type>
	[75pt]% <left>
	{}% <above-code>
	{\thecontentslabel\quad}% <numbered-entry-format>
	{\thecontentslabel}% <numberless-entry-format>
	{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>


\titlecontents{figure}% <section-type>
	[0pt]% <left>
	{}% <above-code>
	{\figurename\ \thecontentslabel~}% <numbered-entry-format>
	{\figurename}% <numberless-entry-format>
	{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>


\titlecontents{table}% <section-type>
	[0pt]% <left>
	{}% <above-code>
	{\tablename\ \thecontentslabel~}% <numbered-entry-format>
	{\tablename}% <numberless-entry-format>
	{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>

%\let\@oldbackmatter\backmatter
\renewcommand\backmatter{
	%\@oldbackmatter
    \def\chaptermark##1{\markboth{%
        \ifnum  \c@secnumdepth > \m@ne  \@chapapp\ \thechapter:  \fi  ##1}{%
        \ifnum  \c@secnumdepth > \m@ne  \@chapapp\ \thechapter:  \fi  ##1}}%
    \def\sectionmark##1{\relax}   
}

% ******************************* Appendices **********************************
% Appending the appendix name to the letter in TOC
% Especially when backmatter is enabled

\renewenvironment{appendices} {
	\appendix
	%\setcounter{chapter}{0}

	\ifsetTH
		\renewcommand{\thechapter}{\thaiAlph{chapter}}
	\else
		\renewcommand{\thechapter}{\Alph{chapter}} 
	\fi
	
	
	% fix contents display wrong appendix
	\titlecontents{chapter}% <section-type>
  		[0pt]% <left>
  		{}% <above-code>
  		{\bfseries\appendixname\ \thecontentslabel\quad}% <numbered-entry-format>
  		{\bfseries\thecontentslabel}% <numberless-entry-format>
  		{\bfseries\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>
  			
}


% *************************** Graphics and Figures *****************************
\RequirePackage[usenames, dvipsnames]{color}
\ifpdf
        % Convert eps figures to pdf
    \RequirePackage{epstopdf}
    \RequirePackage[pdftex]{graphicx}
	\DeclareGraphicsExtensions{.png, .jpg, .pdf, .webp, .eps}
	\pdfcompresslevel=9
	%\graphicspath{{Figs/Raster/}{Figs/}}
\else
	\RequirePackage{graphicx}
	\DeclareGraphicsExtensions{.eps, .ps}
	%\graphicspath{{Figs/Vector/}{Figs/}}
\fi



% ******************************* Time Stamp ***********************************
% Compute the timestamp based on an idea of
% Tim Piessens \texttt{<Tim.Piessens@esat.kuleuven.ac.be>}.

\RequirePackage{datetime}

\newcount\PSUTHESIS@hour \newcount\PSUTHESIS@minute
\PSUTHESIS@hour=\time
\divide \PSUTHESIS@hour by 60
\PSUTHESIS@minute=\time
\count@=\PSUTHESIS@hour
\multiply \count@ by -60
\advance \PSUTHESIS@minute by \count@
\newcommand{\PSUTHESIS@daytime}{%
  \today\space--\space%
  \ifnum\PSUTHESIS@hour=0 00\else\ifnum\PSUTHESIS@hour<10 0\fi%
  \number\PSUTHESIS@hour\fi:\ifnum\PSUTHESIS@minute<10 0\fi\number\PSUTHESIS@minute
}

% ******************************* Draft Mode ***********************************
% Initializing Draft Text
\newcommand\SetDraftText[1]{}
% Initializing Draft Version
\newcommand\SetDraftVersion[1]{}
% Initializing Draft Content
\newcommand\SetDraftWMPosition[1]{}
% Initializing Draft Gray Scale
\newcommand\SetDraftGrayScale[1]{}

% Classic Draft Mode
\ifsetDraftClassic
% Disable figures in `draftmode'\
\setkeys{Gin}{draft=true}
\fi

% If Draft Mode is active
\ifsetDraft
% Disable figures in `draftmode'\
\setkeys{Gin}{draft=false}

% Line numbering (can be switched off)
\ifPSUTHESIS@lineno
\RequirePackage[switch,pagewise,mathlines]{lineno}
\renewcommand{\frontmatter}{\nolinenumbers}
\renewcommand{\mainmatter}{\linenumbers}
\renewcommand{\backmatter}{\linenumbers}

% Fix display lineno issue in mathmode
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}%
     {\linenomath\csname old#1\endcsname}%
     {\csname oldend#1\endcsname\endlinenomath}%
}% 

\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
  \patchAmsMathEnvironmentForLineno{#1}%
  \patchAmsMathEnvironmentForLineno{#1*}%
}%

\AtBeginDocument{%
\patchBothAmsMathEnvironmentsForLineno{equation}%
\patchBothAmsMathEnvironmentsForLineno{align}%
\patchBothAmsMathEnvironmentsForLineno{flalign}%
\patchBothAmsMathEnvironmentsForLineno{alignat}%
\patchBothAmsMathEnvironmentsForLineno{gather}%
\patchBothAmsMathEnvironmentsForLineno{multline}%
}

\fi % End \ifPDH@lineno

% Creates a Watermark Draft at the specified location.
% The settings can be tweaked in the preamble

% Draft text
\newcommand\drafttext{Draft}
\renewcommand\SetDraftText[1]{%
  \renewcommand\drafttext{#1}}
% Draft Version
\newcommand\draftVersion{v1.0}
\renewcommand\SetDraftVersion[1]{%
  \renewcommand\draftVersion{#1}}
% Draft Gray Scale
\newcommand\draftGrayScale{0.75}
\renewcommand\SetDraftGrayScale[1]{%
  \renewcommand\draftGrayScale{#1}}

% Draft Content
\newcommand\DraftContent{%
\hspace*{\fill}
\Large
\textcolor[gray]{\draftGrayScale}{%
{\drafttext}\space-\space{\draftVersion}\hspace{\stretch{1}}{\PSUTHESIS@daytime}
\hspace*{\fill}}}

% Adding watermark in draft mode with time stamp
\RequirePackage{everypage}
\RequirePackage[absolute]{textpos}
% Default values for draft watermark
\newcommand\draftposition{top}
\newcommand\draftnodeanchor{1in+\voffset-\topmargin}
\AddEverypageHook{%
\begin{textblock*}{\paperwidth}[0.,2.5](0\paperwidth,\draftnodeanchor)
\DraftContent
\end{textblock*}
}

% Conditional evaluation to position the draft water mark  (top / bottom)
\renewcommand\SetDraftWMPosition[1]{%
  \renewcommand\draftposition{#1}
  \ifthenelse{\equal{\draftposition}{bottom}}
             {\renewcommand\draftnodeanchor{\paperheight-\voffset}} %Bottom
             {\ifthenelse{\equal{\draftposition}{top}}
               {\renewcommand\draftnodeanchor{1in+\voffset-\topmargin}} %Top
               {\ClassWarning{psuthesis}{Unrecognised draft position
                   using default value of top}
                 \renewcommand\draftnodeanchor{1in+\voffset-\topmargin}}} %Top

  \AddEverypageHook{%
    \begin{textblock*}{\paperwidth}[0.,2.5](0\paperwidth,\draftnodeanchor)
      \DraftContent
    \end{textblock*}
  }
}

% If NOT Draft Mode
\else 

\renewcommand\SetDraftText[1]{\ClassWarning{psuthesis}{DraftMode is
    inactive, to use SetDraftText include `draftmode' in the document 
    class options.}}
% Draft Version
\renewcommand\SetDraftVersion[1]{\ClassWarning{psuthesis}{DraftMode is
    inactive, to use SetDraftVersion include `draftmode' in the document
    class options.}}
% Draft Content
\renewcommand\SetDraftWMPosition[1]{\ClassWarning{psuthesis}{DraftMode
    is inactive, to use SetDraftWMPosition include `draftmode' in the document
    class options.}}

\renewcommand\SetDraftGrayScale[1]{\ClassWarning{psuthesis}{DraftMode is
    inactive, to use SetDraftWMPosition include `draftmode' in the document
    class options.}}
\fi




% ******************************* Bibliography *********************************
\ifPSUTHESIS@authoryear
  \ifPSUTHESIS@biblatex
    \RequirePackage[backend=biber, style=authoryear, citestyle=alphabetic, 
      sorting=nty, natbib=true]{biblatex}
    \setBiBLaTeXtrue
  \else
    \RequirePackage[round, sort, numbers, authoryear]{natbib} %author year
  \fi
\else
  \ifPSUTHESIS@numbered
    \ifPSUTHESIS@biblatex
      \RequirePackage[backend=biber, style=numeric-comp, 
        citestyle=numeric, sorting=none, natbib=true]{biblatex}
      \setBiBLaTeXtrue
    \else
      \RequirePackage[numbers,sort&compress]{natbib} % numbered citation
    \fi
  \else
    \ifuseCustomBib
       \AtBeginDocument{
          \@ifpackageloaded{natbib}{}{
            \@ifpackageloaded{biblatex}{}{
              \ClassWarning{psuthesis}{%
                You chose custom bibliography, but no corresponding package 
                (biblatex/natbib) has been loaded. Please load the
                appropriate bibliography package in the preamble.}
            }
          }
        }
    \else                                            % set default to numbered
      \ifPSUTHESIS@biblatex
        \RequirePackage[backend=biber, style=numeric-comp,
          citestyle=numeric, sorting=none, natbib=true]{biblatex}
        \setBiBLaTeXfalse
      \else
        \RequirePackage[numbers,sort&compress]{natbib} 
      \fi % default
      \setBibfalse
    \fi % custombib
  \fi % numbered
\fi % author year

\ifsetBib
\else
\ClassWarning{psuthesis}{No bibliography style was specified.
  Default numbered style is used. If you would like to use a 
  different style, use `authoryear' or `numbered' in the options in
  documentclass or use `custombib` and define the natbib package or
  biblatex package with required style in the Preamble.tex file}
\fi


%******************************* Print / Online ********************************
% Defines a print / online version to define page-layout and hyperrefering

% Moved below other usepackage definitions to fix PDFLaTeX footnote warning
% Based on the suggestion by John Plaice

\ifsetDVI
	\special{papersize=\the\paperwidth,\the\paperheight}
	\ifxetex
		\RequirePackage[unicode=true]{hyperref}
	\else
		\RequirePackage[dvips,unicode=true]{hyperref}
	\fi
\else
	\ifpdf % avoid error bable-thai hyperref appendix
	\else
	\RequirePackage[unicode=true]{hyperref}
	\fi
	%\pdfpagewidth=\the\paperwidth
	%\pdfpageheight=\the\paperheight
\fi

\if@print
    % For Print version
	\ifpdf % bable-thai hyperref appendix
	\else
    \hypersetup{
      final=true,
      plainpages=false,
      pdfstartview=FitV,
      pdftoolbar=true,
      pdfmenubar=true,
      bookmarksopen=true,
      bookmarksnumbered=true,
      breaklinks=true,
      linktocpage,
      colorlinks=true,
      linkcolor=black,
      urlcolor=black,
      citecolor=black,
      anchorcolor=black
    }
    \fi

    \ifsetCustomMargin
    % Margin to be define in preamble using geometry package
    \else
        \ifsetDVI
        % Odd and Even side Margin for binding and set viewmode for PDF
        \RequirePackage[top=1.5in, bottom=1in, left=1.5in, right=1in]{geometry}
		%\RequirePackage[dvips,paper=\PSUTHESIS@papersize,hmarginratio=1:1,total={210mm,297mm},
     		%vmarginratio=1:1,scale=1,left=1.5in,right=1in,top=1.4in,bottom=1in]{geometry}
          	%vmarginratio=1:1,scale=1,left=1.37in,right=1in,top=1.4in,bottom=1in]{geometry}
        \else
		%\RequirePackage[pdftex,paper=\PSUTHESIS@papersize,hmarginratio=1:1,total={210mm,297mm},
			%vmarginratio=1:1,scale=1,left=1.37in,right=1in,top=1.4in,bottom=1in]{geometry}
			\RequirePackage[top=1.5in, bottom=1in, left=1.5in, right=1in]{geometry}
          	
        \fi
    \fi

	\ifpdf
    \if@twoside
        \hypersetup{pdfpagelayout=TwoPageRight}
    \else
    	\hypersetup{pdfpagelayout=OneColumn}
    \fi
    \else
    \fi

\else
    % For PDF Online version
	\ifpdf % avoid bable-thai hyperref appendix
	\else
    \hypersetup{
      final=true,
      plainpages=false,
      pdfstartview=FitV,
      pdftoolbar=true,
      pdfmenubar=true,
      bookmarksopen=true,
      bookmarksnumbered=true,
      breaklinks=true,
      linktocpage,
      colorlinks=true,
      linkcolor=blue,
      urlcolor=blue,
      citecolor=blue,
      anchorcolor=green
    }
    \fi

    \ifsetCustomMargin
    % Margin to be define in preamble using geometry package
    \else
	% No Margin staggering on Odd and Even side
        \ifsetDVI
			\RequirePackage[dvips,paper=\PSUTHESIS@papersize,hmarginratio=1:1,total={210mm,297mm},
          		vmarginratio=1:1,scale=0.75,left=1.37in,right=.9in,top=1.4in,bottom=1in]{geometry}
          		 % left=1.5in,right=1in,top=1.5in,bottom=1in
        \else
			\RequirePackage[pdftex,paper=\PSUTHESIS@papersize,hmarginratio=1:1,total={210mm,297mm},
          		vmarginratio=1:1,scale=0.75,left=1.37in,right=.9in,top=1.4in,bottom=1in]{geometry}
        \fi
    \fi
	
	\ifpdf % avoid bable-thai hyperref appendix
    \else
    \hypersetup{pdfpagelayout=OneColumn}
    \fi
\fi

% Backward compatibility - setMargin is now replaced with customMargin
\ifsetCustomMargin
  \setMarginfalse
\else
  \setMargintrue
\fi

% ************************ URL Package and Definition **************************
\RequirePackage{url}
% Redefining urlstyle to use smaller fontsize in References with URLs
\newcommand{\url@leostyle}{%
 \@ifundefined{selectfont}{\renewcommand{\UrlFont}{\sffamily}}
 {\renewcommand{\UrlFont}{\normalsize}}}
\urlstyle{leo}

% option to split urls over multiple lines for latex >> DVIPS >> PDF option
% PDFLaTeX does it automatically.

\ifpdf
\ifsetDVI
\RequirePackage{breakurl} % to split the url over multiple lines
\fi
\else
\fi

% ******************************************************************************
% **************************** Pre-defined Settings ****************************
% ******************************************************************************

% *************************** Setting PDF Meta-Data ****************************
%\ifpdf
%\AtBeginDocument{
%  \hypersetup{
%    pdftitle = {\@title},
%    pdfauthor = {\@author},
%    pdfsubject={\@subject},
%    pdfkeywords={\@keywords}
%  }
%}
%\fi

% ******************************** Line Spacing ********************************
% Set spacing as 1.5 line spacing for the PSUTHESIS Thesis
% In practice, fortunately, nobody knows really what “one-and-a-half spaced
% type” means exactly (in terms of millimetres baseline distance). The following
% LaTeX setting has routinely been considered perfectly acceptable:

\renewcommand\baselinestretch{1.2}


% ******************************** Justification *******************************
% Left aligned as per University identity guidelines
\ifPSUTHESIS@textJustify
\message{psuthesis: The University identity guidelines recommend using 
left aligned text. Please use `flushleft' in the documentclass option, if you
wish to left align your text}
\else
\AtBeginDocument{
\raggedright
}
\fi


% ************************** TOC and Hide Sections *****************************
%\newcommand{\nocontentsline}[3]{}
%\newcommand{\tochide}[2]{
%	\bgroup\let
%	\addcontentsline=\nocontentsline#1{#2}
%	\egroup}
%% Removes pagenumber appearing from TOC
%\addtocontents{toc}{\protect\thispagestyle{empty}}


% chapter format
\usepackage{titlesec}
\titleformat
{\chapter} % command
[display] % shape
{\bfseries\large} % format
{\filcenter\chaptertitlename \ \thechapter} % label
{-0.7ex} % sep
{
    %\rule{\textwidth}{1pt}
    \vspace{1ex}
    \centering
} % before-code
[
\vspace{1em}%
] % after-code
\titlespacing{\chapter}{0pt}{-20pt}{0pt}

\titleformat{\section}
  {\large\bfseries}{\thesection}{1ex}{}
\titleformat{\subsection}
  {\normalfont\bfseries}{\thesubsection}{1ex}{}
\titleformat{\subsubsection}
  {\normalfont\bfseries}{\thesubsubsection}{1ex}{}
 
 
\setlength{\parindent}{1in}
%\setlength{\parskip}{1em}
\usepackage{indentfirst}
\setcounter{secnumdepth}{3}
\usepackage{ragged2e}

% ***************************** Header Formatting ******************************
% Custom Header with Chapter Number, Page Number and Section Numbering

\RequirePackage{fancyhdr} % Define custom header

% Set Fancy Header Command is defined to Load FancyHdr after Geometry is defined
\newcommand{\setFancyHdr}{
\pagestyle{fancy}
%
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

\setlength{\headheight}{14.5pt}
\setlength{\topmargin}{-.2in}
\setlength{\headsep}{.5in}
%\renewcommand{\headrulewidth}{0.5pt}
%\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{
\fancyhead{}
\fancyhf{}

\fancyhead[LE,RO]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}


% If Margin has been set (default margin print/online version)
\ifsetCustomMargin
\AtBeginDocument{
\@ifpackageloaded{geometry}{}{\ClassWarning{psuthesis}{%
  Custom margin is chosen, but geometry package is not loaded. Please load the
  `geometry' package in the preamble.}}}  
\else
	\setFancyHdr % Apply fancy header settings otherwise apply it in preamble
\fi

% **************** Clear Header Style on the Last Empty Odd pages **************
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else%
	\hbox{}%
	\thispagestyle{empty}  % Empty header styles
	\newpage%
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% ******************************** Roman Pages *********************************
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).


% new define
\newenvironment{romanpages}{
  \setcounter{page}{1}
  \renewcommand{\thepage}{\Roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}}

\ifsetTH
	\renewcommand{\thepage}{(\arabic{page})}
\else
	\renewcommand{\thepage}{\Roman{page}}
\fi




% ******************************************************************************
% **************************** Macro Definitions *******************************
% ******************************************************************************
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The title in thai name
\newcommand{\@titleTH}{}
\newcommand{\titleTH}[1]{\renewcommand{\@titleTH}{#1}}
\newcommand{\@authorTH}{}
\newcommand{\authorTH}[1]{\renewcommand{\@authorTH}{#1}}
\newcommand{\@authorTitle}{}
\newcommand{\authorTitle}[1]{\renewcommand{\@authorTitle}{#1}}
\newcommand{\@authorTitleTH}{}
\newcommand{\authorTitleTH}[1]{\renewcommand{\@authorTitleTH}{#1}}

\newcommand{\@studentID}{}
\newcommand{\studentID}[1]{\renewcommand{\@studentID}{#1}}

% The year and term the degree will be officially conferred
\newcommand{\@degreeyear}{\the\year}
\newcommand{\degreeyear}[1]{\renewcommand{\@degreeyear}{#1}}

% Academic year
\newcommand{\@academicyear}{\the\year}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}

% Academic year Thai bs
\newcommand{\@academicyearTH}{\the\year}
\newcommand{\academicyearTH}[1]{\renewcommand{\@academicyearTH}{#1}}

% The full (unabbreviated) name of the degree
\newcommand{\@degree}{}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}

\newcommand{\@degreeTH}{}
\newcommand{\degreeTH}[1]{\renewcommand{\@degreeTH}{#1}}

\newcommand{\@majorProgram}{}
\newcommand{\majorProgram}[1]{\renewcommand{\@majorProgram}{#1}}

\newcommand{\@majorProgramTH}{}
\newcommand{\majorProgramTH}[1]{\renewcommand{\@majorProgramTH}{#1}}


% The name of your University
\newcommand{\@university}{Prince of Songkla University}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\@universityTH}{มหาวิทยาลัยสงขลานครินทร์}
\newcommand{\universityTH}[1]{\renewcommand{\@universityTH}{#1}}

% Defining the crest
\newcommand{\@crest}{\includegraphics[width=2.3cm]{classes/logo/psubw.png}}
\newcommand{\crest}[1]{\renewcommand{\@crest}{#1}}


% Submission Text
\newcommand{\submissiontext}{A Thesis Submitted in Fullfillment of the Requirement for the Degree of}
\newcommand{\submissiontextTH}{วิทยานิพนธ์นี้สำหรับการศึกษาตามหลักสูตรปริญญา}

\newcommand{\@studyplan}{PhD1}
\newcommand{\studyplan}[1]{%
  \renewcommand{\@studyplan}{#1}
  \ifthenelse{\equal{#1}{PhD2} \OR \equal{#1}{M2}}
  {%
	\renewcommand{\submissiontext}{A Thesis Submitted in Partial Fullfillment of the Requirement for the Degree of}
	\renewcommand{\submissiontextTH}{วิทยานิพนธ์นี้เป็นส่วนหนึ่งของการศึกษาตามหลักสูตรปริญญา}
  }{}
}


% keywords (These keywords will appear in the PDF meta-information
% called `pdfkeywords`.)
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

% subjectline (This subject will appear in the PDF meta-information
% called `pdfsubject`.)
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}

% Approval Page
\newcommand{\@majoradvisor}{}
\newcommand{\majoradvisor}[1]{\renewcommand{\@majoradvisor}{#1}}

\newcommand{\@coadvisor}{}
\newcommand{\coadvisor}[1]{\renewcommand{\@coadvisor}{#1}}

\newcommand{\@committeeOne}{}
\newcommand{\committeeOne}[1]{\renewcommand{\@committeeOne}{#1}}

\newcommand{\@committeeTwo}{}
\newcommand{\committeeTwo}[1]{\renewcommand{\@committeeTwo}{#1}}

\newcommand{\@committeeThree}{}
\newcommand{\committeeThree}[1]{\renewcommand{\@committeeThree}{#1}}

\newcommand{\@committeeFour}{}
\newcommand{\committeeFour}[1]{\renewcommand{\@committeeFour}{#1}}

\newcommand{\@committeeFive}{}
\newcommand{\committeeFive}[1]{\renewcommand{\@committeeFive}{#1}}

\newcommand{\@deanOfGraduateSchool}{}
\newcommand{\deanOfGraduateSchool}[1]{\renewcommand{\@deanOfGraduateSchool}{#1}}

% These macros define an environment for front matter that is always
% single column even in a double-column document.
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% Set single column even under two column layout
\newcommand{\setsinglecolumn}{
\if@twocolumn
   \onecolumn
\else
\fi
}


% ******************************************************************************
% *************************** Front Matter Layout ******************************
% ******************************************************************************

% ******************************** titlepage  **********************************

% Fix issue of title page having same number as the next page in oneside option
% Issue #24 https://github.com/kks32/PSUTHESIS-thesis-template/issues/24
%\if@oneside
\renewenvironment{titlepage} % changed from "newenvironment"
{%
\begingroup
\newpage
\thispagestyle{empty}
%\setcounter{page}\z@ 
}%
{
\endgroup
\clearpage
% create empty page
\newpage
\thispagestyle{empty}
\mbox{}
\clearpage
%\addtocounter{page}{1}
}
%\fi

\newenvironment{innertitlepage} % changed from "newenvironment"
{%
\begingroup
\newpage
\setcounter{page}\z@ 
\addtocounter{page}{1}
%\thispagestyle{empty}
%\setcounter{page}\z@ 
}%
{
\endgroup
\clearpage
%\addtocounter{page}{1}
}

\newenvironment{othertitlepage} % changed from "newenvironment"
{%
\begingroup
\newpage
%\thispagestyle{empty}
%\setcounter{page}\z@ 
}%
{
\endgroup
\clearpage
%\addtocounter{page}{1}
}


% ******************************** Title Page **********************************
\renewcommand{\maketitle}{
\makePSUthesistitle
}

\newcommand{\makePSUthesistitle}
{
% To compute the free vertical space in Title page
\computeTitlePageSpacing

%\renewcommand*{\thepage}{i}

\begin{doublespacing}
\begin{center}

% Crest
{\@crest \par}
\vspace*{.5ex}

% Title
\ifsetTH
{\large\bfseries{\@titleTH}\par}
\vspace*{1ex}
\else
\fi
{\large\bfseries{\@title}\par}

\ifsetTH
\vspace{.4\PSUTHESIS@titlepagespacing}
\else
\vspace{.4\PSUTHESIS@titlepagespacing}
\fi

% Author

\ifsetTH
{\large\bfseries{\@authorTH}\par}
\else
\fi
{\large\bfseries{\@author}\par}

\ifsetTH
\vspace{.4\PSUTHESIS@titlepagespacing}
\else
\vspace{.4\PSUTHESIS@titlepagespacing}
\fi

% Submission Text
\ifsetTH
{\large\bfseries{\submissiontextTH}\par}
{\large\bfseries{\@degreeTH} สาขาวิชา{\@majorProgramTH}\par}
{\large\bfseries{\@universityTH}\par}
\vspace*{1ex}
\else
\fi

\ifthenelse{\equal{\@studyplan}{M1} \OR \equal{\@studyplan}{PhD1}}{
{\large\bfseries{\submissiontext}\par}
}{
\resizebox{\linewidth}{!}{\large\bfseries{\spaceskip=.5\fontdimen2\font\xspaceskip=0pt\relax\submissiontext}\par}
}
{\large\bfseries{\@degree} in {\@majorProgram}\par}
{\large\bfseries{\@university}\par}
\vspace*{2ex}

% Year and Copy right
{\large\bfseries{\@degreeyear}\par}
\ifsetTH
{\large\bfseries{ลิขสิทธิ์ของ\@universityTH}\par}
\else
{\large\bfseries{Copyright of \@university}\par}
\fi
\end{center}
\end{doublespacing}
}



% ******************************** Approval Page **********************************

% length
\newcommand{\computeSignBoxWidth}{
\@ifundefined{PSUTHESIS@advisorwidth}
{
\newlength{\PSUTHESIS@advisorwidth}
}{}
\@ifundefined{PSUTHESIS@majoradvisorwidth}
{
\newlength{\PSUTHESIS@majoradvisorwidth}
}{}
\@ifundefined{PSUTHESIS@coadvisorwidth}
{
\newlength{\PSUTHESIS@coadvisorwidth}
}{}
\@ifundefined{PSUTHESIS@cadidatewidth}
{
\newlength{\PSUTHESIS@cadidatewidth}
}{}
\@ifundefined{PSUTHESIS@declarationwidth}
{
\newlength{\PSUTHESIS@declarationwidth}
}{}

\setlength{\PSUTHESIS@majoradvisorwidth}{\widthof{(\@majoradvisor)}}
\setlength{\PSUTHESIS@coadvisorwidth}{\widthof{(\@coadvisor)}}

\ifsetTH
\setlength{\PSUTHESIS@cadidatewidth}{\widthof{(\@authorTitleTH\@authorTH)}}
\else
\setlength{\PSUTHESIS@cadidatewidth}{\widthof{(\@authorTitle~\@author)}}
\fi
		
\ifthenelse{\PSUTHESIS@majoradvisorwidth > \PSUTHESIS@coadvisorwidth}
		{\setlength{\PSUTHESIS@advisorwidth}{\PSUTHESIS@majoradvisorwidth}}
		{\setlength{\PSUTHESIS@advisorwidth}{\PSUTHESIS@coadvisorwidth}}


\ifthenelse{\PSUTHESIS@advisorwidth > \PSUTHESIS@cadidatewidth}
		{\setlength{\PSUTHESIS@declarationwidth}{\PSUTHESIS@advisorwidth}}
		{\setlength{\PSUTHESIS@declarationwidth}{\PSUTHESIS@cadidatewidth}}
}

\newcommand{\makeApprovalPage}
{
% To compute the free vertical space in Title page
\begin{onehalfspacing}
	\begin{flushleft}
		\begin{tabular*}{\textwidth}{@{}p{.18\textwidth} P{.8\textwidth}@{}}
			\ifsetTH
				\textbf{ชื่อวิทยานิพนธ์} & \@titleTH \\
				\textbf{ผู้เขียน}& \@authorTitleTH\@authorTH \\
				\textbf{สาขาวิชา}& \@majorProgramTH \\
			\else
				\textbf{Thesis Title} & \@title \\
				\textbf{Author}& \@authorTitle~\@author \\
				\textbf{Major Program}& \@majorProgram \\
			\fi
		\end{tabular*}
		
		\vspace{1ex}
		\hrule height .7pt
		\vspace{1em}
		
%% initial approval page %%
		\def\majorAdvisorLabel{
			\ifsetTH
				\textbf{อาจารย์ที่ปรึกษาวิทยานิพนธ์หลัก} 
			\else
				\textbf{Major Advisor:}
			\fi
		}
		
		\def\coAdvisorLabel{
			\ifsetTH
				\textbf{อาจารย์ที่ปรึกษาวิทยานิพนธ์ร่วม} 
			\else
				\textbf{Co-advisor:}
			\fi
		}
		
		\def\examiningCommitteeLabel{
			\ifsetTH 
				\textbf{คณะกรรมการสอบ} 
			\else
				\textbf{Examining Committee:}
			\fi
		}
		
		\def\chairpersonLabel{
			\ifsetTH
				ประธานกรรมการ
			\else
				Chairperson
			\fi
		}
		
		\def\committeeLabel{
			\ifsetTH
				กรรมการ
			\else
				Committee
			\fi
		}
		
		\computeSignBoxWidth
%% end initial approval page %%

		\begin{tabular*}{\textwidth}{@{}p{.48\textwidth} p{.49\textwidth}@{}}
			\majorAdvisorLabel & \examiningCommitteeLabel \\
			\vspace*{1em} & \\
			{\makebox[\PSUTHESIS@advisorwidth]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}} & {{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}\chairpersonLabel} \\ 
			(\@majoradvisor) & (\@committeeOne) \\  
			\vspace*{1em} & \\ 
			&{{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}\committeeLabel}\\
			\ifthenelse{\equal{\@coadvisor}{}}
				{}{\textbf{\coAdvisorLabel}}
			& (\@committeeTwo) \\ 
			\vspace*{1em} & \\ 
			{\ifthenelse{\equal{\@coadvisor}{}}
				{}{\makebox[\PSUTHESIS@advisorwidth]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}}}
			& {{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}\committeeLabel}\\
			{\ifthenelse{\equal{\@coadvisor}{}}
				{}{(\@coadvisor)}} & (\@committeeThree) \\ 
			\vspace*{1em} & \\
			\ifthenelse{\equal{\@committeeFour}{}}
				{\\ \\ \vspace*{1em} & \\}
				{ 
					& {{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}\committeeLabel}\\
					& (\@committeeFour) \\
					\vspace*{1em} & \\
				}
			\ifthenelse{\equal{\@committeeFive}{}}
				{\\ \\ \vspace*{1em} & \\}
				{
					& {{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}\committeeLabel} \\
					& (\@committeeFive) \\ 
				}
		\end{tabular*}
	
\end{flushleft}

\vspace{3em}

\ifsetTH
%\setlength{\parindent}{1in}
%\noindent
\ifthenelse{\equal{\@studyplan}{M1} \OR \equal{\@studyplan}{PhD1}}{
{บัณฑิตวิทยาลัย~~~มหาวิทยาลัยสงขลานครินทร์~~~~อนุมัติให้นับวิทยานิพนธ์ฉบับนี้}
{สำหรับการศึกษา~ตามหลักสูตรปริญญา\@degreeTH ~สาขาวิชา\@majorProgramTH}
}{
{บัณฑิตวิทยาลัย~~~มหาวิทยาลัยสงขลานครินทร์~~~อนุมัติให้นับวิทยานิพนธ์ฉบับนี้}
{เป็นส่วนหนึ่งของการศึกษา~ตามหลักสูตรปริญญา\@degreeTH ~สาขาวิชา\@majorProgramTH}
}
\else
\setlength{\parindent}{1in}
{The Graduate School, Prince of Songkla University, has approved this thesis as} %\break
%\setlength{\parindent}{0in}
\ifthenelse{\equal{\@studyplan}{M1} \OR \equal{\@studyplan}{PhD1}}{
{fulfillment of the requirements for the \@degree~Degree in \@majorProgram.}
}{
{partial fulfillment of the requirements for the \@degree~Degree in \@majorProgram.}
}
\fi
\noindent
\vspace{2ex}\\
	\begin{flushright}
		\begin{tabular}{c}
		{\makebox[\widthof{(\@deanOfGraduateSchool)}]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}}\\
		(\@deanOfGraduateSchool)\\
		\ifsetTH
		{คณบดีบัณฑิตวิทยาลัย}
		\else
		{Dean of Graduate School}
		\fi
		\end{tabular}
	\end{flushright}

\end{onehalfspacing}
}



% ******************************** Declaration Page **********************************
\newcommand{\makeDeclaration}
{
% To compute the free vertical space in Title page
\begin{onehalfspacing}
%\begin{flushleft}
\setlength{\parindent}{0in}
\ifsetTH
{ขอรับรองว่า ผลงานวิจัยนี้มาจากการศึกษาวิจัยของนักศึกษาเอง และได้แสดงความขอบคุณบุคคลที่มีส่วนช่วยเหลือแล้ว}
\else
{This is to certify that the work here submitted is the result of the candidate's own investigations. Due acknowledgement has been made of any assistance received.}
\fi
\vspace{3em}\\
	\computeSignBoxWidth
\hspace*{.5\textwidth}
		\begin{tabular}{l}
			{\makebox[\PSUTHESIS@declarationwidth]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}}\\
			(\@majoradvisor)\\ 
			\ifsetTH
				{อาจารย์ที่ปรึกษาวิทยานิพนธ์หลัก}\\
			\else
				{Major Advisor}\\
			\fi
			\vspace{2em}\\
			\ifthenelse{\equal{\@coadvisor}{}}
			{}{{\makebox[\PSUTHESIS@declarationwidth]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}}\\
			(\@coadvisor)\\ 
			\ifsetTH
				{อาจารย์ที่ปรึกษาวิทยานิพนธ์ร่วม}\\
			\else
				{Co-Advisor}\\
			\fi
			\vspace{2em}\\
			}{\makebox[\PSUTHESIS@declarationwidth]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}}\\
			\ifsetTH 
				(\@authorTitleTH\@authorTH)\\
				{นักศึกษา}\\
			\else
				(\@authorTitle~\@author)\\
				{Candidate}\\
			\fi
		\end{tabular}
\end{onehalfspacing}

\newpage
\begin{onehalfspacing}
%\begin{flushleft}
\setlength{\parindent}{0in}
\ifsetTH
{ข้าพเจ้าขอรับรองว่า ผลงานวิจัยนี้ไม่เคยเป็นส่วนหนึ่งในการอนุมัติปริญญาในระดับใดมาก่อน และไม่ได้ถูกใช้ในการยื่นขออนุมัติปริญญาในขณะนี้}
\else
{I hereby cetify that this work has not been accepted in substance for any degree, and is not being currently submitted in candidature for any degree.}
\fi
\vspace{3em}\\
\hspace*{.5\textwidth}
		\begin{tabular}{l}
			\ifsetTH
				{\makebox[\widthof{(\@authorTitleTH\@authorTH)}]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}}\\ 
				(\@authorTitleTH\@authorTH)\\
				{นักศึกษา}\\
			\else
				{\makebox[\widthof{(\@authorTitle~\@author)}]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}}\\
				(\@authorTitle~\@author)\\
				{Candidate}\\
			\fi
		\end{tabular}

\end{onehalfspacing}
}

% ****************************** VITAE ********************************
% The VITAE environment puts a large, bold, centered
% "VITAE" label at the top of the page.

\newenvironment{vitae}{
\cleardoublepage
\setsinglecolumn
\ifsetTH
\chapter*{\centering ประวัติผู้เขียน}
\addcontentsline{toc}{chapter}{ประวัติผู้เขียน}
\else
\chapter*{\centering VITAE}
\addcontentsline{toc}{chapter}{VITAE}
\fi

%\thispagestyle{empty}
\begin{flushleft}
	\begin{tabular*}{\textwidth}{@{}p{.18\textwidth} p{.8\textwidth}@{}}
		\ifsetTH
		\textbf{ชื่อ สกุล} & \@authorTitleTH\@authorTH  \\
		\textbf{รหัสนักศึกษา} & \@studentID \\
		\else
		\textbf{Name} & \@authorTitle~\@author  \\
		\textbf{Student ID} & \@studentID \\
		\fi
	\end{tabular*}
\end{flushleft}
}

% ****************************** Acknowledgements ********************************
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page.

\newenvironment{acknowledgements}{
\cleardoublepage
\setsinglecolumn
\ifsetTH
	\chapter*{\centering กิตติกรรมประกาศ}
	\addcontentsline{toc}{chapter}{กิตติกรรมประกาศ}
\else
	\chapter*{\centering ACKNOWLEDGEMENT}
	\addcontentsline{toc}{chapter}{ACKNOWLEDGEMENT}
\fi

%\thispagestyle{empty}
\begingroup
}
{
\vspace{1em}
\flushright
\ifsetTH
\@authorTH{}\\
\else
\@author{}\\
\fi
\vfill
\endgroup
\newpage
}

% ****************************** Abbreviations and Symbols ********************************
% The acknowledgements environment puts a large, bold, centered
% "Abbreviations and Symbols" label at the top of the page.

\newenvironment{abbreviations}{
\cleardoublepage
\setsinglecolumn
\ifsetTH
\chapter*{\centering สัญลักษณ์คำย่อและตัวย่อ}
\addcontentsline{toc}{chapter}{สัญลักษณ์คำย่อและตัวย่อ}
\else
\chapter*{\centering LIST OF ABBREVIATIONS AND SYMBOLS}
\addcontentsline{toc}{chapter}{LIST OF ABBREVIATIONS AND SYMBOLS}
\fi

\begingroup
}
{
\vfill
\endgroup
\newpage
}

% ****************************** Abstract ********************************
\newenvironment{abstract} {
% english abstract in the thesis
\cleardoublepage
\setsinglecolumn

\begin{flushleft}
	\begin{tabular*}{\textwidth}{@{}p{.19\textwidth} P{.8\textwidth}@{}}
		\textbf{Thesis Title} & {\@title} \\
		\textbf{Author} & \@authorTitle~\@author \\
		\textbf{Major Program} & \@majorProgram \\
		\textbf{Academic Year} & \@academicyear \\
	\end{tabular*}
\end{flushleft}

\vspace{2em}
\begingroup
\let\clearpage\relax
\chapter*{\centering ABSTRACT}
\addcontentsline{toc}{chapter}{ABSTRACT}
%\thispagestyle{empty}
\endgroup
}

\newenvironment{abstractTH} {
% thai abstract in the thesis
\cleardoublepage
\setsinglecolumn
\begin{flushleft}
	\begin{tabular*}{\textwidth}{@{}p{.18\textwidth} P{.8\textwidth}@{}}
		\textbf{ชื่อวิทยานิพนธ์} & \@titleTH \\
		\textbf{ผู้เขียน}& \@authorTitleTH\@authorTH \\
		\textbf{สาขาวิชา}& \@majorProgramTH \\
		\textbf{ปีการศึกษา}& \@academicyearTH \\
	\end{tabular*}
\end{flushleft}

\vspace{2em}
\begingroup
\let\clearpage\relax
\chapter*{บทคัดย่อ}
\ifsetTH
\addcontentsline{toc}{chapter}{บทคัดย่อ}
\else
\fi
\endgroup

%\thispagestyle{empty}
}


% ******************************* Nomenclature *********************************
\RequirePackage{nomencl}
\makenomenclature
\renewcommand{\nomgroup}[1]{%
\ifthenelse{\equal{#1}{A}}{\item[\textbf{Roman Symbols}]}{%
\ifthenelse{\equal{#1}{G}}{\item[\textbf{Greek Symbols}]}{%
\ifthenelse{\equal{#1}{Z}}{\item[\textbf{Acronyms / Abbreviations}]}{%
\ifthenelse{\equal{#1}{R}}{\item[\textbf{Superscripts}]}{%
\ifthenelse{\equal{#1}{S}}{\item[\textbf{Subscripts}]}{%
\ifthenelse{\equal{#1}{X}}{\item[\textbf{Other Symbols}]}
{}
}% matches mathematical symbols > X
}% matches Subscripts           > S
}% matches Superscripts         > R
}% matches Abbreviations        > Z
}% matches Greek Symbols        > G
}% matches Roman Symbols        > A

% To add nomenclature in the header
\renewcommand{\nompreamble}{\markboth{\nomname}{\nomname}}

% Add nomenclature to contents and print out nomenclature
\newcommand{\printnomencl}[1][]{
\ifthenelse{\equal {#1}{}}
{\printnomenclature}
{\printnomenclature[#1]}
\addcontentsline{toc}{chapter}{\nomname}
}


% ***************************** Create the index *******************************
\ifPSUTHESIS@index
    \RequirePackage{makeidx}
    \makeindex
    \newcommand{\printthesisindex}{
        \cleardoublepage
        \phantomsection
        \printindex}
\else
    \newcommand{\printthesisindex}{}
\fi




% ******************** To compute empty space in title page ********************
% Boxes below are used to space different contents on the title page
% Based on https://github.com/cambridge/thesis

\newcommand{\computeTitlePageSpacing}{

% University Crest Box
\@ifundefined{PSUTHESIS@crest}
{
\newsavebox{\PSUTHESIS@crest}
}{}

\begin{lrbox}{\PSUTHESIS@crest}
\begin{doublespacing}
{\@crest \par}
\vspace*{.5ex}
\end{doublespacing}
\end{lrbox}


% Title Box
\@ifundefined{PSUTHESIS@Title}
{
\newsavebox{\PSUTHESIS@Title}
}{}

\begin{lrbox}{\PSUTHESIS@Title}
\begin{minipage}[c]{0.98\textwidth}
\begin{doublespacing}
\begin{center}
\ifsetTH
{\large\bfseries{\@titleTH}\par}
\vspace*{1ex}
\else
\fi
{\large\bfseries{\@title}\par}
\end{center}
\end{doublespacing}
\end{minipage}
\end{lrbox}

% Author Box
\@ifundefined{PSUTHESIS@author}
{
\newsavebox{\PSUTHESIS@author}
}{}

\begin{lrbox}{\PSUTHESIS@author}
\begin{minipage}[c]{0.98\textwidth}
\begin{doublespacing}
\begin{center}
\ifsetTH
{\large\bfseries{\@authorTH} \par}
\else
\fi
{\large\bfseries{\@author} \par}
\end{center}
\end{doublespacing}
\end{minipage}
\end{lrbox}

% Submission Box
\@ifundefined{PSUTHESIS@submission}
{
\newsavebox{\PSUTHESIS@submission}
}{}

\begin{lrbox}{\PSUTHESIS@submission}
\begin{minipage}[c]{0.98\textwidth}
\begin{doublespacing}
\begin{center}
% Submission Text
\ifsetTH
{\large\bfseries{\submissiontextTH}\par}
{\large\bfseries{\@degreeTH} สาขาวิชา{\@majorProgramTH}\par}
{\large\bfseries{\@universityTH}\par}
\vspace*{1ex}
\else
\fi

\ifthenelse{\equal{\@studyplan}{M1} \OR \equal{\@studyplan}{PhD1}}{
{\large\bfseries{\submissiontext}\par}
}{
\resizebox{\linewidth}{!}{\large\bfseries{\spaceskip=.5\fontdimen2\font\xspaceskip=0pt\relax\submissiontext}\par}
}
{\large\bfseries{\@degree} in {\@majorProgram}\par}
{\large\bfseries{\@university}\par}
\vspace*{2ex}
\end{center}
\end{doublespacing}
\end{minipage}
\end{lrbox}

% College and Date Box
\@ifundefined{PSUTHESIS@year}
{
\newsavebox{\PSUTHESIS@year}
}{}

\begin{lrbox}{\PSUTHESIS@year}
\begin{minipage}[c]{0.98\textwidth}
\begin{doublespacing}
\begin{center}
{\large\bfseries{\@degreeyear}\par}
\ifsetTH
{\large\bfseries{ลิขสิทธิ์ของ\@universityTH}\par}
\else
{\large\bfseries{Copyright of \@university}\par}
\fi
\end{center}
\end{doublespacing}
\end{minipage}
\end{lrbox}

%  Now to compute the free vertical space

\@ifundefined{PSUTHESIS@titlepagespacing}
{
\newlength{\PSUTHESIS@titlepagespacing}
}{}
\setlength{\PSUTHESIS@titlepagespacing}{ \textheight %
			- \totalheightof{\usebox{\PSUTHESIS@Title}}
			- \totalheightof{\usebox{\PSUTHESIS@crest}}
			- \totalheightof{\usebox{\PSUTHESIS@author}}
			- \totalheightof{\usebox{\PSUTHESIS@submission}}
			- \totalheightof{\usebox{\PSUTHESIS@year}}
	}
}

