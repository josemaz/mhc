NAMD=/opt/apps/namd3/namd3

## DROP
# rm -rf !(runme.sh|MD.conf|files|ns_per_day.py)

## PREPARE
[[ ! -d launch ]] && mkdir launch
cd launch
ln -s ../MD.conf MD.conf

## RUNME
# $NAMD +p $(nproc) +setcpuaffinity  MD.conf
$NAMD +p $(nproc) +setcpuaffinity  MD.conf &> md.out
# $NAMD +p 52 +setcpuaffinity +devices 0 MD.conf &> md.out
# $NAMD +p 52 +setcpuaffinity --CUDASOAintegrate on +devices 0 MD.conf &> md.  out

## EXTRAS
# watch python3 ns_per_day.py launch/md.out
