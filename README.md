# SplitVideoForWhatsappStatus
Whatsapp status has a limitation for video inputs (Only 30 Seconds of a video can be uploaded). 
This small powershell snippet inputs one video file and splits into multiple 30 seconds video.


## Prerequisites
1. Media Info CLI -> Can be downloaded from https://mediaarea.net/en/MediaInfo/Download/Windows [Add path to environment variables]
2. ffmpeg -> Can be downloaded from https://ffmpeg.zeranoe.com/builds/ [Add path to environment variables] 

On your powershell, try
```
.\SplitVideoForWhatsappStatus.ps1 'InputVideoFile.mp4'
```

and, this also works
```
.\SplitVideoForWhatsappStatus.ps1 '.\InputVideoFile.mp4'
```

Here's how it works

```
Input File Name: InputVideoFile.mp4
Input File Duration: 51 Seconds

Output File Name 1: InputVideoFile_1.mp4
Output File Duration 1: 30 Seconds

Output File Name 2: InputVideoFile_1.mp4
Output File Duration 2: 21 Seconds
```
