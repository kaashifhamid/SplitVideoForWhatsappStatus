#Inputs a fileName as command line argument
#Splits video into 30 seconds.

#Prerequisites
#1. Media Info CLI -> Can be downloaded from https://mediaarea.net/en/MediaInfo/Download/Windows [Add path to environment variables]
#2. ffmpeg -> Can be downloaded from https://ffmpeg.zeranoe.com/builds/ [Add path to environment variables] 

#Tested on windows 10 / Power Shell Major 5 ; Minor 0 ; Build 10586 ; Revision 494

#Checks if there is a period in file name (to check for extenstion)
if($args[0] -Like "*.*")
{
	#removes first two characters if it contains .\ Usually when we use tab to auto fill the file name .\ gets appended in the beginning 
	if ($args[0] -match '[\.]')
	{
		$lengthOfFileName = $args[0].length
		$args[0] = $args[0].substring(2,$lengthOfFileName - 2)
	}
	#Splits file name from extension
	$fileName,$fileExtension = $args[0].split('.')
	#Checks if extension is mp4
	if ($fileExtension -Contains "mp4")
	{
		#Using MediaInfo CLI, calculates video duration (milliSeconds)
		$durationInMilliSec = mediainfo --Inform="General;%Duration%" $args[0]
		#Converts Milli Seconds to Seconds which is in Float
		$durationInSecFloat = $durationInMilliSec/1000
		#Float to Integer Conversion
		$durationInSec = [int]$durationInSecFloat
		#Counter to append in the output file name
		$j=1
			#Iterates for every 30 seconds
			For ($i=0; $i -lt $durationInSec; $i=$i+30) 
			{
				#To provide clear output
				$a = -join ($fileName, "_", $j, ".mp4")
				#Uses ffmpeg to split the file ; $i is the starting second "-t 30" considers 30 seconds from the starting second.
				ffmpeg -i $args[0] -ss $i -t 30 $a
				#Increases output file name counter
				$j++
			}
	}
	else
	{ write-output "Incorrect File Extension! or File Extension Missing" }
}
else
	{ write-output ".mp4 File Extension not mentioned" }