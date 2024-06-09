#NoEnv
#SingleInstance force

Gui, Base_Randomizer: New, +AlwaysOnTop
Gui, Margin, 20, 20
Gui, Font, s12
Gui, Add, Text, w200 Center +0x200, 🎲 Base Randomizer 🎲
Gui, Add, GroupBox, x10 y50 w280 h330 vMenuGroup, Presets
Gui, Add, Button, x20 y70 w240 h40 gRandomPreset, 🎲 Random
Gui, Add, Button, x20 y120 w240 h40 gShadow, 🌑 Shadow
Gui, Add, Button, x20 y170 w240 h40 gSolo, 🕴️ Solo
Gui, Add, Button, x20 y220 w240 h40 gIsland, 🏝️ Island
Gui, Add, Button, x20 y270 w240 h40 gAnywhere, 🗺️ Anywhere
Gui, Add, Text, x10 y380 w100 h20, Door Count:
Gui, Add, Edit, x110 y380 w50 h20 vDoorCount Limit1-6, 6
Gui, Add, Text, x10 y420 w100 h20, Turn Count:
Gui, Add, Edit, x110 y420 w50 h20 vTurnCount Limit1-10, 10
Gui, Add, Text, x10 y460 w100 h20, Prop Count:
Gui, Add, Edit, x110 y460 w50 h20 vPropCount Limit5-160 ReadOnly, 5
Gui, Add, Button, x10 y520 w260 h40 gGenerate, 🔄 Generate
Gui, Add, Text, x10 y570 w260 h100 vOutput
Gui, Add, Button, x240 y640 w80 h30 gShowCredits, Credits
Gui, Show, w320 h690, Base Randomizer
return

RandomPreset:
    Random, randPreset, 1, 4
    if (randPreset = 1)
        GoSub, Shadow
    else if (randPreset = 2)
        GoSub, Solo
    else if (randPreset = 3)
        GoSub, Island
    else if (randPreset = 4)
        GoSub, Anywhere
return

Shadow:
    lastPreset := "Shadow"
    GuiControl,, Output, % "You selected Shadow preset."
return

Solo:
    lastPreset := "Solo"
    GuiControl,, Output, % "You selected Solo preset."
return

Island:
    lastPreset := "Island"
    GuiControl,, Output, % "You selected Island preset."
return

Anywhere:
    lastPreset := "Anywhere"
    GuiControl,, Output, % "You selected Anywhere preset."
return

Generate:
    GuiControlGet, doorCount, , DoorCount
    GuiControlGet, turnCount, , TurnCount
    GuiControlGet, propCount, , PropCount

    ; Randomize door count, turn count, and prop count
    Random, doorCount, 1, 6
    Random, turnCount, 1, 10
    Random, propCount, 5, 160

    ; If lastPreset is not set (i.e., "Random" was selected), choose a random preset
    if !lastPreset {
        GoSub, RandomPreset
    }

    ; Get the selected preset
    if (lastPreset = "Shadow")
        presetMessage := "Shadow"
    else if (lastPreset = "Solo")
        presetMessage := "Solo"
    else if (lastPreset = "Island")
        presetMessage := "Island"
    else if (lastPreset = "Anywhere")
        presetMessage := "Anywhere"

    ; Display the selected preset along with door count, turn count, and prop count
    GuiControl,, Output, % "🎯 Selected Preset: " presetMessage "`n🚪 Door Count: " doorCount "`n🔄 Turn Count: " turnCount "`n🛋️ Prop Count: " propCount
return

GuiClose:
    ExitApp

ShowCredits:
    MsgBox, Drop10k helped in developing the script.`nCole provided assistance in script modifications.
return
