terminal()
{
zenity --info --ttle="CPU  USAGE" --text="CLick on process to continue" --ok-label="Proces"
sudo df | awk '{print $2 " " $3 }' >result.txt 

output=graph1.plt 
data=result.txt 

gnuplot --persist -e "datafiles='${date}'; outputname='${output}'" graph1.plt 
}