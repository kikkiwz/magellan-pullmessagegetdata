*** Keywords ***	
Post Search Log
    [Arguments]    ${url}    ${valueSearch}    ${value_applicationName}    
	${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    Authorization=${HEADER_AUTHENTICATION}    kbn-version=7.5.1  
	${setRange}=    Rang Get Value Minus Time Current Date and Change Format    ${YYYYMMDDTHMSZ_FROM_NOW}    ${RANGE_SEARCH}    ${TIME_STRING_MINUTES}
	${setRangeGTE}=    Set variable    ${setRange}[0]
	${setRangeLTE}=    Set variable    ${setRange}[1]
	Log    valueSearch${valueSearch}
	${multiMatchType}=    Set Variable    best_fields
    ${data}=    Evaluate    {"version":"true","size":500,"sort":[{"@timestamp_es":{"order":"desc","unmapped_type":"boolean"}}],"_source":{"excludes":[]},"aggs":{"2":{"date_histogram":{"field":"@timestamp_es","fixed_interval":"30s","time_zone":"Asia/Bangkok","min_doc_count":1}}},"stored_fields":["*"],"script_fields":{},"docvalue_fields":[{"field":"@timestamp_es","format":"date_time"},{"field":"cauldron.custom1.activityLog.endTime","format":"date_time"},{"field":"cauldron.custom1.activityLog.startTime","format":"date_time"},{"field":"time","format":"date_time"}],"query":{"bool":{"must":[],"filter":[{"multi_match":{"type":"${multiMatchType}","query":"${valueSearch}","lenient":"true"}},{"range":{"@timestamp_es":{"format":"strict_date_optional_time","gte":"${setRangeGTE}","lte":"${setRangeLTE}"}}}],"should":[],"must_not":[]}},"highlight":{"pre_tags":["@kibana-highlighted-field@"],"post_tags":["@/kibana-highlighted-field@"],"fields":{"*":{}},"fragment_size":2147483647}}
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}    ${EMPTY}    ${headers}    ${data}
	Log    ${res}
	# Log To Console    ${res}
	Sleep    10s
	[return]    ${res}
	
Get tid for Search Log
    [Arguments]    ${value_applicationName}    ${valueSearch}    ${endPointName}	
	${resLog}=    Wait Until Keyword Succeeds    3x    10s    Post Search Log    ${URL_GET_LOG}    ${valueSearch}    ${value_applicationName}
	Sleep    10s
	Log    resLog${resLog}	
	${total}=    Set variable    ${resLog['hits']['total']}
	Should Not Be Equal     ${total}    0
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${total} 
	    ${valLog}=    Set variable    ${resLog['hits']['hits'][${i}]['_source']['cauldron']}
	    ${applicationName}=    Set variable    ${valLog['applicationName']}
		Run Keyword If    '${applicationName}'=='${value_applicationName}'     Append To List    ${valArrData}    ${valLog}        #Add data to array set at valArrData
	END
    ${tid}=    Set variable    ${valArrData[0]['tid']}
	Log To Console    tid${tid}
	${sessionId}=    Set variable    ${valArrData[0]['sessionId']}
	Log To Console    sessionId${sessionId}
    [return]    ${tid}    ${sessionId}
	
Data Log Response
    [Arguments]    ${value_applicationName}    ${valueSearch}    ${endPointName}
	Sleep    2s
	${resTid}=    Wait Until Keyword Succeeds    3x    10s    Get tid for Search Log    ${value_applicationName}    ${valueSearch}    ${endPointName}
	${resLog}=    Wait Until Keyword Succeeds    3x    10s    Post Search Log    ${URL_GET_LOG}    ${resTid}[0]    ${value_applicationName}
    Log    resLog${resLog}	
	${total}=    Set variable    ${resLog['hits']['total']}
	Log To Console    total11${total}			
	${total}=    Set variable    ${resLog['hits']['total']}
	Log To Console    total11${total}
    @{valArrData}=    Create List
	@{valArrDetail}=    Create List
	@{valArrSummary}=    Create List
	FOR    ${i}    IN RANGE    ${total} 
	    ${valLog}=    Set variable    ${resLog['hits']['hits'][${i}]['_source']['log']}
	    ${dataResponse}=    Evaluate    json.loads(r'''${valLog}''')    json
	    ${applicationName}=    Set variable    ${dataResponse['applicationName']}
		${logType}=    Set variable    ${dataResponse['logType']}
	    Run Keyword If    '${applicationName}'=='${value_applicationName}'    Append To List    ${valArrData}    ${dataResponse}    #Add data to array set at valArrData
		Run Keyword If    '${applicationName}'=='${value_applicationName}' and '${logType}'=='${VALUE_DETAIL}'   Append To List    ${valArrDetail}    ${dataResponse}    #Add data to array set at valArrDetail
		Run Keyword If    '${applicationName}'=='${value_applicationName}' and '${logType}'=='${VALUE_SUMMARY}'   Append To List    ${valArrSummary}    ${dataResponse}    #Add data to array set at valArrSummary
		
    END
	Log To Console    valArrDetail${valArrDetail}  
	Log To Console    valArrSummary${valArrSummary}  
    [return]    ${valArrData}    ${valArrDetail}    ${valArrSummary}    ${resTid}[0]    ${resTid}[1]

Log PullMessageData Success
	[Arguments]    ${code}    ${desc}    ${res}    ${pathUrl}    ${dataSearch}    ${PullMessageKey}
	${identity}=    Evaluate    None
    ${custom}=    Set Variable    null
	${response}=    Convert To String    ${res}
	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${code}    ${desc}    ${VALUE_APPLICATIONNAME_PULLMESSAGE}    PullMessageAPIs    ${pathUrl}    ${dataSearch}    ${res}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PULLMESSAGE}    ${identity}    ${DETAIL_CMD_PullMessageAPIs}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${PullMessageKey} 

#-------------------------------------------- Check Log Detail --------------------------------------------#	
Check Log Detail 
    [Arguments]    ${code}    ${desc}    ${data}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${PullMessageKey}  
    Log To Console    ============== Check Log Detail ==============
	Log    data${data} 
	${dataLogDetail}=    Run keyword And Continue On Failure    Log Detail Check EndPointName    ${data}
    Log    ${dataLogDetail}    
	#value ArrDetail Have EndPointName
	${valArrDetailHaveEndPointName}=    Set Variable    ${dataLogDetail}[0]
	#value ArrDetail Not Have EndPointName
	${valArrDetailNotHaveEndPointName}=    Set Variable    ${dataLogDetail}[1]
	${langValArrDetailHaveEndPointName}=    Get Length    ${valArrDetailHaveEndPointName}
	${langValArrDetailNotHaveEndPointName}=    Get Length    ${valArrDetailNotHaveEndPointName}
	Run Keyword If    '${langValArrDetailHaveEndPointName}'!='0'    Check Log Detail Have EndPointName    ${code}    ${desc}    ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${PullMessageKey}
	#Run Keyword If    '${langValArrDetailNotHaveEndPointName}'!='0'    Check Log Detail App Do Not Have EndPointName    ${code}    ${description}     ${valArrDetailNotHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${body}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${responseObjectDetail} 
	
Log Detail Check EndPointName
    [Arguments]    ${data}
	${data_count}=    Get Length    ${data}
    @{valArrDetailHaveEndPointName}=    Create List
	@{valArrDetailNotHaveEndPointName}=    Create List
    FOR    ${i}    IN RANGE    ${data_count}
	    ${keyCustom1}=    Set Variable   @{data[${i}]['custom1']}  
		${checkKeyEndPointName}=    Get Matches    ${keyCustom1}    endPointName
		${countKeyEndPointName}=    Get Length    ${checkKeyEndPointName}
		Run Keyword If    ${countKeyEndPointName}==1    Append To List    ${valArrDetailHaveEndPointName}    ${data}[${i}]    #Add data to array set at valArrData
		Run Keyword If    ${countKeyEndPointName}==0    Append To List    ${valArrDetailNotHaveEndPointName}    ${data}[${i}]    #Add data to array set at valArrData
	END	 
	[return]    ${valArrDetailHaveEndPointName}    ${valArrDetailNotHaveEndPointName}

#-------------------------------------------- Check Log Detail Have EndPointName --------------------------------------------#	
Check Log Detail Have EndPointName  
    [Arguments]        ${code}    ${desc}    ${data}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${PullMessageKey}
    Log To Console    ============== Check Log Detail Have EndPointName ==============
	${data_count}=    Get Length    ${data}
	FOR    ${i}    IN RANGE    ${data_count}
	    ${dataResponse}=    Set Variable    ${data[${i}]}
		# Log To Console    dataResponse${dataResponse}  
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}']    ${data[${i}]['systemTimestamp']}    ${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGTYPE}']    ${VALUE_DETAIL}    ${FIELD_LOG_DETAIL_LOGTYPE} 
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGLEVEL}']    ${logLevel}    ${FIELD_LOG_DETAIL_LOGLEVEL} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_NAMESPACE}']    ${namespace}    ${FIELD_LOG_DETAIL_NAMESPACE}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_APPLICATIONNAME}']    ${applicationName}    ${FIELD_LOG_DETAIL_APPLICATIONNAME}
		#Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CONTAINERID}']    ${containerId}    ${FIELD_LOG_DETAIL_CONTAINERID}
        # Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SESSIONID}']    ${tid}    ${FIELD_LOG_DETAIL_SESSIONID}
		Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_TID}']    ${tid}    ${FIELD_LOG_DETAIL_TID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}']    ${data[${i}]['custom1']['activityLog']['startTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}']    ${data[${i}]['custom1']['activityLog']['endTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}']    ${data[${i}]['custom1']['activityLog']['processTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM2}']    ${VALUE_LOG_DETAIL_CUSTOM2}    ${FIELD_LOG_DETAIL_CUSTOM2}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${endPointName}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ENDPOINTNAME}
		Check Log Detail Custom RequestObject and ResponseObject    ${code}    ${desc}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${endPointName}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${PullMessageKey} 
	END

#-------------------------------------------- Check Log Detail : RequestObject and ResponseObject Have EndPointName --------------------------------------------#		
Check Log Detail Custom RequestObject and ResponseObject
	[Arguments]    ${code}    ${desc}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${endPointName}    ${response}    ${applicationName}    ${pathUrl}   ${custom}    ${PullMessageKey}
	Log To Console    ============== RequestObject ==============
	Check RequestObject PullMessageGetData    ${dataResponse}    ${pathUrl}    ${tid}    ${cmdName}    ${PullMessageKey}
	Log To Console    ============== ResponseObject ==============
	Run Keyword If    '${code}'=='20000'    Check ResponseObject PullMessageGetData Success    ${dataResponse}    ${response}
	Run Keyword If    '${code}'!='20000'    Check ResponseObject PullMessageGetData Error    ${code}    ${desc}    ${dataResponse}

Check RequestObject PullMessageGetData	
    [Arguments]    ${dataResponse}    ${pathUrl}    ${tid}    ${cmdName}    ${PullMessageKey}
	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_PULLMESSAGEGETDATA}    [valuePathUrl]    ${VALUE_LOG_URL}${pathUrl}/${PullMessageKey}
	${replaceTid}=    Replace String    ${replaceUrl}    [tid]    ${tid}
	${replaceRouteParamteters}=    Replace String    ${replaceTid}    [routeParamteters]    ${PullMessageKey}
	${requestObject}=    Replace String To Object    ${replaceRouteParamteters}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

Check ResponseObject PullMessageGetData Success	
    [Arguments]    ${dataResponse}    ${response}
    ${ThingName}=    Get Value From Json    ${response}    ThingName
    ${IMEI}=    Get Value From Json    ${response}    IMEI
    ${IMSI}=    Get Value From Json    ${response}    IMSI
    ${ICCID}=    Get Value From Json    ${response}    ICCID
    ${Sensor}=    Get Value From Json    ${response}    Sensor
	${SensorKey}=    Get Dictionary Keys    ${Sensor}[0]
	${SensorValue}=    Get Dictionary Values    ${Sensor}[0]
	${SensorKey_String}=    Convert To String    ${SensorKey}[0]
	${SensorValue_String}=    Convert To String    ${SensorValue}[0]
	#${Sensor_Str}=    Convert To String    ${Sensor}[0]  
	${replaceThingName}=    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    [ThingName]    ${ThingName}[0]
	${replaceIMEI}=    Replace String    ${replaceThingName}    [IMEI]    ${IMEI}[0]
	${replaceIMSI}=    Replace String    ${replaceIMEI}    [IMSI]    ${IMSI}[0]
	${replaceICCID}=    Replace String    ${replaceIMSI}    [ICCID]    ${ICCID}[0]
	${replaceSensorKey}=    Replace String    ${replaceICCID}    [SensorKey]    ${SensorKey}[0]
	${replaceSensorValue}=    Replace String    ${replaceSensorKey}    [SensorValue]    ${SensorValue}[0]
	${responseObject}=    Replace String To Object    ${replaceSensorValue}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

Check ResponseObject PullMessageGetData Error	
    [Arguments]    ${code}    ${desc}    ${dataResponse}
	${replaceCode}=    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_Error}    [Code]    ${code}
	${replaceDesc}=    Replace String    ${replaceCode}    [Description]    ${desc}
	${responseObject}=    Replace String To Object    ${replaceDesc}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


Check Log Response 
    #resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName,pathUrl,dataSearch,accessToken,accountId,body[request],response[response],namespace,containerId,identity,cmdName,endPointName,logLevel,custom,customDetailDB,responseObjectDetail
    [Arguments]    ${code}    ${desc}    ${applicationName}    ${endPointName}    ${pathUrl}     ${dataSearch}    ${response}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${logLevel}    ${custom}    ${PullMessageKey}
	#Log To Console    imsi_thingTokenimsi_thingToken${imsi_thingToken}
	#return valArrData,valArrDetail,valArrSummary,tid
	${dataLogResponse}=    Data Log Response    ${applicationName}    ${dataSearch}    ${endPointName}
	Log    Log is ${dataLogResponse}
	
	Check Log Detail    ${code}    ${desc}    ${dataLogResponse}[1]    ${dataLogResponse}[3]    ${applicationName}    ${pathUrl}    ${dataSearch}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${PullMessageKey}
	Check Log Summary    ${code}    ${desc}    ${dataLogResponse}[2]    ${dataLogResponse}[3]    ${applicationName}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${custom}

Replace String To Object
    [Arguments]    ${string}
    
	${replStringToJsonStart}=    Replace String    ${string}    "{    {
	${replStringToJsonEnd}=    Replace String    ${replStringToJsonStart}    }"    }
	[RETURN]    ${replStringToJsonEnd}

#-------------------------------------------- Check Log Summary --------------------------------------------#		
Check Log Summary
    [Arguments]    ${resultCode}    ${resultDesc}    ${data}    ${tid}    ${applicationName}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${custom}
    Log To Console    ============== Check Log Summary ==============
	${dataResponse}=    Set Variable    ${data[0]} 
    Log    ${dataResponse}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_REQTIMESTAP}']    ${data[0]['reqTimestamp']}    ${FIELD_LOG_SUMMARY_REQTIMESTAP} 
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_CMDNAME}']    ${cmdName}    ${FIELD_LOG_SUMMARY_CMDNAME} 
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_IDENTITY}']    ${identity}    ${FIELD_LOG_SUMMARY_IDENTITY}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_RESULTCODE}']    ${resultCode}    ${FIELD_LOG_SUMMARY_RESULTCODE} 
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_RESULTDESC}']    ${resultDesc}    ${FIELD_LOG_SUMMARY_RESULTDESC}
    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_RESTIMESTAMP}']    ${data[0]['resTimestamp']}    ${FIELD_LOG_SUMMARY_RESTIMESTAMP}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_USAGETIME}']    ${data[0]['usageTime']}    ${FIELD_LOG_SUMMARY_USAGETIME} 
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_CUSTOM}']    ${data[0]['custom']}    ${FIELD_LOG_SUMMARY_CUSTOM} 
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_LOGTYPE}']    ${VALUE_SUMMARY}    ${FIELD_LOG_SUMMARY_LOGTYPE}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_SYSTEMTIMESTAP}']    ${data[0]['systemTimestamp']}    ${FIELD_LOG_SUMMARY_SYSTEMTIMESTAP}
	#Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_CONTAINERID}']    ${containerId}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_NAMESPACE}']    ${namespace}    ${FIELD_LOG_SUMMARY_NAMESPACE}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_APPLICATIONNAME}']    ${applicationName}    ${FIELD_LOG_SUMMARY_APPLICATIONNAME}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_SESSIONID}']    ${data[0]['sessionId']}    ${FIELD_LOG_SUMMARY_SESSIONID}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_SUMMARY_TID}']    ${data[0]['tid']}    ${FIELD_LOG_SUMMARY_TID}