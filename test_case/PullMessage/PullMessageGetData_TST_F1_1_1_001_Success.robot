*** Settings ***
Resource    ../../variables/Variables.robot    
Resource    ../../keyword/Keyword.robot

*** Test Cases ***
PullMessageGetData_TST_F1_1_1_001_Success
    [Documentation]    Step is :    
	...    1.Signin
	...    2.Create Partner
	...    3.Create Account
	...    4.Import Thing
	...    5.Mapping IMEI   
	...    6.Activate Thing Core
	...    7.Create ThingStateInfo     
    ...    8.GeneratePullMessage 
    ...    9.PullmessageGetData   
    ...    10.Remove PullMessage
	...    11.Remove ThingStateInfo
    ...    12.Remove Thing Core
    ...    13.Remove Account
    ...    14.Remove Partner
	#====== Start Prepare data ==========
	# Prepare data for create thing
	${valArrData}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore    1
	Log    valArrData is : ${valArrData}
    ${ThingName}=    Set Variable    ${valArrData[0]['ThingName']}
    ${IMEI}=    Set Variable    ${valArrData[0]['IMEI']}
	${createResponse}=    Request CreateData for Signin Partner Account ImportThing MappingIMEI ActivateThingCore CreateThingStateInfo and GeneratePullMessage    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}    ${valArrData}    ${VALUE_TYPE_REPORT}    ${VALUE_SENSORKEY}    ${VALUE_GENERATEPULLMESSAGE_TYPE_ALL}
	Log    ${createResponse}
    ${resCreateData}=    Set Variable    ${createResponse}[12]
    ${activateThing}=    Get From Dictionary    ${resCreateData}     ${FIELD_ACTIVATETHING}
    # get value from activate thing 
    ${IMSI}=    Get From Dictionary    ${activateThing}[0]     ${FIELD_IMSI}
    ${ICCID}=    Get From Dictionary    ${activateThing}[0]     ${FIELD_ICCID}
    ${SensorKey}=    Set Variable    ${createResponse}[6]
    ${SensorValue}=    Set Variable    ${createResponse}[7]
    ${SensorValue_Str}=    Convert To String    ${SensorValue}  
    ${SENSOR}=    Create Dictionary    ${SensorKey}=${SensorValue_Str}  
    ${PullMessageKey}=    Set Variable    ${createResponse}[11] 
    ${response_expect}=    Create Dictionary    ThingName=${ThingName}    IMEI=${IMEI}    IMSI=${IMSI}    ICCID=${ICCID}    Sensor=${SENSOR}   
    #====== End Prepare data ==========
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_PullMessageGetData}${current_timestamp}
	Log To Console    Headers is : ${headers}
    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${url}${PULLMESSAGEAPIS}    ${URL_PULLMESSAGEGETDATA}/${PullMessageKey}    ${headers}  
	Log    Response is : ${res}
    Log To Console    ${\n}========= Check Response ===============
    Log To Console    ${\n}Response is : ${\n}${res}
    Dictionaries Should Be Equal    ${response_expect}    ${res}
	#====== Check log and Verify DB ==========
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_PullMessageGetData}${current_timestamp}
	#Check log detail and summary
   	Log PullMessageData Success    ${VALUE_RESULTCODE_20000}    ${VALUE_DESCRIPTION_PULLMESSAGE_SUCCESS}    ${res}    ${URL_PULLMESSAGEGETDATA}    ${dataSearch}    ${PullMessageKey}
    [Teardown]    Generic Test Case Teardown    ${VALUE_RESULTCODE_20000}    ${createResponse}    ${valArrData}[0]