--CVM QUERY
select * from campaigns.campaign_master;

select * from campaigns.api_out where campaign_id like 'NRT_Bundle_Recharge%' and date(load_date) = '2024-04-22' and extract(hour from load_date)='18'  order by load_date desc limit 2;

--ibm_at.at.provision & RESPONCE
select count(*),PROV_STATUS from ibm_at.at_provision where date(lastupdatedatetime) =current_date -0 day group by prov_status;

select count(*),PROV_STATUS from ibm_at.at_provision_response where date(created_on) =current_date -0 day group by prov_status;

Select count(*),sms_status from ibm_at.at_sms_notification where date(last_change)=current_date -0 day group by sms_status;

select count(*),sms_status from ibm_at.at_sms_notification where date(last_change)=current_date-0 day and sms_text is not null and cc_msisdn is not null group by sms_status with ur;

update ibm_at.at_sms_notification set sms_status= 100 where date(last_change)=current_date -0 and sms_status= 1

update ibm_at.at_provision set PROV_STATUS=100 where PROV_STATUS= 2 and date(lastupdatedatetime)=current_date -0 day;

--update (select * from ibm_at.at_provision where date(lastupdatedatetime)=current_date-0 day and prov_status='100' fetch first 100000 rows only) set prov_status ='1' ;

--update (select * from ibm_at.at_sms_notification where date(last_change)=current_date-0 day and sms_status='3' fetch first 4800 rows only) set sms_status ='1' ;

select count(*), DELIVERY_STATUS from ibm_camp_st.delivery_response where date(sent_time) =Current_date -0 day group by delivery_status with ur;

select * from ibm_at.at_sms_notification;

select * from IBM_CAMP_ST.DELIVERY_RESPONSE;;

select * from IBM_AT.AT_SMS_NOTIFICATION where CAMPAIGN_CODE= 'TD000000098' and CREATEDATETIME>= '2023-08-01' and CREATEDATETIME<= '2023-08-31';
select * from IBM_AT.AT_SMS_NOTIFICATION  where CAMPAIGN_CODE= 'UG000011927' and date(last_change)=current_date -0 day;


--p2db
select count(1),currentstatus_order_status_ID_OID from provisioning.order where orderdate=current_date -0 day group by currentstatus_order_status_id_OID with ur;

--CODB
select count(*),ENDPOINT_STATUS from campaign_orc.enpoint_communication_status where date(created_on_dt) =current_date -0 day group by endpoint_status;
--db2 -vm "select count(*),ENDPOINT_STATUS from campaign_orc.enpoint_communication_status where date(created_on_dt) =current_date -0 day group by endpoint_status"
select * from campaign_orc.enpoint_communication_status;

--CMDM
select * from EDM_BI_MOBILITY.SUBS_REPORT_Daily;
select * from EDM_BI_MOBILITY.SUBS_REPORT_Daily where report_date ='2023-08-23';
select max(REPORT_DATE) as last_update from EDM_BI_MOBILITY.SUBS_REPORT_Daily;
SELECT DATE(REPORT_DATE) AS date, COUNT(*) AS count FROM EDM_BI_MOBILITY.SUBS_REPORT_Daily WHERE REPORT_DATE >= '2023-09-01' AND REPORT_DATE < '2023-10-18'
GROUP BY DATE(REPORT_DATE) ORDER BY DATE(REPORT_DATE);

select * from EDM_BI_MOBILITY.CALL_HISTORY_SEGMENT;
select * from EDM_BI_MOBILITY.CALL_HISTORY_SEGMENT where MEASUREMENT_PERIOD_ID ='2023-08-25';
select max(MEASUREMENT_PERIOD_ID) as last_update from EDM_BI_MOBILITY.CALL_HISTORY_SEGMENT;
SELECT DATE(MEASUREMENT_PERIOD_ID) AS date, COUNT(*) AS count FROM EDM_BI_MOBILITY.CALL_HISTORY_SEGMENT WHERE MEASUREMENT_PERIOD_ID >= '2023-09-01' AND MEASUREMENT_PERIOD_ID < '2023-10-18'
GROUP BY DATE(MEASUREMENT_PERIOD_ID) ORDER BY DATE(MEASUREMENT_PERIOD_ID);

--IMET History
select * from EDM_BI_MOBILITY.IMEI_HISTORY where IMEI_START_DATE ='2023-08-23';
select count(*) as count, IMEI_START_DATE  from EDM_BI_MOBILITY.IMEI_HISTORY group by IMEI_START_DATE order by IMEI_START_DATE DESC;
select max(IMEI_START_DATE) as last_update from EDM_BI_MOBILITY.IMEI_HISTORY;
SELECT DATE(IMEI_START_DATE) AS date, COUNT(*) AS count FROM EDM_BI_MOBILITY.IMEI_HISTORY WHERE IMEI_START_DATE >= '2023-09-01' AND IMEI_START_DATE < '2023-10-18'
GROUP BY DATE(IMEI_START_DATE) ORDER BY DATE(IMEI_START_DATE);

select * from EDM_BI_MOBILITY.CALL_HISTORY_SEGMENT_VAS;
select * from EDM_BI_MOBILITY.CALL_HISTORY_SEGMENT_VAS where MEASUREMENT_PERIOD_ID ='2023-08-23';
select max(MEASUREMENT_PERIOD_ID) as last_update from EDM_BI_MOBILITY.CALL_HISTORY_SEGMENT_VAS;
SELECT DATE(MEASUREMENT_PERIOD_ID) AS date, COUNT(*) AS count FROM EDM_BI_MOBILITY.CALL_HISTORY_SEGMENT_VAS WHERE MEASUREMENT_PERIOD_ID >= '2023-09-01' AND MEASUREMENT_PERIOD_ID < '2023-10-18'
GROUP BY DATE(MEASUREMENT_PERIOD_ID) ORDER BY DATE(MEASUREMENT_PERIOD_ID);

select * from EDM_BI_MOBILITY.SEGMENTED_CLM_KPIS_TAGGING;
select * from EDM_BI_MOBILITY.SEGMENTED_CLM_KPIS_TAGGING where REPORT_DATE ='2023-08-23';
select max(REPORT_DATE) as last_update from EDM_BI_MOBILITY.SEGMENTED_CLM_KPIS_TAGGING;
SELECT DATE(REPORT_DATE) AS date, COUNT(*) AS count FROM EDM_BI_MOBILITY.SEGMENTED_CLM_KPIS_TAGGING WHERE REPORT_DATE >= '2023-09-01' AND REPORT_DATE < '2023-10-18'
GROUP BY DATE(REPORT_DATE) ORDER BY DATE(REPORT_DATE);

--NRT
--MADAGASCAR, MALAWI, CONGOB
--
select count (*) as count, max(CALL_START_DATE) as max_CALL_START_DATE, max(CALL_START_TIME) as CALL_START_TIME, current_timestamp as current_date_time 
from EDM_BI_MOBILITY.SERVICE_USAGE_RATED_OLCC where CALL_START_DATE= current_date-0 day AND LOAD_TIME>CALL_START_TIME;

select count (*) as count, max(CALL_START_DATE) as CALL_START_DATE, max (CALL_START_DATE) as CALL_START_DATE, max (CALL_START_TIME) as CALL_START_TIME, current_timestamp as data_time
from EDM_BI_MOBILITY.SERVICE_USAGE_RATED_OLCC OTHER where CALL_START_DATE= current_date-0 day AND LOAD_TIME>CALL_START_TIME;

select count (*) as count, max(TRANSACTION_START_DATE) max_TRANSACTION_START_DATE, max(TRANSACTION_START_TIME) max_TRANSACTION_START_TIME, current_timestamp as current_date_time from 
EDM_BI_MOBILITY.SERVICE_RECHARGE_AIR_MAIN where TRANSACTION_START_DATE= current_date-0 day AND LOAD_TIME>TRANSACTION_START_TIME;


--NRT
--UGANDA
select count (*) as count, max(CALL_START_DATE) as max_CALL_START_DATE, max(CALL_START_TIME) as CALL_START_TIME, current_timestamp as current_date_time 
from EDM_BI_MOBILITY. SERVICE_USAGE_RATED_OLCC_SMS where  CALL_START_DATE= current_date-0 day AND LOAD_TIME>CALL_START_TIME;

select count (*) as count, max(CALL_START_DATE), max (CALL_START_DATE), max (CALL_START_TIME), current_timestamp as current_date_time 
from EDM_BI_MOBILITY.SERVICE_USAGE_RATED_OLCC_DATA where CALL_START_DATE= current_date-0 day AND LOAD_TIME>CALL_START_TIME;

select count (*) as count, max(CALL_START_DATE) as max_CALL_START_DATE, max(CALL_START_TIME) as CALL_START_TIME, current timestamp as current_date_time 
from EDM_BI_MOBILITY.SERVICE_USAGE_RATED_OLCC_VOICE where CALL_START_DATE= current_date-8 day AND LOAD_TIME>CALL_START_TIME;

select count (*), max(TRANSACTION_START_DATE)max_TRANSACTION_START_DATE, max(TRANSACTION_START_TIME) max_TRANSACTION_START_TIME, current_timestamp as current_date_time 
from EDM_BI_MOBILITY.SERVICE_RECHARGE_AIR_MAIN where TRANSACTION_START_DATE= current_date-0 day AND LOAD_TIME>TRANSACTION_START_TIME;

--NRT
--KENYA, NIGER, CHAD, DRC,TANZANIA,GABON,ZAMBIA
select count (*) as count, max(CALL_START_DATE) as CALL_START_DATE, max (CALL_START_TIME) as CALL_START_TIME, current_timestamp as date_time from UNICAUSR.VIEW_SERVICE_USAGE_RATED_OLCC where CALL_START_DATE= current_date-0 day and time(current_timestamp)>CALL_START_TIME with ur;

select count (*) as count, max(CALL_START_DATE) as CALL_START_DATE, max (CALL_START_TIME) as CALL_START_TIME, current timestamp as date_time from UNICAUSR.VIEW_SERVICE_USAGE_RATED_OLCC_OTHER where CALL_START_DATE= current_date-0 day and time (current_timestamp)>CALL_START_TIME with ur;

select count (*) as count, max(TRANSACTION_START_DATE) max_TRANSACTION_START_DATE, max(TRANSACTION_START_TIME) max_TRANSACTION_START_TIME, current_timestamp as current_date_time from UNICAUSR.VIEW_SERVICE_RECHARGE_AIR_MAIN where TRANSACTION_START_DATE= current_date-0 day and time (current_timestamp)>TRANSACTION_START_TIME with ur;




--p2 user(active/inactive) details query

select a.LOGINNAME as USER_NAME,a.EMAILID as EMAIL_ID, case a.ACTIVE WHEN  '0' then 'DISABLE' WHEN  '1' then 'ACTIVE' END as STATUS,a.CREATEDDATE as created_date,a.PASSWORDUPDATEDDATE as LAST_PWD_CHANGE_DATE,a.LASTLOGINDATE as LAST_LOGIN,
a.FIRSTNAME||a.LASTNAME "FULL_NAME",b.GROUPNAME as APPLICATION_ROLE from provisioning.login_master a inner join provisioning.group_master b on a.GROUPID_GROUPID_OID=b.GROUPID;


select a.LOGINID as LOGIN_ID,a.ACTIVE as ACTIVE,a.COUNTRYID_ORGANIZATION_UNIT_ID_OID as COUNTRYID_ORGANIZATION_UNIT_ID_OID,a.CREATEDBY as CREATEDBY,
a.CREATEDDATE as CREATEDDATE,a.EMAILID as EMAIL_ID,a.FIRSTNAME as FIRSTNAME,a.GROUPID_GROUPID_OID as GROUPID_GROUPID_OID,a.LASTLOGINDATE as LASTLOGINDATE,
a.LASTNAME as LASTNAME,a.LOCKCOUNT as LOCKCOUNT,a.LOCKUNLOCKSTATUS as LOCKUNLOCKSTATUS,a.LOGINNAME as LOGINNAME,a.MSISDN as MSISDN,a.PASSWORD as PASSWORD,
a.PASSWORDEXPIREDATE as PASSWORDEXPIREDATE,a.PASSWORDUPDATEDDATE as PASSWORDUPDATEDDATE,a.UPDATEDBY as UPDATEDBY,a.UPDATEDDATE as UPDATEDDATE,
a.UPDATEDDATE as UPDATEDDATE,b.GROUPNAME as APPLICATION_ROLE 
from provisioning.login_master a inner join provisioning.group_master b on a.GROUPID_GROUPID_OID=b.GROUPID;



--select * from provisioning.product_offer where code in('PO_1494','PO_1496','PO_1498','PO_1500','PO_1502','PO_1504','PO_1506','PO_1508','PO_1536','PO_1474','PO_1510','PO_1512','PO_1514','PO_1516','PO_1518','PO_1520','PO_1522','PO_1524','PO_1526','PO_1528','PO_1530','PO_1532','PO_1534');

SELECT COUNT(*), PROV_STATUS
FROM ibm_at.at_provision
WHERE DATE(lastupdatedatetime) = CURRENT_DATE - 2 DAY
  AND CAMPAIGNCODE = 'UG000001234'
GROUP BY PROV_STATUS;

--DATEWISE COUNT

--SELECT Report_date, COUNT(*) AS daily_count
FROM EDM_BI_MOBILITY_UNICA.VIEW_SUBS_REPORT_DAILY_HIST
GROUP BY Report_date
ORDER BY Report_date;

--SELECT Report_date, COUNT(*) AS daily_count
Select * FROM EDM_BI_MOBILITY_UNICA.VIEW_SUBS_REPORT_DAILY_HIST
WHERE Report_date >= '2023-09-01' AND Report_date < '2023-10-03'
GROUP BY Report_date
ORDER BY Report_date;


--select * from provisioning.login_master where loginname='23167024';

--update provisioning.login_master set ACTIVE=1 WHERE LOGINID=12012 AND FIRSTNAME='Jagannath' AND LOGINNAME='23167024';

select * from edm_bi_mobility.product_offer where code in(‘PO_1046‘,’PO_1048‘,'PO_1050','PO_1052');

SELECT * FROM edm_bi_mobility.product_offer WHERE code IN ('PO_1046', 'PO_1048', 'PO_1050', 'PO_1052');

--select count(*),PROV_STATUS,date(lastupdatedatetime) from ibm_at.at_provision where  date(lastupdatedatetime)>= '2024-01-23' and (lastupdatedatetime)<= '2024-01-29'  group by prov_status,date(lastupdatedatetime);

select count(*),sms_status,date(last_change) from ibm_at.at_sms_notification where sms_status='3' and date(last_change)>= '2024-01-23' and (last_change)<= '2024-01-30' and sms_text is not null and cc_msisdn is not null group by sms_status,date(last_change) with ur;

--UNICADB USER IN TABLES
--select * FROM IBM_MP_ST.USM_USER where name in('23172973','13215586','13401352','1300014','2386168','23106487','23106488','23114385','23116434','23116437','2390957','23166025','1303717','23127166','23103254');

--P2DB USER IN TABLES
--select * from provisioning.user_audit where login_name in('23147059','23169164','23165784','23144880','23169763','23159693','23165135','23169543','23150684','23165025','23156024','2388500','23175043','23163194');

---query to check PARTITION 
select * from SYSCAT.DATAPARTITIONS where upper(tabname)=upper('UA_CONTACTHISTORY');


select count(*),ENDPOINT_STATUS from campaign_orc.enpoint_communication_status where date(created_on_dt) =current_date -0 day group by endpoint_status;

select DATE(LASTUPDATEDATETIME),COUNT(*) from ibm_at.at_provision where date(LASTUPDATEDATETIME)between '2024-02-20' and '2024-02-25' group by
DATE(LASTUPDATEDATETIME) ;

select DATE(CREATEDATETIME),COUNT(*) from ibm_at.at_sms_notification where date(CREATEDATETIME) 
between '2024-02-20' and '2024-02-25' group by DATE(CREATEDATETIME) ;


select DATE(LASTUPDATEDATETIME), count(*),PROV_STATUS from ibm_at.at_provision where PROV_STATUS= '3' AND date(lastupdatedatetime)>='2024-05-20' and (lastupdatedatetime)<= '2024-05-26' group by prov_status,LASTUPDATEDATETIME;

Select DATE(last_change), count(*),sms_status from ibm_at.at_sms_notification where sms_status= '3'  AND date(last_change)>='2024-05-20' and (last_change)<= '2024-05-26' group by sms_status;


select count(*),sms_status from ibm_at.at_sms_notification_arh where date(last_change)= '2024-05-24' and sms_text is not null and cc_msisdn is not null group by sms_status with ur;


select count(*),sms_status from ibm_at.at_sms_notification_arh where date(last_change)= '2024-05-26' and sms_text is not null and cc_msisdn is not null group by sms_status with ur;


SELECT SCHEDULE_NAME,date(UPDATED_TIME) FROM RE_SCHEDULE_DETAIL where date(UPDATED_TIME)>='2024-07-01' and date(UPDATED_TIME)<='2024-07-15' GROUP BY SCHEDULE_NAME,date(UPDATED_TIME);

echo 1 > /proc/sys/vm/drop_caches

select * from PROVISION_CDR_07 where TRANSACTION_ID= 'APCNG146627647115328' limit 1\G;
======================================================================================================
==========================================================================================================
SELECT COUNT(*), ACCOUNT_ID, SERVICE_TYPE, TRANSACTION_TYPE, GRADE_CODE, TRANSFER_STATUS, SECOND_PARTY_CATEGORY_CODE, SECOND_PARTY_ACCOUNT_ID, DATE(TRANSFER_ON)
FROM MTX_TRANSACTION_ITEMS
WHERE DATE(TRANSFER_ON) >= '2024-09-01' 
  AND DATE(TRANSFER_ON) <= '2024-09-18'
GROUP BY ACCOUNT_ID, SERVICE_TYPE, TRANSACTION_TYPE, GRADE_CODE, TRANSFER_STATUS, SECOND_PARTY_CATEGORY_CODE, SECOND_PARTY_ACCOUNT_ID, DATE(TRANSFER_ON)
ORDER BY DATE(TRANSFER_ON) ASC
INTO OUTFILE '/data/memsql_db_files/Anurag.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
===========================================
Provision Monitoring
SELECT COUNT(*) AS Total_Count, CASE WHEN status = '200' THEN 'SUCCESS' WHEN status = 'SC0000' THEN 'SUCCESS' WHEN status = 'SC0002' THEN 'SUCCESS' WHEN statu = 'SC0000-SUCCESS' THEN 'SUCCESS'   ELSE 'FAILED'  END AS Status_Reason   FROM
PROVISION_CDR_01  WHERE  DATE(CREATE_DATE) = CURDATE() - INTERVAL 0 DAY GROUP BY Status_Reason;
==================================================
SMS Monitoring
select count(*) AS count,field40,DATE(CREATE_TIME) AS date, CASE WHEN field40 = '0' THEN 'success' ELSE 'failed' END AS status FROM SUBMIT_CDR_11 WHERE DATE(CREATE_TIME)= CURDATE() - INTERVAL 0 DAY GROUP BY status;
--Hourly sms COUNT
SELECT COUNT(*) AS count, field40, DATE(CREATE_TIME) AS date, HOUR(CREATE_TIME) AS hour, CASE WHEN field40 = '0' THEN 'success' ELSE 'failed' END AS status
FROM SUBMIT_CDR_01 WHERE DATE(CREATE_TIME) = CURDATE() - INTERVAL 0 DAY GROUP BY hour, status order by hour, status;
----Current Hour sms counts
SELECT COUNT(*) AS count, field40, DATE(CREATE_TIME) AS date, CASE WHEN field40 = '0' THEN 'success' ELSE 'failed' END AS status FROM SUBMIT_CDR_11 WHERE DATE(CREATE_TIME) = CURDATE() - INTERVAL 0 DAY
AND HOUR(CREATE_TIME) = HOUR(NOW()) GROUP BY status;
==================================
---------hourly delivery counts on handset
SELECT COUNT(*) AS count, field12, DATE(field3) AS date, HOUR(field3) AS hour, CASE WHEN field12 = '0' THEN 'success' ELSE 'failed' END AS status
FROM DELIVERY_CDR_05 WHERE DATE(field3) = CURDATE() - INTERVAL 0 DAY GROUP BY hour, status order by hour, status;
===============================
Provision Monitoring with reason:
SELECT COUNT(*) AS Total_Count,CREATE_DATE, CASE WHEN status = '200' THEN 'SUCCESS' WHEN status = 'SC0000' THEN 'SUCCESS' WHEN status = 'SC0002' THEN 'SUCCESS' WHEN status = 'SC0000-SUCCESS' THEN 'SUCCESS' ELSE 'FAILED' END AS Status_Reason FROM PROVISION_CDR_01 WHERE DATE(CREATE_DATE) = CURDATE() - INTERVAL 0 DAY GROUP BY Status_Reason;
-----SUCCUESS AND FAILURE COUNTS WITH REASON
SELECT COUNT(*) AS Total_Count,REASON, CASE WHEN status = '200' THEN 'SUCCESS' WHEN status = 'SC0000' THEN 'SUCCESS' WHEN status = 'SC0002' THEN 'SUCCESS' WHEN status = 'SC0000-SUCCESS' THEN 'SUCCESS' ELSE 'FAILED' END AS Status_Reason FROM PROVISION_CDR_12 WHERE DATE(CREATE_DATE) = CURDATE() - INTERVAL 0 DAY GROUP BY Status_Reason,REASON;
--------current hour prov status
SELECT COUNT(*) AS Total_Count,CREATE_DATE, CASE WHEN status = '200' THEN 'SUCCESS' WHEN status = 'SC0000' THEN 'SUCCESS' WHEN status = 'SC0002' THEN 'SUCCESS' WHEN status = 'SC0000-SUCCESS' THEN 'SUCCESS' ELSE 'FAILED' END AS Status_Reason 
FROM PROVISION_CDR_01 WHERE DATE(CREATE_DATE) = CURDATE() - INTERVAL 0 DAY AND HOUR(CREATE_DATE) = HOUR(NOW()) 
GROUP BY Status_Reason;
----Provisoing success and failure houly counts
SELECT HOUR(CREATE_DATE) AS Hour,DATE(CREATE_DATE) AS Date,SUM(CASE WHEN status IN ('200', 'SC0000', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Success_Count,
SUM(CASE WHEN status NOT IN ('200', 'SC0000', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Failure_Count FROM PROVISION_CDR_02
WHERE DATE(CREATE_DATE) = CURDATE() - INTERVAL 0 DAY GROUP BY Hour Order by Hour;
==================================================
----Provisoing success and failure houly counts (Exclude Session Browsing)
SELECT HOUR(CREATE_DATE) AS Hour,DATE(CREATE_DATE) AS Date,SUM(CASE WHEN status IN ('200', 'SC0000', 'SC0002', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Success_Count,
SUM(CASE WHEN status NOT IN ('200', 'SC0000', 'SC0002', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Failure_Count FROM PROVISION_CDR_01
WHERE DATE(CREATE_DATE) = CURDATE() - INTERVAL 0 DAY and EVENT NOT IN ('SessionBrowsing') GROUP BY Hour Order by Hour;
====================================
-----Provisoing success and failure houly counts with reason
SELECT HOUR(CREATE_DATE) AS Hour,DATE(CREATE_DATE) AS Date,REASON,SUM(CASE WHEN status IN ('200', 'SC0000', 'SC0002', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Success_Count,
SUM(CASE WHEN status NOT IN ('200', 'SC0000', 'SC0002', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Failure_Count FROM PROVISION_CDR_01
WHERE DATE(CREATE_DATE) = CURDATE() - INTERVAL 0 DAY GROUP BY Hour,REASON order by Hour;



Msg:17047:Subscriber balance is below minimum balance.

select count(*) AS count,field40 FROM SUBMIT_CDR_10 WHERE field40 != '0' and DATE(CREATE_TIME)= CURDATE() - INTERVAL 0 DAY group by field40;


==================
Hourly count query:
SELECT COUNT(*) AS Total_Count, HOUR(CREATED_DATE) AS Hour,DATE(CREATED_DATE) AS Date from MTX_TRANSACTION_ITEMS WHERE DATE(CREATED_DATE) = CURDATE() - INTERVAL 0 DAY GROUP BY Hour Order by Hour;

provisioning:
select DATE(CREATE_DATE),SCHEDULE_ID,count(*) from PROVISION_CDR_11 where SCHEDULE_ID != 'NULL' AND ACTION_KEY not like 'NRT%' and DATE(CREATE_DATE) = '2024-11-29' group by DATE(CREATE_DATE),SCHEDULE_ID order
by DATE(CREATE_DATE) desc;


===CHAD AM_CASH_BACK
SELECT COUNT(*),field40,field12,field13 FROM SUBMIT_CDR_01 where date(CREATE_TIME)='2025-01-27' and field12='AM_CASHBACK' group by field40,field12,field13;


=============Failure reason QUERY
 


LIFECYCLE CDR TABLE CHECK

SELECT MSISDN,ACTION_KEY,IMEI,CREATED_DATE FROM (SELECT * from LIFECYCLE_CDR_1 
UNION ALL
SELECT * from LIFECYCLE_CDR_2
UNION ALL
SELECT * from LIFECYCLE_CDR_0
UNION ALL
SELECT * from LIFECYCLE_CDR_3
UNION ALL
SELECT * from LIFECYCLE_CDR_4
UNION ALL
SELECT * from LIFECYCLE_CDR_5
UNION ALL
SELECT * from LIFECYCLE_CDR_6
UNION ALL
SELECT * from LIFECYCLE_CDR_7
UNION ALL
SELECT * from LIFECYCLE_CDR_8
UNION ALL
SELECT * from LIFECYCLE_CDR_9)
where IMEI in  ('358741820780259','351712570222856','358741820801170','861420062523582','357894856028050','357894856132969','358741820692322','358741820390273')
AND ACTION_KEY='HBB_ADD_Account';
===========================================
use the below NRT Query in case of data not loaded in provision cdr on correct time stamp:

memsql -ucvmuser -pcvmuser@6Dtech -h172.26.210.176 -P4406 -D Airtel_MAGIK_UI -A -e "SELECT    DATE_FORMAT(STR_TO_DATE(CHANNEL_REQUEST_TIMESTAMP, '%d%m%Y%H%i%s'), '%Y-%m-%d %H:00:00') AS hourly,    SUM(CASE WHEN status IN ('200', 'SC0000', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Success_Count_NRT_LEAP_RECHARGE,     SUM(CASE WHEN status NOT IN ('200', 'SC0000', 'SC0000-SUCCESS') THEN
1 ELSE 0 END) AS Failure_Count_NRT_LEAP_RECHARGE FROM    PROVISION_CDR_05   WHERE    DATE(STR_TO_DATE(CHANNEL_REQUEST_TIMESTAMP, '%d%m%Y%H%i%s')) = '2025-05-01'   AND EVENT LIKE '%NRT_LEAP_RECHARGE%' GROUP BY    hourly ORDER BY    hourly;"

===================
SELECT 
    s.field8 AS MSISDN,
    s.field5 AS Submitted_to_SMSC,
    s.field6 AS Received_by_SMSC,
    d.field3 AS Delivered_to_Handset
FROM 
    SUBMIT_CDR_07 s
LEFT JOIN 
    DELIVERY_CDR_07 d 
    ON s.field8 = d.field5 
    AND DATE(d.CREATE_TIME) = '2025-07-25'
WHERE 
    s.field8 IN ('242057062878','242056182244','242044118989','242053175450','24205O176246')
    AND DATE(s.CREATE_TIME) = '2025-07-25' and d.field5 IN ('242057062878','242056182244','242044118989','242053175450','24205O176246') Group by s.field6;


============kenya payx hourly trend

SELECT 
  HOUR(CREATE_DATE) AS Hour,
  DATE(CREATE_DATE) AS Date,
  SUM(CASE WHEN status IN ('200', 'SC0000', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Success_Count,
  SUM(CASE WHEN status NOT IN ('200', 'SC0000', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Failure_Count
FROM 
  PROVISION_CDR_04
WHERE 
  DATE(CREATE_DATE) = '2025-04-03' 
  AND ACTION_KEY = 'Paybill_HVC_BNS' 
  AND PRODUCT_CODE = 'MD60'
GROUP BY 
  DATE(CREATE_DATE), HOUR(CREATE_DATE)
ORDER BY 
  Hour;
  =========================
  -------------confirmation required ki ye NRT_CASHIN_P2P_Combined.sh (leap cashin, leap p2p) replacement hai-----------------
  SELECT 
    HOUR(CREATE_DATE) AS Hour,
    DATE(CREATE_DATE) AS Date,
    SUM(CASE WHEN status IN ('200', 'SC0000', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Success_Count,
    SUM(CASE WHEN status NOT IN ('200', 'SC0000', 'SC0000-SUCCESS') THEN 1 ELSE 0 END) AS Failure_Count
FROM PROVISION_CDR_05
WHERE 
    DATE(CREATE_DATE) = '2025-05-04' 
    AND EVENT = 'NRT_LEAP_SUBSCASHIN'--(leap cashin) only remaining campaign leap p2p
GROUP BY 
    DATE(CREATE_DATE), HOUR(CREATE_DATE)
ORDER BY 
    Hour;
	
=================
 "SELF_CARE_AQUSITION.sh"---------------live
    "HBB_BLACKLIST_BONUS.sh"------------live
    "SMART_PHONE.sh"--------------------live
    "NRT_CASHIN_P2P_Combined.sh"-----------------Not live------------rag
    "NRT_LEAP_PREEXP.sh"----------------live
    "CASHBACK_STATUS_MD50.sh"-------------LIVE
    "PAYBILL.sh"----------------------------------Not live-----kl launch hoga
    "NRT_LEAP_RECHARGE.sh"-------------LIVE
     AM_2_GSM_Clawback_BNS--------------------NOT LIVE-------
	 
==============congo command Received by smsc
SELECT COUNT(*) AS count, field40, DATE(field6) AS date, HOUR(field6) AS hour, CASE WHEN field40 = '0' THEN 'success' ELSE 'failed' END AS status
FROM SUBMIT_CDR_11 WHERE DATE(field6) = CURDATE() - INTERVAL 0 DAY GROUP BY hour, status order by hour, status;



===================Details for MSISDN
SELECT 
    d.field5 AS MSISDN,
    s.field4 AS Submitted_SMSC,
    s.field6 AS Received_SMSC,
    d.field3 AS Delivered_to_Handset,
    s.field10 AS SMS,
    DATE(s.field6) AS Submit_Date
FROM 
    DELIVERY_CDR_04 d
JOIN 
    SUBMIT_CDR_04 s 
    ON d.field5 = CONCAT('235', s.field8)
WHERE 
    d.field5 = '23568488727' 
    AND DATE(s.field6) = '2025-04-26'
    AND DATE(d.field3) = '2025-04-26' group by s.field6;
===========================Campaign Wise Hourly counts for SMS===============
memsql -udbadmin -pdbadmin@6Dtech -h172.25.64.65 -P4406 -D Airtel_MAGIK_UI -A -e"SELECT 
    DATE_FORMAT(field5, '%Y-%m-%d %H:00:00') AS hour_slot,
    field4,
    field6,
    field12,
    field40,
    COUNT(*) AS CNT
FROM 
    SUBMIT_CDR_11
WHERE 
    DATE(field5) = '2025-11-26'
GROUP BY 
    hour_slot, field4, field6, field12, field40
ORDER BY 
    hour_slot;" | tr "\t" "," > /home/cvmuser/Reports/SMSC_Report.csv
	
	
Monthly counts query:
Select count (*) from PROVISION_CDR_07 where DATE(CREATE_DATE)>='2025-07-01'; ----NRT & NOT NRT

Select count (*) from SUBMIT_CDR_07 where DATE(CREATE_TIME)>='2025-07-01';
============================================================================================
SMS query With two tables;
SELECT 'KE' AS OPCO,  field7 Sender_id,     field1 TR_DATE,     SUM(CASE WHEN field40 = 0 THEN 1 ELSE 0 END) AS success,     SUM(CASE WHE
N field40 <> 0 THEN 1 ELSE 0 END) AS failed FROM (     SELECT field7, field1, field40 FROM SUBMIT_CDR_07     UNION ALL     SELECT field7, field1, fiel
d40 FROM SUBMIT_CDR_08 ) AS combined WHERE field1 >= '2025-07-26' GROUP BY field7, field1 ORDER BY field1;


=========================
SMS QUERY
SELECT a.field13 AS Campaign_Name, CASE WHEN a.field13 LIKE '%AM_%' THEN 'AM' ELSE 'GSM' END AS Campaign_Type, COUNT(a.transaction_id) AS TotalSMSSubmitted, SUM(CASE WHEN b.field12 = '0' THEN 1 ELSE 0 END) AS
TotalSmsDelivered, SUM(CASE WHEN b.field12 <> '0' THEN 1 ELSE 0 END) AS TotalDeliveryFailed FROM Airtel_MAGIK_UI.DELIVERY_CDR_08 b JOIN Airtel_MAGIK_UI.SUBMIT_CDR_08 a ON a.transaction_id = b.transaction_id GROUP BY a.field13 ORDER BY Campaign_Name;
==============ALL TABLE SIZE QUERY FOR ALL DATABASES======
SELECT
    database_name,
    table_name,
    SUM(rows_count) AS total_rows,
    ROUND(SUM(compressed_size) / 1024 / 1024 / 1024, 2) AS Total_size_gb
FROM
    information_schema.columnar_segments
GROUP BY
    database_name, table_name
ORDER BY
    Total_size_gb DESC;
===============All table size query for all databases mysql===================
SELECT table_schema, table_name AS `Table`, ROUND(((data_length + index_length) / 1024 / 1024), 2) AS `Size (MB)` FROM information_schema.tables WHERE ROUND(((data_length + index_length) / 1024 / 1024), 2) IS NOT NULL ORDER BY (data_length + index_length) DESC;
	
	
	
==========================Query to check the rulename in mysql====
select * from RE_SCHEDULE_DETAIL where RULE_ID='3474'
============================================

SMS Query with campaign Nmae, ERROR CODE, COUNTS
SELECT 
    a.field13 AS Campaign_Name,
    CASE 
        WHEN b.field12 = '0' THEN 'Success' 
        ELSE CONCAT('Error ', b.field12) 
    END AS Error_Code,
    COUNT(*) AS total_count
FROM Airtel_MAGIK_UI.DELIVERY_CDR_10 b,
     Airtel_MAGIK_UI.SUBMIT_CDR_10 a
WHERE a.transaction_id = b.transaction_id
  AND DATE(a.field5) = '2025-10-23'
GROUP BY b.field12, a.field13, DATE(a.field5)
ORDER BY Campaign_Name, total_count DESC;
	 
===========================DB_BACKUP CHECK QUERY==================
select DATABASE_NAME,START_TIMESTAMP,END_TIMESTAMP,STATUS from information_schema.MV_BACKUP_HISTORY where date(START_TIMESTAMP) >'2025-11-30' and STATUS='Failure';

--select DATABASE_NAME,START_TIMESTAMP,END_TIMESTAMP,STATUS,SIZE,TYPE,SERVER_VERSION from information_schema.MV_BACKUP_HISTORY where date(START_TIMESTAMP)='2025-12-04';

========================TPS QUERY===============
SELECT     DATE(field4) AS date_value,     HOUR(field4) AS hour_value,     MINUTE(field4) AS minute_value,     SECOND(field4) AS second_value,     COUNT(*) AS TPS FROM SUBMIT_CDR_12 WHERE DATE(field4) = CURDATE() - INTERVAL 0 DAY and HOUR(field4)>='14' GROUP BY     DATE(field4),     HOUR(field4),     MINUTE(field4),     SECOND(field4) order by DATE(field4),     HOUR(field4),     MINUTE(field4),     SECOND(field4);