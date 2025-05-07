INCLUDE C:\irvine\Irvine32.inc
INCLUDELIB C:\irvine\Irvine32.lib
INCLUDELIB kernel32.lib  ; For Beep function
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
Beep PROTO, dwFreq:DWORD, dwDuration:DWORD  ; Windows API Beep function
MessageBeep PROTO, dwType:DWORD
.data
; ==================== Game Title and ASCII Art ====================
GameBanner  byte "                                                                          ",10,13
            byte "                    __        __   ___   ____   ____                      ",10,13
            byte "                    \ \      / /  / _ \ |  _ \ |  _ \                     ",10,13
            byte "                     \ \ /\ / /  | | | || |_) || | | |                    ",10,13
            byte "                      \ V  V /   | |_| ||  _ < | |_| |                    ",10,13
            byte "                       \_/\_/     \___/ |_| \_\|____/                     ",10,13
            byte "                                                                          ",10,13
            byte "             __        __    _    ____   ____   ___   ___   ____   ",10,13
            byte "             \ \      / /   / \  |  _ \ |  _ \ |_ _| / _ \ |  _ \  ",10,13
            byte "              \ \ /\ / /   / _ \ | |_) || |_) | | | | | | || |_) | ",10,13
            byte "               \ V  V /   / ___ \|  _ < |  _ <  | | | |_| ||  _ <  ",10,13
            byte "                \_/\_/   /_/   \_\_| \_\|_| \_\|___| \___/ |_| \_\ ",10,13
            byte "                                                                   ",10,13
            byte "                         ____    _    __  __  _____                          ",10,13
            byte "                        / ___|  / \  |  \/  || ____|                         ",10,13
            byte "                       | |  _  / _ \ | |\/| ||  _|                           ",10,13
            byte "                       | |_| |/ ___ \| |  | || |___                          ",10,13
            byte "                        \____/_/   \_\_|  |_||_____|                         ",10,13
            byte "                                                                          ",10,13,0

titleArt BYTE"                         /|                                                ",10,13
         BYTE"                       /'||                                                ",10,13
         BYTE"  W O R D             |  ||                                                ",10,13
         BYTE"                      |  ||                                                ",10,13
         BYTE"     W A R R I O R    |  ||                                                ",10,13
         BYTE"                      |  ||  _.-~ / _---._ ~-\/~\                          ",10,13
         BYTE"                      |  || // /  /~/  .-  \  /~-\                         ",10,13
         BYTE"                      |  ||((( /(/_(.-(-~~~~~-)_/ |                        ",10,13
         BYTE"                      |  || ) (( |_.----~~~~~-._\ /                        ",10,13
         BYTE"                      |  ||    ) |              \_|                        ",10,13
         BYTE"                      |  ||     (| =-_   _.-=-  |~)        ,               ",10,13
         BYTE"                      |  ||      | `~~ |   ~~'  |/~-._-'/'/_,              ",10,13
         BYTE"                      |  ||       \    |        /~-.__---~ , ,             ",10,13
         BYTE"                      |  ||       |   ~-''     || `\_~~~----~              ",10,13
         BYTE"                      |  ||_.ssSS$$\ -====-   / )\_  ~~--~                 ",10,13
         BYTE"              ___.----|~~~|%$$$$$$/ \_    _.-~ /' )$s._                    ",10,13
         BYTE"     __---~-~~        |   |%%$$$$/ /  ~~~~   /'  /$$$$$$$s__               ",10,13
         BYTE"   /~       ~\    ============$$/ /        /'  /$$$$$$$$$$$SS-.            ",10,13
         BYTE" /'      ./\\\\\\_( ~---._(_))$/ /       /'  /$$$$%$$$$$~      \           ",10,13
         BYTE" (      //////////(~-(..___)/$/ /      /'  /$$%$$%$$$$'         \          ",10,13
         BYTE"  \    |||||||||||(~-(..___)$/ /  /  /'  /$$$%$$$%$$$            |         ",10,13
         BYTE"   `-__ \\\\\\\\\\\(-.(_____) /  / /'  /$$$$%$$$$$%$             |         ",10,13
         BYTE"       ~~""""""""""-\.(____) /   /'  /$$$$$%%$$$$$$\_            /         ",10,13
         BYTE"                     $|===|||  /'  /$$$$$$$%%%$$$$$( ~         ,'|         ",10,13
         BYTE"                 __  $|===|%\/'  /$$$$$$$$$$$%%%%$$|        ,''  |         ",10,13
         BYTE"                ///\ $|===|/'  /$$$$$$%$$$$$$$%%%%$(            /'         ",10,13
         BYTE"                 \///\|===|  /$$$$$$$$$%%$$$$$$%%%%$\_-._       |          ",10,13
         BYTE"                  `\//|===| /$$$$$$$$$$$%%%$$$$$$-~~~    ~      /          ",10,13
         BYTE"                    `\|-~~(~~-`$$$$$$$$$%%%///////._       ._  |           ",10,13
         BYTE"                    (__--~(     ~\\\\\\\\\\\\\\\\\\\\        \ \           ",10,13
         BYTE"                    (__--~~(       \\\\\\\\\\\\\\\\\\|        \/           ",10,13
         BYTE"                     (__--~(       ||||||||||||||||||/       _/            ",10,13
         BYTE"                      (__.--._____//////////////////__..---~~              ",10,13
         BYTE"                      |   """"'''''           ___,,,,ss$$$%                ",10,13
         BYTE"                     ,%\__      __,,,\sssSS$$$$$$$$$$$$$$%%                ",10,13
         BYTE"                   ,%%%%$$$$$$$$$$\;;;;\$$$$$$$$$$$$$$$$%%%$.              ",10,13
         BYTE"                  ,%%%%%%$$$$$$$$$$%\;;;;\$$$$$$$$$$$$%%%$$$$              ",10,13
         BYTE"                ,%%%%%%%%$$$$$$$$$%$$$\;;;;\$$$$$$$$$%%$$$$$$,             ",10,13
         BYTE"               ,%%%%%%%%%$$$$$$$$%$$$$$$\;;;;\$$$$$$%%$$$$$$$$             ",10,13
         BYTE"              ,%%%%%%%%%%%$$$$$$%$$$$$$$$$\;;;;\$$$%$$$$$$$$$$$            ",10,13
         BYTE"              %%%%%%%%%%%%$$$$$$$$$$$$$$$$$$\;;;$$$$$$$$$$$$$$$            ",10,13
         BYTE"                  ==%%%%%%%$$$$$WARRIOR$$$$$$$$$$$$$$$$$$$                 ",10,13
         BYTE"                            $$$$$$$$$$$$$$$$$$$$====""""                   ",10,13,0
         

; ==================== Menu and Prompts ====================


categoryBanner BYTE"          *                                                    *          ",10,13
               BYTE"  ^       |                                                    |       ^  ",10,13
               BYTE"  |       |                                                    |       |  ",10,13
               BYTE"  |  (*)  |                                                    |  \^/  |  ",10,13
               BYTE"  +o \ / \0                                                    0/ \ / (=) ",10,13
               BYTE"  0'\ ^ /\/                                                    \/\ ^ /`0  ",10,13
               BYTE"    /_^_\ |                                                    | /_^_\    ",10,13
               BYTE"    || || |                                                    | || ||    ",10,13
               BYTE"    d|_|b_T__________                              ____________T_d|_|b    ",10,13,10,0        
                                                                       
       
menu          BYTE "                          WORD WARRIOR GAME", 10, 13
              BYTE "               GUESS THE WARLORD SECRET WORD TO DEFEAT HIM!", 10, 13, 10, 13
              BYTE "                 CHOOSE CATEGORY OF WORD FROM BELOW:", 10, 13
              BYTE "                 1- Weapons of War", 10, 13
              BYTE "                 2- War Animals", 10, 13
              BYTE "                 3- Battlefield Locations", 10, 13, 10, 13
              BYTE "                 0- EXIT GAME ", 10,13,0

wordSelectedBanner byte"                              ____________                            ",10,13
                   byte"                            .~      ,   . ~.                          ",10,13
                   byte"                           /                \                         ",10,13
                   byte"                          /      /~\/~\   ,  \                        ",10,13
                   byte"                         |   .   \    /   '   |                       ",10,13
                   byte"                         |         \/         |                       ",10,13
                   byte"                XX       |  /~~\        /~~\  |       XX              ",10,13
                   byte"              XX  X      | |  o  \    /  o  | |      X  XX            ",10,13
                   byte"            XX     X     |  \____/    \____/  |     X     XX          ",10,13
                   byte"       XXXXX     XX      \         /\        ,/      XX     XXXXX     ",10,13
                   byte"      X        XX%;;@      \      /  \     ,/      @%%;XX        X    ",10,13
                   byte"      X       X  @%%;;@     |           '  |     @%%;;@  X       X    ",10,13
                   byte"      X      X     @%%;;@   |. ` ; ; ; ;  ,|   @%%;;@     X      X    ",10,13
                   byte"       X    X        @%%;;@                  @%%;;@        X    X     ",10,13
                   byte"        X   X          @%%;;@              @%%;;@          X   X      ",10,13
                   byte"         X  X            @%%;;@          @%%;;@            X  X       ",10,13
                   byte"          XX X             @%%;;@      @%%;;@             X XX        ",10,13
                   byte"            XXX              @%%;;@  @%%;;@              XXX          ",10,13
                   byte"                               @%%;;%%;;@                             ",10,13
                   byte"                                 @%%;;@                               ",10,13
                   byte"                               @%%;;@..@@                             ",10,13
                   byte"                                @@@  @@@                              ",10,13,0

wordSelectedMsg    BYTE "                WARLORD SECRET WORD HAS BEEN CHOSEN! ", 10, 13
                   BYTE "                PREPARE FOR BATTLE, WARRIOR...", 10, 13
                   BYTE "                GUESS THE WORD TO DEFEAT THE WARLORD!", 10, 13
                   BYTE "                               LOADING...                 ",10,13,0

enterletterPrompt  BYTE "ENTER LETTER: ", 0

dash        BYTE " _ ", 0

promptCategory     BYTE "ENTER YOUR CHOICE: ", 0

promptDifficulty   BYTE "========================================", 10, 13
                   BYTE "          CHOOSE DIFFICULTY ", 10, 13
                   BYTE "          1) EASY   - 6 LIVES", 10, 13
                   BYTE "          2) MEDIUM - 4 LIVES", 10, 13
                   BYTE "          3) HARD   - 2 LIVES", 10, 13, 10, 13
                   BYTE "ENTER YOUR CHOICE: ", 0

invalidPrompt      BYTE "INVALID! PLEASE ENTER AGAIN...", 0

exitingPrompt      BYTE "========================================", 10, 13
                   BYTE "   RETREATING FROM THE BATTLEFIELD...", 10, 13
                   BYTE "   MAY FORTUNE FAVOR YOU NEXT TIME!", 10, 13
                   BYTE "========================================", 0

correctLetter   BYTE"====================================================", 10, 13
                BYTE"      GREAT, CORRECT LETTER GUESSED!", 10, 13
                BYTE"      YOU STRIKE THE WARLORD! WARLORD HEALTH DECREASED", 10, 13
                BYTE"====================================================",10,13, 0
correctGraphiti BYTE"                                        ,--.          ",10,13
                BYTE"                                       {    }         ",10,13
                BYTE"                                       K,   }         ",10,13
                BYTE"             E N E M Y                /  `Y`          ",10,13
                BYTE"          ! B L E E D S !        _   /   /            ",10,13
                BYTE"                                {_'-K.__/             ",10,13
                BYTE"                                  `/-.__L._           ",10,13
                BYTE"                                  /  ' /`\_}          ",10,13
                BYTE"                                 /  ' /               ",10,13
                BYTE"                         ____   /  ' /                ",10,13
                BYTE"                  ,-'~~~~    ~~/  ' /_                ",10,13
                BYTE"                ,'             ``~~~%%',              ",10,13
                BYTE"               (                     %  Y             ",10,13
                BYTE"              {                      %% I             ",10,13
                BYTE"             {      -                 %  `.           ",10,13
                BYTE"             |       ',                %  )           ",10,13
                BYTE"             |        |   ,..__      __. Y            ",10,13
                BYTE"             |    .,_./  Y ' / ^Y   J   )|            ",10,13
                BYTE"             \           |' /   |   |   ||            ",10,13
                BYTE"              \          L_/    . _ (_,.'(            ",10,13
                BYTE"               \,   ,      ^^""' / |      )           ",10,13
                BYTE"                 \_  \          /,L]     /            ",10,13
                BYTE"                   '-_`-,       ` `   ./`             ",10,13
                BYTE"                      `-(_            )               ",10,13
                BYTE"                          ^^\..___,.--`               ",10,13
                BYTE"                                                      ",10,13
               BYTE " _____ _  _____  _    _       ____  _     _____        __",10,13
               BYTE "|  ___/ \|_   _|/ \  | |     | __ )| |   / _ \ \      / /",10,13
               BYTE "| |_ / _ \ | | / _ \ | |     |  _ \| |  | | | \ \ /\ / / ",10,13
               BYTE "|  _/ ___ \| |/ ___ \| |___  | |_) | |__| |_| |\ V  V /  ",10,13
               BYTE "|_|/_/   \_\_/_/   \_\_____| |____/|_____\___/  \_/\_/   ",10,13,0

wrongLetter   BYTE "        =============================================", 10, 13
              BYTE "          WRONG GUESS! THE LETTER IS NOT IN THE WORD", 10, 13
              BYTE "          WARLORD STRIKES! YOUR HEALTH DECREASED", 10, 13
              BYTE "        =============================================", 10,13,0

wrongGraphiti BYTE "                                               ,--,  ,.-.       ",10,13
              BYTE "                ,                   \,       '-,-`,'-.' | ._    ",10,13
              BYTE "               /|           \    ,   |\         }  )/  / `-,',  ",10,13
              BYTE "               [ ,          |\  /|   | |        /  \|  |/`  ,`  ",10,13
              BYTE "               | |       ,.`  `,` `, | |  _,...(   (      .',   ",10,13
              BYTE "               \  \  __ ,-` `  ,  , `/ |,'      Y     (   /_L\  ",10,13
              BYTE "                \  \_\,``,   ` , ,  /  |         )         _,/  ",10,13
              BYTE "                 \  '  `  ,_ _`_,-,<._.<        /         /     ",10,13
              BYTE "                  ', `>.,`  `  `   ,., |_      |         /      ",10,13
              BYTE "                    \/`  `,   `   ,`  | /__,.-`    _,   `\      ",10,13
              BYTE "                -,-..\  _  \  `  /  ,  / `._) _,-\`       \     ",10,13
              BYTE "                 \_,,.) /\    ` /  /0) (-,, ``    ,        |    ",10,13
              BYTE "                ,` )  | \0\       '-`  |  `(               \    ",10,13
              BYTE "               /  /```(   , --, ,' \   |`<`    ,            |   ",10,13
              BYTE "              /  /_,--`\   <\  V /> ,` )<_/)  | \      _____)   ",10,13
              BYTE "        ,-, ,`   `   (_,\ \    |   /) / __/  /   `----`         ",10,13
              BYTE "       (-, \           ) \ ('_.-._)/ /,`    /                   ",10,13
              BYTE "       | /  `          `/ \\ V   V, /`     /                    ",10,13
              BYTE "    ,--\(        ,     <_/`\\     ||      /                     ",10,13
              BYTE "   (   ,``-     \/|         \-A.A-`|     /                      ",10,13
              BYTE "  ,>,_ )_,..(    )\          -,,_-`  _--`                       ",10,13
              BYTE " (_ \|`   _,/_  /  \_            ,--`                           ",10,13
              BYTE "  \( `   <.,../`     `-.._   _,-`                               ",10,13
              BYTE"             _____ _   _ _____ __  ____   __                     ",10,13
              BYTE"            | ____| \ | | ____|  \/  \ \ / /                     ",10,13
              BYTE"            |  _| |  \| |  _| | |\/| |\ V /                      ",10,13
              BYTE"            | |___| |\  | |___| |  | | | |                       ",10,13
              BYTE"            |_____|_|_\_|_____|_| _|_|_|_|__ ____                ",10,13
              BYTE"            / ___|_   _|  _ \|_ _| |/ / ____/ ___|               ",10,13
              BYTE"            \___ \ | | | |_) || || ' /|  _| \___ \               ",10,13
              BYTE"             ___) || | |  _ < | || . \| |___ ___) |              ",10,13
              BYTE"            |____/ |_| |_| \_\___|_|\_\_____|____/               ",10,13,0

winBanner BYTE"                             .-==========                            ",10,13
          BYTE"                          .-' O    =====                             ",10,13
          BYTE"                         /___       ===                              ",10,13
          BYTE"                            \_      |                                ",10,13
          BYTE" _____________________________)    (_____________________________    ",10,13
          BYTE" \___________               .'      `,              ____________/    ",10,13
          BYTE"   \__________`.     |||<   `.      .'   >|||     .'__________/      ",10,13
          BYTE"      \_________`._  |||  <   `-..-'   >  |||  _.'_________/         ",10,13
          BYTE"         \_________`-..|_  _ <      > _  _|..-'_________/            ",10,13
          BYTE"            \_________   |_|  //  \\  |_|   _________/               ",10,13
          BYTE"                       .-\   //    \\   /-.                          ",10,13
          BYTE"       ,  .         _.'.- `._        _.' -.`._         .  ,          ",10,13
          BYTE"     <<<<>>>>     .' .'  /  '``----''`  \  `. `.     <<<<>>>>        ",10,13
          BYTE"       '/\`         /  .' .'.'/|..|\`.`. `.  \         '/\`          ",10,13
          BYTE"       (())        `  /  / .'| |||| |`. \  \  '        (())          ",10,13
          BYTE"        /\          ::_.' .' /| || |\ `. `._::          /\           ",10,13
          BYTE"       //\\           '``.' | | || | | `.''`           //\\          ",10,13
          BYTE"       //\\             .` .` | || | '. '.             //\\          ",10,13
          BYTE"       //\\                `  | `' |  '                //\\          ",10,13
          BYTE"       \\//                                            \\//          ",10,13
          BYTE"        \/                 V I C T O R Y                \/           ",10,13,0

winMsg    BYTE "                     *** GLORIOUS VICTORY! ***", 10, 13
          BYTE "           CONGRATS! YOU HAVE SUCCESSFULLY GUESSED", 10, 13 
          BYTE "           THE MYSTERIOUS WORD!", 10, 13
          BYTE "           THE WARLORD FALLS AND YOUR ARMY TRIUMPHS!", 10, 13, 0

loseBanner BYTE"             .            )        )                            ",10,13
           BYTE"                    (  (|              .                        ",10,13
           BYTE"                )   )\/ ( ( (                                   ",10,13
           BYTE"        *  (   ((  /     ))\))  (  )    )                       ",10,13
           BYTE"      (     \   )\(          |  ))( )  (|                       ",10,13
           BYTE"      >)     ))/   |          )/  \((  ) \                      ",10,13
           BYTE"      (     (      .        -.     V )/   )(    (               ",10,13
           BYTE"       \   /     .   \            .       \))   ))              ",10,13
           BYTE"         )(      (  | |   )            .    (  /                ",10,13
           BYTE"        )(    ,'))     \ /          \( `.    )                  ",10,13
           BYTE"        (\>  ,'/__      ))            __`.  /                   ",10,13
           BYTE"       ( \   | /  ___   ( \/     ___   \ | ( (                  ",10,13
           BYTE"        \.)  |/  /   \__      __/   \   \|  ))                  ",10,13
           BYTE"     .  \. |>  \   -0-   | __ |  -0-  /   <|  /                 ",10,13
           BYTE"            )/    \____/ :..: \____/     \ <                    ",10,13
           BYTE"     )   \ (|__  .      / ;: \          __| )  (                ",10,13
           BYTE"    ((    )\)  ~--_     --  --      _--~    /  ))               ",10,13
           BYTE"     \    (    |  ||               ||  |   (  /                 ",10,13
           BYTE"           \.  |  ||_             _||  |  /                     ",10,13
           BYTE"             > :  |  ~V+-I_I_I-+V~  |  : (.                     ",10,13
           BYTE"            (  \:  T\   _     _   /T  : ./                      ",10,13
           BYTE"             \  :    T^T T-+-T T^T    ;<                        ",10,13
           BYTE"              \..`_       -+-       _'  )                       ",10,13
           BYTE"    )            . `--=.._____..=--'. ./         (              ",10,13
           BYTE"   ((     ) (          )             (     ) (   )>             ",10,13
           BYTE"    > \/^/) )) (   ( /(.      ))     ))._/(__))./ (_.           ",10,13
           BYTE"   (  _../ ( \))    )   \ (  / \.  ./ ||  ..__:|  _. \          ",10,13
           BYTE"   |  \__.  ) |   (/  /: :)) |   \/   |(  <.._  )|  ) )         ",10,13
           BYTE"  ))  _./   |  )  ))  __  <  | :(     :))   .//( :  : |         ",10,13
           BYTE"  (: <     ):  --:   ^  \  )(   )\/:   /   /_/ ) :._) :         ",10,13
           BYTE"   \..)   (_..  ..  :    :  : .(   \..:..    ./__.  ./          ",10,13
           BYTE"              ^    ^      \^ ^           ^\/^     ^             ",10,13,0

titleArtt BYTE"                         /|                                                ",10,13
         BYTE"                       /'||                                                ",10,13
         BYTE"  W O R D             |  ||                                                ",10,13
         BYTE"                      |  ||                                                ",10,13
         BYTE"     W A R R I O R    |  ||                                                ",10,13
         BYTE"                      |  ||  _.-~ / _---._ ~-\/~\                          ",10,13
         BYTE"                      |  || // /  /~/  .-  \  /~-\                         ",10,13
         BYTE"                      |  ||((( /(/_(.-(-~~~~~-)_/ |                        ",10,13
         BYTE"                      |  || ) (( |_.----~~~~~-._\ /                        ",10,13
         BYTE"                      |  ||    ) |              \_|                        ",10,13
         BYTE"                      |  ||     (| =-_   _.-=-  |~)        ,               ",10,13
         BYTE"                      |  ||      | `~~ |   ~~'  |/~-._-'/'/_,              ",10,13
         BYTE"                      |  ||       \    |        /~-.__---~ , ,             ",10,13
         BYTE"                      |  ||       |   ~-''     || `\_~~~----~              ",10,13
         BYTE"                      |  ||_.ssSS$$\ -====-   / )\_  ~~--~                 ",10,13
         BYTE"              ___.----|~~~|%$$$$$$/ \_    _.-~ /' )$s._                    ",10,13
         BYTE"     __---~-~~        |   |%%$$$$/ /  ~~~~   /'  /$$$$$$$s__               ",10,13
         BYTE"   /~       ~\    ============$$/ /        /'  /$$$$$$$$$$$SS-.            ",10,13
         BYTE" /'      ./\\\\\\_( ~---._(_))$/ /       /'  /$$$$%$$$$$~      \           ",10,13
         BYTE" (      //////////(~-(..___)/$/ /      /'  /$$%$$%$$$$'         \          ",10,13
         BYTE"  \    |||||||||||(~-(..___)$/ /  /  /'  /$$$%$$$%$$$            |         ",10,13
         BYTE"   `-__ \\\\\\\\\\\(-.(_____) /  / /'  /$$$$%$$$$$%$             |         ",10,13
         BYTE"       ~~""""""""""-\.(____) /   /'  /$$$$$%%$$$$$$\_            /         ",10,13
         BYTE"                     $|===|||  /'  /$$$$$$$%%%$$$$$( ~         ,'|         ",10,13
         BYTE"                 __  $|===|%\/'  /$$$$$$$$$$$%%%%$$|        ,''  |         ",10,13
         BYTE"                ///\ $|===|/'  /$$$$$$%$$$$$$$%%%%$(            /'         ",10,13
         BYTE"                 \///\|===|  /$$$$$$$$$%%$$$$$$%%%%$\_-._       |          ",10,13
         BYTE"                  `\//|===| /$$$$$$$$$$$%%%$$$$$$-~~~    ~      /          ",10,13
         BYTE"                    `\|-~~(~~-`$$$$$$$$$%%%///////._       ._  |           ",10,13
         BYTE"                    (__--~(     ~\\\\\\\\\\\\\\\\\\\\        \ \           ",10,13
         BYTE"                    (__--~~(       \\\\\\\\\\\\\\\\\\|        \/           ",10,13
         BYTE"                     (__--~(       ||||||||||||||||||/       _/            ",10,13
         BYTE"                      (__.--._____//////////////////__..---~~              ",10,13
         BYTE"                      |   """"'''''           ___,,,,ss$$$%                ",10,13
         BYTE"                     ,%\__      __,,,\sssSS$$$$$$$$$$$$$$%%                ",10,13
         BYTE"                   ,%%%%$$$$$$$$$$\;;;;\$$$$$$$$$$$$$$$$%%%$.              ",10,13
         BYTE"                  ,%%%%%%$$$$$$$$$$%\;;;;\$$$$$$$$$$$$%%%$$$$              ",10,13
         BYTE"                ,%%%%%%%%$$$$$$$$$%$$$\;;;;\$$$$$$$$$%%$$$$$$,             ",10,13
         BYTE"               ,%%%%%%%%%$$$$$$$$%$$$$$$\;;;;\$$$$$$%%$$$$$$$$             ",10,13
         BYTE"              ,%%%%%%%%%%%$$$$$$%$$$$$$$$$\;;;;\$$$%$$$$$$$$$$$            ",10,13
         BYTE"              %%%%%%%%%%%%$$$$$$$$$$$$$$$$$$\;;;$$$$$$$$$$$$$$$            ",10,13
         BYTE"                  ==%%%%%%%$$$$$WARRIOR$$$$$$$$$$$$$$$$$$$                 ",10,13
         BYTE"                            $$$$$$$$$$$$$$$$$$$$====""""                   ",10,13,0

loseMsg            BYTE "        *** CRUSHING DEFEAT! ***", 10, 13
                   BYTE "  YOU FAILED TO GUESS THE MYSTERIOUS WORD!", 10, 13
                   BYTE "  THE WARLORD REMAINS UNDEFEATED.", 10, 13
                   BYTE "  YOUR ARMY IS CRUSHED IN BATTLE.", 10, 13
                   BYTE "  THE BATTLE IS LOST, BUT THE WAR CONTINUES...", 10, 13, 0

statusMsg         BYTE "========================================", 10, 13
                   BYTE "  WARRIOR HEALTH: ", 0
                  
warlordMsg        BYTE "  WARLORD HEALTH: ", 0

wordWasMsg        BYTE "  THE SECRET WORD WAS: ", 0

guessedLettersMsg BYTE "  LETTERS GUESSED: ", 0

continueMsg BYTE"   PRESS 0 to EXIT  ",10,13
            byte"   PRESS 1 to PLAY AGAIN",10,13,0

; ==================== Game Variables ====================
warrior_health    DWORD 6    ; depends on difficulty level 
warlord_health    DWORD 5    ; depends on size of chosen word
selectedWord      DWORD ?    ; Store address of chosen word
enteredLetters    BYTE 5 DUP(1) ; already guessed positions
guessedLetters    BYTE 26 DUP(0) ; alphabet tracking
letterCount       DWORD 0    ; count of guessed letters

; ==================== Word Categories ====================


; Category 1: Weapons of War 
weapons     BYTE "SWORD", 0
            BYTE "BOMBS", 0
            BYTE "ARROW", 0
            BYTE "LANCE", 0
            BYTE "SPEAR", 0
weaponsCount DWORD 5  ; Number of words



; Category 2: War Animals 
animals     BYTE "HORSE", 0
            BYTE "TIGER", 0
            BYTE "EAGLE", 0
            BYTE "SNAKE", 0
            BYTE "BEARS", 0
            BYTE "BULLS", 0
            BYTE "HYENA", 0
            BYTE "LIONS", 0
            BYTE "COBRA", 0
            BYTE "RAVEN", 0
            BYTE "RHINO", 0
            BYTE "CAMEL", 0
            BYTE "ZEBRA", 0
            BYTE "OTTER", 0
            BYTE "MOOSE", 0
animalsCount DWORD 15



; Category 3: Battlefield Locations 
locations   BYTE "RIVER", 0
            BYTE "HILLS", 0
            BYTE "FIELD", 0
            BYTE "TOWER", 0
            BYTE "FORTS", 0
            BYTE "WOODS", 0
            BYTE "ROADS", 0
            BYTE "CLIFF", 0
            BYTE "CAVES", 0
            BYTE "MINES", 0
            BYTE "PLAZA", 0
            BYTE "TENTS", 0
            BYTE "RUINS", 0
            BYTE "BEACH", 0
            BYTE "CROSS", 0
locationsCount DWORD 15


.code

; ==================== Word Selection Procedure ====================
wordSelect PROC, _choice:DWORD
    ; Initialize random seed (only needed once, could move to main)
    call Randomize

    ; Check choice and jump to appropriate category
    cmp _choice, 1
    je select_weapons
    cmp _choice, 2
    je select_animals
    cmp _choice, 3
    je select_locations
    ret  ; Invalid case (shouldn't happen due to main's validation)

select_weapons:
    mov ecx, weaponsCount  ; ECX = 5
    call Random32          ; EAX = random number
    xor edx, edx
    div ecx                ; EDX = random index (0-4)
    mov eax, edx           ; EAX = index
    mov ebx, 6             ; Each word = 5 letters + 1 null
    mul ebx                ; EAX = index * 6 (offset)
    add eax, OFFSET weapons ; EAX = address of random word
    jmp done

select_animals:
    mov ecx, animalsCount  ; ECX = 5
    call Random32
    xor edx, edx
    div ecx                ; EDX = random index (0-4)
    mov eax, edx
    mov ebx, 6
    mul ebx                ; EAX = index * 6
    add eax, OFFSET animals ; EAX = address of random word
    jmp done

select_locations:
    mov ecx, locationsCount ; ECX = 5
    call Random32
    xor edx, edx
    div ecx                ; EDX = random index (0-4)
    mov eax, edx
    mov ebx, 6
    mul ebx                ; EAX = index * 6
    add eax, OFFSET locations ; EAX = address of random word

done:
    ; EAX holds the address of the selected word
    ret
wordSelect ENDP

; ==================== Display Word Procedure ====================
showWORD PROC
    mov ecx, 5
    mov esi, offset enteredLetters
    
    L2:
        mov al , " "            ;space
        call WriteChar 

        mov al, [esi]
        cmp al, 1
        je notEntered
        call WriteChar
        jmp next
        
    notEntered:
        mov edx, offset dash
        call WriteString
    
    next:
        inc esi
    loop L2
    
    call Crlf
    ret
showWord ENDP

; ==================== Check Letter Procedure ====================
checkLetter PROC, _letter:BYTE
    LOCAL found:BYTE
    
    mov found, 0
    
    ; First record this letter as guessed
    mov al, _letter
    sub al, 'A'            ; Convert to 0-25 index
    movzx ebx, al
    mov guessedLetters[ebx], 1
    
    ; Then check if it's in the word
    mov esi, selectedWord
    mov edi, offset enteredLetters
    mov ecx, 5
    
    L1:
        mov al, [esi]
        cmp al, _letter
        jne wrong
        mov [edi], al
        mov found, 1       ; Flag for the correct guess
        sub warlord_health, 1
        
    wrong:
        inc esi
        inc edi
    loop L1
    
    ; Set return flag
    movzx ebx, found
    
    ret
checkLetter ENDP

; ==================== Check Game State Procedure ====================
checkState PROC
    cmp warlord_health, 0
    je win
    cmp warrior_health, 0
    je lost
    jmp next               ; Else part
    
    win:
        mov ebx, 1
        jmp next

    lost:
        mov ebx, 2
        jmp next
        
    next:
        ret
checkState ENDP

; ==================== Set Difficulty Procedure ====================
setDifficulty PROC, choice_:DWORD
    cmp choice_, 1
    je easy
    cmp choice_, 2
    je med
    cmp choice_, 3
    je hard
    
    easy:
        mov warrior_health, 6
        jmp next
        
    med:
        mov warrior_health, 4
        jmp next
        
    hard:
        mov warrior_health, 2
        jmp next
        
    next:
        ret
setDifficulty ENDP

; ==================== Display Game Status Procedure ====================
displayStatus PROC
    LOCAL i:DWORD
    
    call Clrscr
    
    ; Set color to white
    mov eax, 15  ; White on black
    call SetTextColor
    
    ; Display warrior and warlord health
    mov edx, OFFSET statusMsg
    call WriteString
    
    mov eax, warrior_health
    call WriteDec
    call Crlf
    
    mov edx, OFFSET warlordMsg
    call WriteString
    
    mov eax, warlord_health
    call WriteDec
    call Crlf
    
    ; Display guessed letters
    mov edx, OFFSET guessedLettersMsg
    call WriteString
    
    mov i, 0
    
show_letters:
    cmp i, 26
    jae show_word
    
    mov ebx, i
    cmp guessedLetters[ebx], 1
    jne skip_letter
    
    ; Display the letter
    mov al, BYTE PTR i
    add al, 'A'
    call WriteChar
    mov al, ' '
    call WriteChar
    
skip_letter:
    inc i
    jmp show_letters
    
show_word:
    call Crlf
    call Crlf
    
    ; Display word with guessed letters
    INVOKE showWORD
    
    call Crlf
    call Crlf
    
    ; Reset color
    mov eax, 7  ; Light gray on black
    call SetTextColor
    
    ret
displayStatus ENDP

resetGame PROC 
    mov ecx,5
    mov esi, offset enteredLetters              ; reset enteredLetters array
    mov edi, 1
    l3:
        mov [esi], edi
        add esi,1
    loop l3


    mov ecx ,26
    mov esi, offset guessedLetters
    mov edi,0
    l4:
        mov [esi],edi
        add esi, 1
    loop l4

    ret
resetGame ENDP
; ==================== Main Procedure ====================
main PROC
    LOCAL choice:DWORD 
    mov eax, 4         ; 4*16 + 1 blue on red 
    call SetTextColor
    mov edx, OFFSET titleArt
    call WriteString
    

    INVOKE Beep, 1700, 100
    INVOKE Beep, 2000, 100
    INVOKE Beep, 2300, 150

    INVOKE Beep, 2300, 150
    INVOKE Beep, 2000, 100
    INVOKE Beep, 1700, 100
  ;  INVOKE Beep, 1500, 100

    mov eax ,6000
    call Delay
    ; Set color to yellow for title
    mov eax, 14  ; Yellow on black
    call SetTextColor
    
    ; Display title art

    call Clrscr
;...
    mov edx, OFFSET GameBanner
    call WriteString
    call Crlf
    call Crlf
    
    ; Reset color
    mov eax, 7  ; Light gray on black
    call SetTextColor

    ; Set color to cyan for menu
    mov eax, 11  ; Cyan on black
    call SetTextColor
    
    ; Display category banner and menu
    mov edx, OFFSET categoryBanner
    call WriteString
    mov edx, OFFSET menu
    call WriteString
    call Crlf
    
    ; Reset color
    mov eax, 7
    call SetTextColor
    
    ; Get category choice
    mov edx, OFFSET promptCategory
    call WriteString
            INVOKE Beep, 1000, 150 ; character enter
    call ReadInt
    
    cmp eax, 0
    je exit_menu
    cmp eax, 3
    ja invalid_choice
    
    mov choice, eax
    invoke wordSelect, choice
    mov selectedWord, eax  ; Save word address

    ; Get difficulty level
diffi:
    call Clrscr
    mov edx, offset promptDifficulty
    call WriteString
            INVOKE Beep, 1000, 150 ; character enter
    call ReadInt
    
    cmp eax, 3
    ja diffi              ; Invalid choice of difficulty
    INVOKE setDifficulty, eax
    
    ; Initialize warlord health based on word length
    mov warlord_health, 5  ; All words are 5 letters long
    
    ; Set color to red for game start
    mov eax, 12  ; Red on black
    call SetTextColor
    
    ; Display game start message
    call Clrscr
    mov edx, offset wordSelectedBanner
    call WriteString

    mov edx, offset wordSelectedMsg
    call WriteString
    call Crlf
    call Crlf
    
    ; Reset color
    mov eax, 7
    call SetTextColor
    mov eax, 6000         ; 2 seconds delay
    call Delay
    ; Main game loop
gameloop:
    ; Display game status
    INVOKE displayStatus
    
    ; Get letter guess
    mov edx, offset enterletterPrompt
    call WriteString
    call ReadChar 
    call WriteChar
    call Crlf
    
    ; Convert to uppercase if needed
    cmp al, 'a'
    jb check_letter
    cmp al, 'z'
    ja check_letter
    sub al, 32            ; Convert to uppercase
    
check_letter:
    ; Check if letter is in word
    mov ebx, 0            ; Flag for checkLetter
    INVOKE checkLetter, al
    
    ; Process result
    cmp ebx, 0
    je wrongGuess
        
         INVOKE Beep, 1000, 400 ; correct sound
    ; Set color to green for correct guess
    mov eax, 10  ; Green on black
    call SetTextColor
    mov edx, offset correctLetter
    call WriteString
    mov edx, offset correctGraphiti
    call WriteString
    ; Reset color
    mov eax, 7
    call SetTextColor
    jmp check_game_state
    
wrongGuess:
            INVOKE Beep, 400, 600 ; wrong option sound
    ; Set color to red for wrong guess
    mov eax, 12  ; Red on black
    call SetTextColor
    mov edx, offset wrongLetter
    call WriteString
    mov edx, offset wrongGraphiti
    call WriteString
    ; Reset color
    mov eax, 7
    call SetTextColor
    sub warrior_health, 1  ; Wrong guess decreases warrior health
    
check_game_state:
    ; Check if game is over
    mov ebx, 0            ; Flag for gameloop checkState
    INVOKE checkState
    
    cmp ebx, 1            ; Win
    je Win
    cmp ebx, 2            ; Lost
    je Loose
    
    ; Wait for a moment before clearing screen
    mov eax, 3000         ; 2 seconds delay
    call Delay
    
    jmp gameloop
    
Win:
    mov eax, 3000         ; 2 seconds delay
    call Delay
    ; Set color to green for win
    mov eax, 10  ; Green on black
    call SetTextColor
    call Clrscr
    mov edx, offset winBanner
    call WriteString
    mov edx, offset winMsg
    call WriteString
    ; Reset color
    mov eax, 7
    call SetTextColor
    jmp show_word_result
    
Loose:
    mov eax, 3000         ; 2 seconds delay
    call Delay
    ; Set color to dark red for lose
    mov eax, 4  ; Dark red on black
    call SetTextColor
    call Clrscr
    mov edx, offset loseBanner
    call WriteString
    mov edx, offset loseMsg
    call WriteString
    ; Reset color
    mov eax, 7
    call SetTextColor
    
show_word_result:
    call Crlf
    mov edx, offset wordWasMsg
    call WriteString
    mov edx, selectedWord
    call WriteString
    call Crlf
    call Crlf
    
    ; Wait before exiting
    mov eax, 5000         ; 5 seconds delay
    call Delay

    mov edx, offset continueMsg         ; play again condition
    call WriteString
            INVOKE Beep, 1000, 150 ; character enter
    call ReadInt
    call WriteInt
    cmp eax, 0
    je exit_menu
    invoke resetGame
    jmp main

    
invalid_choice:
                INVOKE Beep, 400, 200 ; invalid option
                INVOKE Beep, 400, 400
    mov edx, OFFSET invalidPrompt
    call WriteString
    call Crlf
    
    mov eax, 2000         ; 2 seconds delay
    call Delay
    jmp main
    
exit_menu:
    call Clrscr
    mov edx, OFFSET exitingPrompt
    call WriteString
    call Crlf
    INVOKE Beep, 1000, 200
    INVOKE Beep, 800, 300
    INVOKE Beep, 600, 400
    INVOKE Beep, 400, 600
    
    
    invoke ExitProcess, 0
main ENDP
END main