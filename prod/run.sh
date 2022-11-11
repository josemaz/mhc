NAMD=/opt/apps/namd3/namd3

$NAMD +p 52 +setcpuaffinity MD.conf &> md.out
