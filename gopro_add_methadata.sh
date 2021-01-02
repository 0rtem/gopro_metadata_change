 #!/bin/bash
echo "Check that dir gopro present"
if [ ! -d "./gopro" ]; then
	echo "dir does not exist"
	mkdir gopro 
	echo "dir has been created"
 else
 	echo "dir is exists..skiping"
fi

# add metadata
for name in `ls -1 *.MP4`
do
   echo $name
   ffmpeg -i $name -map_metadata -1 -codec copy -metadata:s handler="GoPro AVC encoder" -metadata:s handler_name=" GoPro AVC" ./gopro/$name-gopro.mp4
done

