#!/bin/bash

mkdir output

make -C $(pwd) O=output VARIANT_DEFCONFIG=msm8226-sec_s3ve3g_eur_defconfig msm8226-sec_defconfig
make -C $(pwd) O=output

tools/dtbTool -s 2048 -o output/arch/arm/boot/dt.img -p output/scripts/dtc/ output/arch/arm/boot/

cp -v output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage

mkdir out_modules
find ./ -name "*.ko" -exec cp -fv {} out_modules \;
