*** Variables ***
#-------------------------------------------- Detail Log --------------------------------------------#
#endPointName : ProvisioningAPIs
${DETAIL_ENDPOINTNAME_PullMessageAPIs}    PullMessageAPIs
${DETAIL_CMD_PullMessageAPIs}    Pull
${VALUE_DETAIL}    Detail  
${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}    systemTimestamp   
${FIELD_LOG_DETAIL_LOGTYPE}    logType  
${FIELD_LOG_DETAIL_LOGLEVEL}    logLevel  
${FIELD_LOG_DETAIL_NAMESPACE}    namespace  
${FIELD_LOG_DETAIL_APPLICATIONNAME}    applicationName  
${FIELD_LOG_DETAIL_CONTAINERID}    containerId
${FIELD_LOG_DETAIL_SESSIONID}    sessionId  
${FIELD_LOG_DETAIL_TID}    tid 
${FIELD_LOG_DETAIL_CUSTOM1}    custom1   
${FIELD_LOG_DETAIL_CUSTOM2}    custom2   
${FIELD_LOG_DETAIL_ENDPOINTNAME}    endPointName
${FIELD_LOG_DETAIL_REQUESTOBJECT}    requestObject
${FIELD_LOG_DETAIL_URL}    url
${FIELD_LOG_DETAIL_HEADERS}    headers
${FIELD_LOG_DETAIL_XAISORDERREF}    x-ais-OrderRef
${FIELD_LOG_DETAIL_BODY}    body
${FIELD_LOG_DETAIL_IMSI}    Imsi
${FIELD_LOG_DETAIL_IPADDRESS}    IpAddress        
${FIELD_LOG_DETAIL_RESPONSEOBJECT}    responseObject
${FIELD_LOG_DETAIL_THINGTOKEN}    ThingToken
${FIELD_LOG_DETAIL_OPERATIONSTATUS}    OperationStatus
${FIELD_LOG_DETAIL_OPERATIONSTATUS_CODE}    Code
${FIELD_LOG_DETAIL_OPERATIONSTATUS_DESCRIPTION}    Description
${FIELD_LOG_DETAIL_ACTIVITYLOG}    activityLog
${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}    startTime
${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}    endTime
${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}    processTime
${VALUE_LOG_DETAIL_LOGLEVEL}    INFO  
${VALUE_LOG_DETAIL_CUSTOM2}    ${NONE}
${VALUE_LOG_DETAIL_VERSION}    v1

#-------------------------------------------- PullMessage --------------------------------------------#
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_PULLMESSAGEGETDATA}    "{\"url\":\"[valuePathUrl]\",\"headers\":{\"x-ais-orderref\":\"[tid]\"},\"routeParamteters\":\"{"Key":\"[routeParamteters]\"}\"}"
${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    "{\"ThingName\":\"[ThingName]\",\"IMEI\":\"[IMEI]\",\"IMSI\":\"[IMSI]\",\"ICCID\":\"[ICCID]\",\"Sensor\":{\"[SensorKey]\":\"[SensorValue]\"},\"OperationStatus\":null}"
${VALUE_LOG_DETAIL_RESPONSEOBJECT_Error}    "{\"ThingName\":null,\"IMEI\":null,\"IMSI\":null,\"ICCID\":null,\"Sensor\":null,\"OperationStatus\":{\"Code\":\"[Code]\",\"Description\":\"[Description]\"}}"
#-------------------------------------------- Summary Log --------------------------------------------# 
${VALUE_SUMMARY}    Summary 
#field log Summary
${FIELD_LOG_SUMMARY_SYSTEMTIMESTAP}    systemTimestamp   
${FIELD_LOG_SUMMARY_LOGTYPE}    logType  
${FIELD_LOG_SUMMARY_NAMESPACE}    namespace
${FIELD_LOG_SUMMARY_APPLICATIONNAME}    applicationName
${FIELD_LOG_SUMMARY_CONTAINERID}    containerId
${FIELD_LOG_SUMMARY_SESSIONID}    sessionId
${FIELD_LOG_SUMMARY_TID}    tid 
${FIELD_LOG_SUMMARY_IDENTITY}    identity 
${FIELD_LOG_SUMMARY_CMDNAME}    cmdName  
${FIELD_LOG_SUMMARY_RESULTCODE}    resultCode  
${FIELD_LOG_SUMMARY_RESULTDESC}    resultDesc
${FIELD_LOG_SUMMARY_CUSTOM}    custom
${FIELD_LOG_SUMMARY_CUSTOMDATA}    customData
${FIELD_LOG_SUMMARY_ENDPOINTSUMMARY}    endPointSummary
${FIELD_LOG_SUMMARY_REQTIMESTAP}    reqTimestamp 
${FIELD_LOG_SUMMARY_RESTIMESTAMP}    resTimestamp  
${FIELD_LOG_SUMMARY_USAGETIME}    usageTime 

#value log summary  cmdName: SignIn
${VALUE_LOG_SUMMARY_CMDNAME_SIGNIN}    SignInProcess
${VALUE_LOG_SUMMARY_CMDNAME_SIGNIN_ERROR}    signin

#value log summary  cmdName: ValidateToken
${VALUE_LOG_SUMMARY_CMDNAME_VALIDATETOKEN}    ValidateTokenProcess
${VALUE_LOG_SUMMARY_CMDNAME_VALIDATETOKEN_ERROR}    ValidateToken

#value log summary  cmdName: Thing
${VALUE_LOG_SUMMARY_CMDNAME_RENEWTOKEN}    RenewToken
${VALUE_LOG_SUMMARY_CMDNAME_CREATETHINGSTATEINFO}    CreateThingStateInfo
${VALUE_LOG_SUMMARY_CMDNAME_REMOVETHINGSTATEINFO}    RemoveThingStateInfo
${VALUE_LOG_SUMMARY_CMDNAME_CHANGETHINGPROFILE}    ChangeThingProfile
${VALUE_LOG_SUMMARY_CMDNAME_INQUIRYTHINGBYSUPPLIER}    InquiryThingBySupplier
${VALUE_LOG_SUMMARY_CMDNAME_ACTIVATETHING_CORE}    ActivateThing
${VALUE_LOG_SUMMARY_CMDNAME_TRANSFERTHINHS}    TransferThings
${VALUE_LOG_SUMMARY_CMDNAME_REMOVETHINGFROMACCOUNT}    RemoveThingFromAccount

#value log summary  cmdName: PullMessage
${VALUE_LOG_SUMMARY_CMDNAME_GENERATEPULLMESSAGE}    GeneratePullMessage
${VALUE_LOG_SUMMARY_CMDNAME_UPDATEPULLMESSAGE}    UpdatePullMessage
${VALUE_LOG_SUMMARY_CMDNAME_REMOVEPULLMESSAGE}    RemovePullMessage
${VALUE_LOG_SUMMARY_CMDNAME_INQUIRYPULLMESSAGE}    InquiryPullMessage
${VALUE_LOG_SUMMARY_IDENTITY}    ${NONE}
${VALUE_LOG_SUMMARY_CUSTOM}    ${NONE}





