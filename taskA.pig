log = LOAD './hadoop/sample_log' USING org.apache.pig.piggybank.storage.apachelog.CombinedLogLoader() AS(Ip:chararray,LogName:chararray,UserId:chararray,time:chararray,method:chararray,urlrequest:chararray,protocal:chararray,status:int,bytes:int,webpage:chararray,Agent:chararray);

group_data = GROUP log BY webpage;

Count_group_data = FOREACH group_data GENERATE group, COUNT(log.webpage);

result =  LIMIT Count_group_data 1;

dump result;
