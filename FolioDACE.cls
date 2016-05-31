\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FolioDACE}[2016/05/06 Folio for DACE]

\LoadClass{article}
\usepackage[headheight=55pt, right=0.1in, top=2.25in]{geometry}% We change the right margin, so that the header is correctly placed.
\newcommand\fourdigits[1]{% This command is used to change the formating of a number to have 4 digits.
   \ifnum#1<10 000#1\else \ifnum#1<100 00#1\else \ifnum#1<1000 0#1 \else #1 \fi\fi\fi
}
\usepackage{fancyhdr}% http://ctan.org/pkg/fancyhdr
\fancypagestyle{VerticalNumbering}{%
  \fancyhf{}% Clear header/footer
  \fancyhead{% Header
  \makebox[\textwidth][r]{% Right
  \rotatebox{90}{\ttfamily\fontsize{20pt}{20pt}\selectfont	\fourdigits{\thepage}}}}}% Rotates the header box containing the page number and increases it's digit count.
\renewcommand{\headrulewidth}{0pt}% No header rule
\renewcommand{\footrulewidth}{0pt}% No footer rule