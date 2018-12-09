\version "2.19.82"
\paper {
    markup-system-spacing =
    #'((basic-distance . 12) 
       (minimum-distance . 8)
       (padding . 1)
       (stretchability . 10)) % default 60
    system-system-spacing =
    #'((basic-distance . 12) 
       (minimum-distance . 8)
       (padding . 1)
       (stretchability . 3)) % default 60
}


\header {
    title = "Winchester Old"
    composer = "George Kirbye (1565-1634)"
    %opus = "Opus 0"
    %piece = "Left-aligned header"
    date = "1592"
    style = "Hymn"
    meter = "8.6.8.6 (common meter)"
    source = "https://hymnary.org/tune/winchester_old"

    mutopiatitle = "Winchester Old (figured melody)"
    %mutopiaopus = "Op.0"
    mutopiacomposer = "KirbyeG"
    %--A list of instruments can be found at http://www.mutopiaproject.org/browse.html#byInstrument
    %--Multiple instruments are separated by a comma
    mutopiainstrument = "Organ"
}
global = {
  \key f \major
  \time 4/4
}

upperStaff = \relative c' {
  \partial 4 f4 |
  a4. a8 g4 f |
  bes bes a \breathe g |
  a c c b |
  c2. \breathe a4 | \octaveCheck a'
  d4. c8 bes4 a |
  g f e \breathe a |
  g f f e |
  f2. \bar "|." \barNumberCheck #8
}

figs = \figuremode {
  \bassFigureExtendersOn
  <8>4 |
  <3>4. <3>8 <5>4 <3> |
  <8> <8> <3> <5> |
  <3> <6> <4> <_!> |
  <8>2. <3>4 |
  <3>4. <5>8 <6>4 <3> |
  <5> <3> <5> <3> |
  <5> <3> <5> <3> |
  <8>2. \barNumberCheck #8
}
%---------------------------------------------------------------------
%--Paper-size setting must be commented out or deleted upon submission.
%--LilyPond engraves to paper size A4 by default.
%--Uncomment the setting below to validate your typesetting
%--in "letter" sizing.
%--Mutopia publishes both A4 and letter-sized versions.
%---------------------------------------------------------------------
% #(set-default-paper-size "letter")

%--Default staff size is 20
#(set-global-staff-size 20)

\paper {
    top-margin = 8\mm                              %-minimum: 8 mm
    top-markup-spacing.basic-distance = #6         %-dist. from bottom of top margin to the first markup/title
    top-system-spacing.basic-distance = #12        %-dist. from top margin to system in pages with no titles
    last-bottom-spacing.padding = #2               %-min #1.5 -pads music from copyright block 
    ragged-bottom = ##f
    ragged-last-bottom = ##f
}



%-------Typeset music and generate midi


\score {
    <<
        \new FiguredBass { \figs }
        \new Staff { \clef treble \global \upperStaff }
    >>
    \layout{}
    \midi  { \tempo 4 = 42 }
}

%---------------------------------------------------------------------
%--Refer to http://www.mutopiaproject.org/contribute.html
%--for usage and possible values for header variables.
%---------------------------------------------------------------------
\header {
    maintainer = "Thomas Hugel"
    maintainerEmail = "thomas.hugel -a|t- yandex.com"
    maintainerWeb = "https://thomas-hugel.gitlab.io/"
    license = "Creative Commons Attribution-ShareAlike 4.0"
    year = "2018"

    % Footer, tagline, and copyright blocks are included here for reference
    % and spacing purposes only.  There's no need to change these.
    % These blocks will be overridden by Mutopia during the publishing process.
    % footer = "Mutopia-2018"
    copyright = \markup {
      \override #'(baseline-skip . 0 )
      \right-column {
        \sans \bold \with-url #"http://www.MutopiaProject.org" {
          \abs-fontsize #9 "Mutopia " \concat {
            \abs-fontsize #12 \with-color #white \char ##x01C0 \abs-fontsize #9 "Project "
          }
        }
      } \override #'(baseline-skip . 0 ) \center-column {
        \abs-fontsize #11.9 \with-color #grey \bold { 
          \char ##x01C0 \char ##x01C0
        } 
      } \override #'(baseline-skip . 0 ) \column { 
        \abs-fontsize #8 \sans \concat {
          " Typeset using " \with-url #"http://www.lilypond.org" "LilyPond" " by " \maintainer " in " \year "."
        } \concat {
          \concat {
            \abs-fontsize #8 \sans{
              " Licensed under " \license " (CC BY-SA 4.0)."
            }
          } \abs-fontsize #13 \with-color #white \char ##x01C0
        }
      }
    }
    tagline = ##f
}

