

################
####### HELP
function usage {
    echo "./$(basename $0) -h --> shows usage"
    echo " [-m metric]
Metrics:
 1  TS
 2  BOND
 3  ANGLE
 4  DIHED
 5  IMPRP
 6  ELECT
 7  VDW
 8  BOUNDARY
 9  MISC
 10 KINETIC
 11 TOTAL
 12 TEMP
 13 POTENTIAL
 14 TOTAL3
 15 TEMPAVG
 16 PRESSURE
 17 GPRESSURE
 18 VOLUME
 19 PRESSAVG
 20 GPRESSAVG
By default take Temperature (12)
    "

}


################
####### OPTIONS
metric=12

while getopts hm: option
do
    case "${option}"
        in
        h)
            echo "showing usage!"
            usage
            exit 1
            ;;
        m) metric=${OPTARG}
            ;;
        ?)
            echo "Invalid option: -${OPTARG}."
            usage
            exit 2
            ;;
    esac
done

metric=$((metric+1))


################
####### MAIN

#cat launch/md.out | egrep "^ENERGY" | awk -v col=$metric '{print $col}' | head
cat launch/md.out | egrep "^ENERGY" | awk -v N=$metric '{ sum += $N } END { if (NR > 0) print sum / NR }'

