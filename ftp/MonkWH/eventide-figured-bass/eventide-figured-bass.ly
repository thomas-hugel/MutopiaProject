\version "2.20.0"
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
    title = "Eventide"
    composer = "William Henry Monk (1823-1889)"
    %opus = "Opus 0"
    %piece = "Left-aligned header"
    date = "1861"
    style = "Hymn"
    meter = "10.10.10.10"
    source = "https://hymnary.org/text/abide_with_me_fast_falls_the_eventide"

    mutopiatitle = "Eventide (figured bass)"
    %mutopiaopus = "Op.0"
    mutopiacomposer = "MonkWH"
    %--A list of instruments can be found at http://www.mutopiaproject.org/browse.html#byInstrument
    %--Multiple instruments are separated by a comma
    mutopiainstrument = "Organ"
}
global = {
  \key ees \major
  \time 4/4
}

upperStaff = \relative c'' {
  g2 g4 f |
  ees2 bes' |
  c4 bes bes aes |
  g1\fermata | \break \octaveCheck g'
  g2 aes4 bes |
  c2 bes |
  aes4 f g a |
  bes1\fermata | \break \octaveCheck b'
  g2 g4 f |
  ees2 bes' |
  bes4 aes aes g |
  f1\fermata | \break \octaveCheck f'
  f2 g4 aes |
  g f ees aes |
  g2 f |
  ees1\fermata \bar "|." \barNumberCheck #16
}

figs = \figuremode {
  <_>2 <6>4 <7 _\+> |
  <_>2 <6> |
  <_>4 <_> <7> <6 5/> |
  <_>1 | \break \barNumberCheck #4
  <_>2 <6>4 <6 4> |
  <_>2 <_> |
  <7>4 <6> <_> <6\+ 3> |
  <_>1 | \break \barNumberCheck #8
  <_>2 <6>4 <7 _\+> |
  <_>2 <6> |
  \bassFigureExtendersOn
  <9>4 <8>8 <8> <6 3\+>4 <7 _\+> |
  \bassFigureExtendersOff
  <_>1 | \break \barNumberCheck #12
  <4\+>2 <6>4 <6\+> |
  <_> <7 _\+> <_> <6> |
  <6 4>2 <_>4 <7 _\+> |
  <_>1 \barNumberCheck #16
}

lowerStaff = \relative c {
  ees2 bes4 bes |
  c2 g |
  aes4 bes c d |
  ees1\fermata | \break \octaveCheck e
  ees4( d) c bes |
  aes2 ees' |
  f4 d ees c |
  bes1\fermata | \break \octaveCheck b,
  ees2 bes4 bes |
  c2 g |
  aes4. bes8 c4 c |
  f1\fermata | \break \octaveCheck f
  aes2 g4 f |
  ees bes c aes |
  bes2 bes |
  ees1\fermata \bar "|." \barNumberCheck #16
}%---------------------------------------------------------------------
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


\layout {
  \context {
    \PianoStaff \override VerticalAxisGroup.staff-staff-spacing = % .basic-distance = #50
      #'((basic-distance . 2) 
         (minimum-distance . 2)
         (padding . 1)
         (stretchability . 5)) % default 60
  }
  \context {
    \FiguredBass \override VerticalAxisGroup.staff-affinity = #CENTER
  }
  
}

\score {
    \context PianoStaff  <<
        \set PianoStaff.midiInstrument = "church organ"
        \new Staff { \clef treble \global \upperStaff }
        \new FiguredBass { \figs }
        \new Staff { \clef bass \global \lowerStaff }
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
    maintainerEmail = "thomas -a|t- hugel.tf"
    maintainerWeb = "https://thomas.hugel.tf/"
    license = "Creative Commons Attribution-ShareAlike 4.0"
    year = "2020"

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
