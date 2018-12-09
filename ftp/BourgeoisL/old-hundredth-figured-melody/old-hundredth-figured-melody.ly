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
    title = "Old Hundredth"
    composer = "Louis Bourgeois (1510-1560)"
    %opus = "Opus 0"
    %piece = "Left-aligned header"
    date = "1551"
    style = "Hymn"
    meter = "8.8.8.8 (long meter)"
    source = "https://hymnary.org/media/fetch/147916"

    mutopiatitle = "Old Hundredth (figured melody)"
    %mutopiaopus = "Op.0"
    mutopiacomposer = "BourgeoisL"
    %--A list of instruments can be found at http://www.mutopiaproject.org/browse.html#byInstrument
    %--Multiple instruments are separated by a comma
    mutopiainstrument = "Organ"
}
global = {
  \key g \major
  \time 4/4
}

upperStaff = \relative c'' {
  \partial 2 g2 |
  g4 fis e d |
  g2 a |
  b\fermata b | \octaveCheck b'
  b4 b a g |
  c2 b |
  a\fermata g | \octaveCheck g'
  a4 b a g |
  e2 fis |
  g\fermata d' | \octaveCheck d''
  b4 g a c |
  b2 a |
  g\fermata \bar "|." \barNumberCheck #12
}

figs = \figuremode {
  \bassFigureExtendersOn
  \partial 2 <8>2 |
  <8>4 <3> <8> <3> |
  <3>2 <5 4>4 <5 3> |
  <3\!>2 <3\!> |
  <3>4 <3> <5> <3> |
  <8>2 <3> |
  <5> <3> |
  <5>4 <3> <5> <6> |
  <3>2 <6\+ 3\!> |
  <8> <6> |
  <3>4 <3> <5> <3> |
  <8 6>2 <5 4>4 <5 3> |
  <8>2 \barNumberCheck #12
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

