*** Settings ***

Resource    ../variables/Variables_Data.robot
Resource    ../variables/Variables_Log.robot 

*** Variables ***
#================= ENV=================
#STAGING
# ${URL}    https://mg-staging.siamimo.com
# ${SIGNIN_USERNAME}    QATest_003
# ${SIGNIN_PASSOWORD}    bnZkZm5nZXJnbGtkanZlaWdqbmVvZGtsZA==
# ${URL_GET_LOG}    https://mg-staging.siamimo.com:30380/elasticsearch/application*/_search?rest_total_hits_as_int=true&ignore_unavailable=true&ignore_throttled=true&preference=1620900474581&timeout=30000ms
# applicationName : ProvisioningAPIs
# ${VALUE_APPLICATIONNAME_PROVISIONING}    ProvisioningAPIs
# ${VALUE_LOG_NAMESPACE}    Magellan 

#IOT
${URL}    https://mg-iot.siamimo.com
${URL_CENTRIC}    https://mgcentric-iot.siamimo.com
${URL_GET_LOG}    https://mg-iot.siamimo.com:30380/elasticsearch/application*/_search?rest_total_hits_as_int=true&ignore_unavailable=true&ignore_throttled=true&preference=1620900474581&timeout=30000ms
# applicationName : ProvisioningAPIs
${VALUE_APPLICATIONNAME_PULLMESSAGE}    PullMessageAPIs
${VALUE_LOG_CONTAINERID_PULLMESSAGE}    pullmessageapis-v50
${VALUE_LOG_URL}    mg-iot.siamimo.com
${VALUE_LOG_NAMESPACE}    magellan 

#================= Username,Pass =====================
#IOT
#RootAdmin
${SIGNIN_USERNAME_ROOTADMIN}    QA_SC
${SIGNIN_PASSOWORD_ROOTADMIN}    VGVzdDEyMzQ=
#SupplierAdmin
${SIGNIN_USERNAME_SUPPLIERADMIN}    sctest_supplierddmin
${SIGNIN_PASSOWORD_SUPPLIERADMIN}    dGVzdDEyMzQ=
#CustomerAdmin
${SIGNIN_USERNAME_CUSTOMERADMIN}    sctest_customeradmin
${SIGNIN_PASSOWORD_CUSTOMERADMIN}    dGVzdDEyMzQ=
#Supplier
${SIGNIN_USERNAME_SUPPLIER}    sctest_supplier
${SIGNIN_PASSOWORD_SUPPLIER}    dGVzdDEyMzQ=
#Customer
${SIGNIN_USERNAME_CUSTOMER}    sctest_customer
${SIGNIN_PASSOWORD_CUSTOMER}    dGVzdDEyMzQ=

#================= Request API =======================
${PROVISIONINGAPIS}    /provisioningapis
${PULLMESSAGEAPIS}    /pullmessageapis
${CENTRICAPIS}    /centricapis
#header
${HEADER_CONTENT_TYPE}    application/json
${HEADER_ACCEPT}    */* 
${HEADER_X_AIS_USERNAME_AISPARTNER}    AisPartner
${HEADER_AUTHENTICATION}    Basic ZWxhc3RpYzpSM2RoQHQhQCM=
#NAME_SESSION
${NAME_SESSION_GET}    GET
${NAME_SESSION_POST}    POST
${NAME_SESSION_PUT}    PUT
${NAME_SESSION_DELETE}    DELETE
${FIELD_BEARER}    Bearer 
${FIELD_OPERATIONSTATUS}    OperationStatus
${FIELD_CODE}    Code
${FIELD_DESCRIPTION}    Description
${FIELD_OPERATIONSTATUS_LOWCASE}    operationStatus
${FIELD_CODE_LOWCASE}    code
${FIELD_DESCRIPTION_LOWCASE}    description
${FIELD_DEVELOPERMESSAGE}    DeveloperMessage
${FIELD_STATUS}    Status 
${FIELD_STATUSDESCRIPTION}    StatusDescription
#================= Result Code, Desc =================
#status code
${STATUS_CODE_SUCCESS}    200
${STATUS_CODE_CREATE}    201

#resultcode
${VALUE_RESULTCODE_20000}    20000
${VALUE_RESULTCODE_20100}    20100
#${VALUE_LOG_CODE_40000}    40000
#${VALUE_LOG_CODE_40300}    40300
${VALUE_RESULTCODE_40400}    40400
#${VALUE_LOG_CODE_40301}    40301
#${VALUE_LOG_CODE_40305}    40305
#${VALUE_LOG_CODE_40010}    40010
#${VALUE_LOG_CODE_40308}    40308
#${VALUE_LOG_CODE_40103}    40103
${VALUE_STATUS_SUCCESS}     Success

#${VALUE_LOG_SUMMARY_RESULTDESC_OK}    OK




# ${VALUE_LOG_SUMMARY_RESULTDESC_20000_REQUESTED_OPERATION_SUCCESSFULLY}    The requested operation was successfully
#${VALUE_DESCRIPTION_REQUESTED_OPERATION_SUCCESSFULLY}    The requested operation was successfully

#================= Date Time =================
#${MoY}    MoY
${MoY}    {dt:%B} {dt.year}
#${HMS}    H:M:S
${HMS}    {dt:%H}:{dt:%M}:{dt:%S}
#${HM}    H:M
${HM}    {dt:%H}:{dt:%M}
${MDYYYY_ADDSUB}    %m/%d/%Y
${DDMMYYYY_ADDSUB}    %d/%m/%Y
${MDYYYY_NOW}    {dt:%m}/{dt:%d}/{dt:%Y}
${DDMMYYYY_NOW}    {dt:%d}/{dt:%m}/{dt:%Y}
#22012000113011
${DDMMYYYYHMS_NOW}    {dt:%d}{dt:%m}{dt:%Y}{dt:%H}{dt:%M}{dt:%S}
#2021-01-11T03:14:18.255Z
${YYYYMMDDTHMSZ}    %Y-%m-%dT%H:%M:%S.000Z
#2021-01-11T03:14:18.255Z
${YYYYMMDDTHMSZ_FROM_NOW}    %Y-%m-%dT%H:%M:%S.000Z
#${YYYYMMDDTHMSZ_FROM_NOW}    {dt:%Y}-{dt:%m}-{dt:%d}T{dt:%H}:{dt:%M}:{dt:%S}.000Z
#${YYYYMMDDTHMSZ_FROM_NOW}    {dt:%Y}-{dt:%m}-{dt:%d}T00:00:00.000Z
#2021-01-11T03:59:59.999Z
${YYYYMMDDTHMSZ_TO_NOW}    %Y-%m-%dT%H:%M:%S.999Z
#${YYYYMMDDTHMSZ_TO_NOW}    {dt:%Y}-{dt:%m}-{dt:%d}T{dt:%H}:{dt:%M}:{dt:%S}.999Z
#${YYYYMMDDTHMSZ_TO_NOW}    {dt:%Y}-{dt:%m}-{dt:%d}T23:59:59.999Z
${YYYYMMDDTHMSZ_NOW}    %Y-%m-%dT%H:%M:%S.000Z
${YYYYMMDDTHMS_NOW}    %Y-%m-%dT%H:%M:%SZ
${DATE_MONGODB_NOW}    %Y, %m, %d, %H, %M, %S, %f
#Workin time button home
${DATE_LBL_NOW_TH}    - ตอนนี้
${DATE_LBL_NOW_EN}    -now
${DATE_TYPE_ADD}    add
${DATE_TYPE_SUBTRACT}    subtract
${TIME_STRING_HOURS}    hours
${TIME_STRING_MINUTES}    minutes
${TIME_STRING_SECONDS}    seconds
${RANGE_SEARCH}    15