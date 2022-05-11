BEGIN{
byte_rev=0;
throughput=0;
}
{
pkt_size=$6;
if($2>1 && $2<5)
{
if($1=="r" && $5=="cbr")
{
byte_rev=byte_rev+pkt_size;
}
}
}
END{
throughput=byte_rev/(4*60);
printf("Throughput is %f kbps",throughput/1024);
}

