Config { 

   -- appearance
     font =         "xft:Cozette:pixelsize=10"
   , bgColor =      "#1d1f21"
   , fgColor =      "#c5c8c6"
   , position =     Top
   , textOffset =   10

   -- layout
   , sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment
   , template = "λ %StdinReader% } \
         \%date%, %KPHL%{\
         \<box type=Bottom size=1 color=#b294bb>%dynnetwork%</box>  \
         \<box type=Bottom size=1 color=#f0c674>%cpu% %coretemp%</box>  \
         \<box type=Bottom size=1 color=#8abeb7>%memory%</box>  \
         \<box type=Bottom size=1 color=#cc6666>%battery%</box> "

   -- general behavior
   , lowerOnStart =     True    -- send to bottom of window stack on start
   , hideOnStart =      False   -- start with window unmapped (hidden)
   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
   , pickBroadest =     False   -- choose widest display (multi-monitor)
   , persistent =       True    -- enable/disable hiding (True = disabled)

   -- plugins
   --   Numbers can be automatically colored according to their value. xmobar
   --   decides color based on a three-tier/two-cutoff system, controlled by
   --   command options:
   --     --Low sets the low cutoff
   --     --High sets the high cutoff
   --
   --     --low sets the color below --Low cutoff
   --     --normal sets the color between --Low and --High cutoffs
   --     --High sets the color above --High cutoff
   --
   --   The --template option controls how the plugin is displayed. Text
   --   color can be set by enclosing in <fc></fc> tags. For more details
   --   see http://projects.haskell.org/xmobar/#system-monitor-plugins.
   , commands = 

        -- weather monitor
        [ Run Weather "KPHL" [ "--template", "<fc=#4682B4><tempF></fc>°F <skyCondition>"
                             ] 36000

        , Run StdinReader

        -- network activity monitor (dynamic interface resolution)
        , Run DynNetwork     [ "--template" , "<dev>: ↑<tx>kB/s ↓<rx>kB/s"
                             , "--Low"      , "1000"       -- units: B/s
                             , "--High"     , "5000"       -- units: B/s
                             , "--low"      , "#8c9440"
                             , "--normal"   , "#de935f"
                             , "--high"     , "#a54242"
                             ] 10

        -- cpu activity monitor
        , Run Cpu            [ "--template" , "CPU <total>%"
                             , "--Low"      , "50"         -- units: %
                             , "--High"     , "85"         -- units: %
                             , "--low"      , "#8c9440"
                             , "--normal"   , "#de935f"
                             , "--high"     , "#a54242"
                             ] 10

        -- cpu core temperature monitor
        , Run CoreTemp       [ "--template" , "<core0>°C"
                             , "--Low"      , "70"        -- units: °C
                             , "--High"     , "80"        -- units: °C
                             , "--low"      , "#8c9440"
                             , "--normal"   , "#de935f"
                             , "--high"     , "#a54242"
                             ] 50
                          
        -- memory usage monitor
        , Run Memory         [ "--template" ,"MEM <usedratio>%"
                             , "--Low"      , "20"        -- units: %
                             , "--High"     , "90"        -- units: %
                             , "--low"      , "#8c9440"
                             , "--normal"   , "#de935f"
                             , "--high"     , "#a54242"
                             ] 10

        -- battery monitor
        , Run Battery        [ "--template" , "BAT <acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"     , "#a54242"
                             , "--normal"  , "#de935f"
                             , "--high"    , "#8c9440"

                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>% (<timeleft>)"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#dAA520>Charging</fc>"
                                       -- charged status
                                       , "-i"	, "<fc=#006000>Charged</fc>"
                             ] 50

        -- time and date indicator 
        --   (%F = y-m-d date, %a = day of week, %T = h:m:s time)
        , Run Date           "<fc=#ABABAB>%F (%a) %T</fc>" "date" 10

        ]
   }
