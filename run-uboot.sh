ddr=usbbl2runpara_ddrinit.bin
fip=usbbl2runpara_runfipimg.bin
bl2=u-boot.bin.usb.bl2
tpl=u-boot.bin.usb.tpl
ddr_load=0xd9000000
bl2_params=0xd900c000
ddr_run=0xd9000000
uboot_load=0x200c000
uboot_run=0xd9000000

./update cwr $bl2 $ddr_load
./update write $ddr $bl2_params
./update run $ddr_run

sleep 8

proto=`./update identify 7 | awk -F- '{print $4}'`
echo proto $proto
if [ "$proto" = "8" ] ; then
	./update run $bl2_params
fi

./update write "$bl2" $ddr_load
./update write "$fip" $bl2_params # tell bl2 to jump to tpl, aka u-boot
./update write "$tpl" $uboot_load

if [ "$proto" = "8" ] ; then
	./update run $bl2_params
else
	./update run $uboot_run
fi

