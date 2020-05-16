# matlab-for-PX4-log-analysis
This is a matlab analysis procedure  for PX4 log.

How to convert .ulg to .csv?

step1：
pip install pyulog

step2：
python setup.py build install

step3(convert .ulg to .csv)：
ulog2csv xxx.ulg
