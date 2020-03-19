
#SingleInstance, force
JoinMeeting(A_Args[1])
;JoinMeeting("829-570-730")
recordMeeting()
Return

JoinMeeting(meetingID){
    if WinExist("Zoom"){
        WinActivate, Zoom
    }Else{
        Run, zoom.exe, C:\Users\zeusa\AppData\Roaming\Zoom\bin
        WinWait, Zoom
    }

    
    Sleep, 1000

    clickButton("Zoom_joinInit.png")
    
    WinGet, id, ID, A 

    WinWaitNotActive, ahk_id %id%
    
    Send, % meetingID
    Sleep, 1000
    clickButton("Zoom_Join.bmp")

    WinWait, Join Audio
    Sleep, 1000

    clickButton("Zoom_JoinWithAudio.png")

    WinWait, Zoom Meeting

}

clickButton(img){
    CoordMode, Pixel, Screen
    CoordMode, Mouse, Screen
    ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *50 %img%
    if (ErrorLevel > 0){
        MsgBox, %ErrorLevel%
        Exit
    }
    Click, %OutputVarX%, %OutputVarY%
    Return
}

recordMeeting(){
    DetectHiddenWindows, On
    WinActivate, Zoom Meeting
    Run, ShareX.exe -ScreenRecorderActiveWindow, C:\Program Files\ShareX
    WinWaitClose, Zoom Meeting
    run, ShareX.exe -ScreenRecorder, C:\Program Files\ShareX 
}