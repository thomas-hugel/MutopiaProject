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
    title = "New Britain"
    composer = "Traditional"
    %opus = "Opus 0"
    %piece = "Left-aligned header"
    date = "1831"
    style = "Hymn"
    meter = "8.6.8.6 (common meter)"
    source = "https://hymnary.org/tune/new_britain"

    mutopiatitle = "New Britain (figured bass)"
    %mutopiaopus = "Op.0"
    mutopiacomposer = "Traditional"
    %--A list of instruments can be found at http://www.mutopiaproject.org/browse.html#byInstrument
    %--Multiple instruments are separated by a comma
    mutopiainstrument = "Organ"
}

global = {
  \key ges \major
  \time 3/4
}

upperStaff = \relative c' {
  \partial 4 des4 |
  ges2 bes8 ges |
  bes2 aes4 |
  ges2 ees4 |
  des2 \breathe des4 | \octaveCheck des'
  ges2 bes8 ges8 |
  bes2 aes4 |
  des2 \breathe bes4 | \octaveCheck bes'
  des4.( bes8\noBeam) des bes |
  ges2 des4 |
  ees4.( ges8\noBeam) ges8 ees |
  des2 \breathe des4 | \octaveCheck des'
  ges2 bes8 ges |
  bes2 aes4 |
  ges2 \bar "|." \barNumberCheck #14
}

figs = \figuremode {
  <_>4 |
  <_>2 <_>4 |
  <6 4>2 <7 _\+>4 |
  <_>2 <_>4 |
  <_>2 <_>4 |
  <_>2 <_>4 |
  <6 4>2 <4\+>4 |
  <6>2 <_>4 |
  <_>2 <_>4 |
  \bassFigureExtendersOn
  <6>2 <6>4 |
  \bassFigureExtendersOff
  <_>4. <6>8 <_>4 |
  <_>2 <6>4 |
  \bassFigureExtendersOn
  <_>2 <6 4>4 |
  <6 4>2 <7 _\+>4 |
  \bassFigureExtendersOff
  <_>2 \barNumberCheck #14
}

lowerStaff = \relative c {
  \partial 4 ges4 |
  ges2 ges8 bes |
  des2 des4 |
  ees2 ces4 |
  ges2 \breathe ges4 |  \octaveCheck ges,
  ges2 ges8 bes |
  des2 ces4 |
  bes2 \breathe ges4 |  \octaveCheck ges,
  ges'2 ges4 |
  bes,2 bes4 |
  ces4.( bes8) ces4 |
  ges2 \breathe bes4 |  \octaveCheck bes,
  ees2 des4 |
  des2 des4 |
  ges,2 \bar "|." \barNumberCheck #14
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
