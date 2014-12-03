geotrace是根据mtr（my trace route）的报告内容结合whois来直观显示traceroute过程中经过的路由跳数、ip、平均延迟、运营商、地理位置信息等内容，在做机房选址的时候会给带来极大的帮助，报告内容一目了然。

运行系统：linux

依赖程序：mtr、whois、awk

使用方法：
1、确保依赖程序正常；
2、wget https://raw.githubusercontent.com/LaiJingli/geotrace/master/geotrace.sh 
   chmod +x geotrace.sh
   ./geotrace.sh ip/domain

