*** Variables ***
#-------------------------------------------- signin --------------------------------------------#	
#path url signin
${URL_SIGNIN}    /api/v1/auth/signin
#header Signin
${HEADER_X_AIS_ORDERREF_SIGNIN}    Signin_
${HEADER_X_AIS_ORDERREF_SIGNIN_FAIL}    Signinfail_
${HEADER_X_AIS_ORDERDESC_SIGNIN}    User Authentication
#response description
${VALUE_DESCRIPTION_SINGNIN_SUCCESS}    SignInProcess is Success
#request name
${SINGNIN}    Signin
#-------------------------------------------- CreatePartner --------------------------------------------#	
#path url CreatePartner
${URL_CREATEPARTNER}    /api/v1/Partner/CreatePartner

#header CreatePartner
${HEADER_X_AIS_ORDERREF_CREATEPARTNER}    CreatePartner_
${HEADER_X_AIS_ORDERREF_CREATEPARTNER_FAIL}    CreatePartnerfail_
${HEADER_X_AIS_ORDERDESC_CREATEPARTNER}    CreatePartner

#value Create Partner
${VALUE_PARTNERNAME}    SC_
${VALUE_MERCHANTCONTACT}    Jida_TestMerchantContact@ais.co.th
${VALUE_CPID}    Jida_TesCPID@ais.co.th
${VALUE_ACCOUNTNAME}    Jida_TestAccountname
# ${VALUE_CONFIGGROUPNAME}    Sensor_TestThingGroupName

#response description
${VALUE_DESCRIPTION_CREATEPARTNER_SUCCESS}    CreatePartner is Success

#request name
${CREATEPARTNER}    CreatePartner
${CREATEPARTNER_OTHERROLE}    CreatePartnerOtherRole
#-------------------------------------------- RemovePartner --------------------------------------------#	
#path url remove
${URL_REMOVEPARTNER}    /api/v1/Partner/RemovePartner

#header RemovePartner
${HEADER_X_AIS_ORDERREF_REMOVEPARTNER}    RemovePartner_
${HEADER_X_AIS_ORDERREF_REMOVEPARTNER_FAIL}    RemovePartnerfail_
${HEADER_X_AIS_ORDERDESC_REMOVEPARTNER}    RemovePartner

#request name
${REMOVEPARTNER}    RemovePartner
${REMOVEPARTNER_OTHERROLE}    RemovePartnerOtherRole

#response description
${VALUE_DESCRIPTION_REMOVEPARTNER_SUCCESS}    RemovePartner is Success

#-------------------------------------------- CreateAccount --------------------------------------------#
#path url CreateAccount
${URL_CREATEACCOUNT}    /api/v1/Account/CreateAccount

#header CreateAccount
${HEADER_X_AIS_ORDERREF_CREATEACCOUNT}    CreateAccount_
${HEADER_X_AIS_ORDERREF_CREATEACCOUNT_FAIL}    CreateAccountfail_
${HEADER_X_AIS_ORDERDESC_CREATEACCOUNT}    CreateAccount

#value CreateAccount
${VALUE_ACCOUNTCODE}    AccountCode_

#response description
${VALUE_DESCRIPTION_CREATEACCOUNT_SUCCESS}    CreateAccount is Success

#request name
${CREATEACCOUNT}    CreateAccount
${CREATEACCOUNT_OTHERROLE}    CreateAccountOtherRole

#-------------------------------------------- RemoveAccont --------------------------------------------#
#path url RemoveAccount
${URL_REMOVEACCOUNT}    /api/v1/Account/RemoveAccount

#header InquiryAccount
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT}    RemoveAccount_
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT_FAIL}    RemoveAccountfail_
${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNT}    RemoveAccount

#response description
${VALUE_DESCRIPTION_REMOVEACCOUNT_SUCCESS}    RemoveAccount is Success

#request name
${REMOVEACCOUNT}    RemoveAccount
${REMOVEACCOUNT_OTHERROLE}    RemoveAccountOtherRole

#-------------------------------------------- CreateThing --------------------------------------------#	
#path url CreateThing
${URL_CREATETHING}    /api/v1/Thing/CreateThing

#header CreateThing
${HEADER_X_AIS_ORDERREF_CREATETHING}    CreateThing_
${HEADER_X_AIS_ORDERDESC_CREATETHING}    CreateThing

#value Create CreateThing
${VALUE_THINGNAME}    Sensor_TestThingName
${VALUE_ROUTEURL}    ["http://10.12.3.4:2019/api/information/AddInformation"]
${VALUE_ROUTEINFO_MIMO_ID}    "606edada"
${VALUE_ROUTEINFO_MIMO_SERIALNO}    5466758878
${VALUE_ROUTEFLAG_THINGNAME}    "true"
${VALUE_ROUTEFLAG_THINGTOKEN}    "true"
${VALUE_ROUTEFLAG_IMEI}    "true"
${VALUE_ROUTEFLAG_ICCID}    "true"
${VALUE_ROUTEFLAG_ROUTEINFO}    "true"

#response description
${VALUE_DESCRIPTION_CREATETHING_SUCCESS}    CreateThing is Success    

#request name
${CREATETHING}    CreateThing

#-------------------------------------------- RemoveThing --------------------------------------------#	
#path url remove
${URL_REMOVETHING}    /api/v1/Thing/RemoveThing

#header RemoveThing
${HEADER_X_AIS_ORDERREF_REMOVETHING}    RemoveThing_
${HEADER_X_AIS_ORDERDESC_REMOVETHING}    RemoveThing

#request name
${REMOVETHING}    RemoveThing

#response description
${VALUE_DESCRIPTION_REMOVETHING_SUCCESS}    RemoveThing is Success

#-------------------------------------------- ActivateThing Core --------------------------------------------#	
#path url ActivateThing Core
${URL_ACTIVATETHING_CORE}    /api/v1/Thing/ActivateThing

#header ActivateThing
${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE}    ActivateThing_
${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE_FAIL}    ActivateThingfail_
${HEADER_X_AIS_ORDERDESC_ACTIVATETHING_CORE}    ActivateThing

#response description
${VALUE_DESCRIPTION_ACTIVATETHING_CORE_SUCCESS}    ActivateThing is Success

#request name
${ACTIVATETHING_CORE}    ActivateThingCore

#-------------------------------------------- CreateThingStateInfo --------------------------------------------#	
#path url CreateThingStateInfo
${URL_CREATETHINGSTATEINFO}    /api/v1/Thing/CreateThingStateInfo

#header CreateThingStateInfo
${HEADER_X_AIS_ORDERREF_CREATETHINGSTATEINFO}    CreateThingStateInfo_
${HEADER_X_AIS_ORDERREF_CREATETHINGSTATEINFO_FAIL}    CreateThingStateInfofail_
${HEADER_X_AIS_ORDERDESC_CREATETHINGSTATEINFO}    CreateThingStateInfo

#value Create ThingStateInfo
${VALUE_SENSORKEY}    Temp
${VALUE_SENSORKEY_CHARGING}    AA
${VALUE_TYPE_REPORT}    Report
${VALUE_TYPE_DESIRE}    Desire
${VALUE_TYPE_DESIRE_INVALID}    desire

#response description
${VALUE_DESCRIPTION_CREATETHINGSTATEINFO_SUCCESS}    CreateThingStateInfo is Success

#request name
${CREATETHINGSTATEINFO}    CreateThingStateInfo
${CREATETHINGSTATEINFO_OTHERROLE}    CreateThingStateInfoOtherRole

#-------------------------------------------- CreateGroup --------------------------------------------#	
#path url CreateGroup
${URL_CREATEGROUP}    /api/v1/Group/CreateGroup

#header CreateGroup
${HEADER_X_AIS_ORDERREF_CREATEGROUP}    CreateGroup_
${HEADER_X_AIS_ORDERREF_CREATEGROUP_FAIL}    CreateGroupfail_
${HEADER_X_AIS_ORDERDESC_CREATEGROUP}    CreateGroup
 
#value CreateGroup
${VALUE_THINGGROUPNAME}    ThingGroupName
${VALUE_QUASARCONTENTTYPE}    None
${VALUE_QUASARREFRESHTIME}    0

#response description
${VALUE_DESCRIPTION_CREATEGROUP_SUCCESS}    CreateGroup is Success    

#request name
${CREATEGROUP}    CreateGroup
${CREATEGROUP_OTHERROLE}    CreateGroupOtherRole

#-------------------------------------------- CreateConfigGroup --------------------------------------------#	
#path url CreateConfigGroup
${URL_CREATECONFIGGROUP}    /api/v1/ConfigGroup/CreateConfigGroup

#header CreateConfigGroup
${HEADER_X_AIS_ORDERREF_CREATECONFIGGROUP}    CreateConfigGroup_
${HEADER_X_AIS_ORDERREF_CREATECONFIGGROUP_FAIL}    CreateConfigGroupfail_
${HEADER_X_AIS_ORDERDESC_CREATECONFIGGROUP}    CreateConfigGroup

#value Create ConfigGroup
${VALUE_CONFIGGROUPNAME}    QATestConfigGroupName
#"ConfigInfo": {"RefreshTime": "On","Max": "99"}
${VALUE_CONFIGINFO_KEY_REFRESHTIME}    RefreshTime
${VALUE_CONFIGINFO_KEY_REFRESHTIME_VALUE}    On
${VALUE_CONFIGINFO_KEY_MAX}    Max
${VALUE_CONFIGINFO_KEY_MAX_VALUE}    99
#response description
${VALUE_DESCRIPTION_CREATECONFIGGROUP_SUCCESS}    CreateConfigGroup is Success

#request name
${CREATECONFIGGROUP}    CreateConfigGroup
${CREATECONFIGGROUP_OTHERROLE}    CreateConfigGroupOtherRole

#-------------------------------------------- GeneratePullMessage --------------------------------------------#	
#path url GeneratePullMessage
${URL_GENERATEPULLMESSAGE}    /api/v1/PullMessage/GeneratePullMessage

#header GeneratePullMessage
${HEADER_X_AIS_ORDERREF_GENERATEPULLMESSAGE}    GeneratePullMessage_
${HEADER_X_AIS_ORDERREF_GENERATEPULLMESSAGE_FAIL}    GeneratePullMessagefail_
${HEADER_X_AIS_ORDERDESC_GENERATEPULLMESSAGE}    GeneratePullMessage

#value Create GeneratePullMessage
${VALUE_PULLMESSAGENAME}    PullMessageName
${VALUE_GENERATEPULLMESSAGE_TYPE_ALL}    All
${VALUE_GENERATEPULLMESSAGE_TYPE_CUSTOM}    Custom
${NUMBERFUTUREDATEPULLMESSAGE}    2
#response description
${VALUE_DESCRIPTION_PULLMESSAGE_SUCCESS}    PullMessageProcess is success

#request name
${GENERATEPULLMESSAGE}    GeneratePullMessage
${GENERATEPULLMESSAGE_OTHERROLE}    GeneratePullMessageOtherRole

#-------------------------------------------- PullMessageGetData --------------------------------------------#	
#path url PullMessageGetData
${URL_PULLMESSAGEGETDATA}    /api/listen/thing
${HEADER_X_AIS_ORDERREF_PullMessageGetData}    PullMessageGetData


#value Create GeneratePullMessage
${VALUE_PULLMESSAGENAME}    PullMessageName
${VALUE_GENERATEPULLMESSAGE_TYPE_ALL}    All
${VALUE_GENERATEPULLMESSAGE_TYPE_CUSTOM}    Custom
${NUMBERFUTUREDATEPULLMESSAGE}    2
#response description
${VALUE_DESCRIPTION_GENERATEPULLMESSAGE_SUCCESS}    GeneratePullMessage is Success
${VALUE_RESULTDESCRIPTION_THEPULLMESSAGENOTFOUND}    The Pull message key is Not Found
#request name
${GENERATEPULLMESSAGE}    PullMessageGetData

#-------------------------------------------- RemovePullMessage --------------------------------------------#	
#path url RemovePullMessage
${URL_REMOVEPULLMESSAGE}    /api/v1/PullMessage/RemovePullMessage

#header RemovePullMessage
${HEADER_X_AIS_ORDERREF_REMOVEPULLMESSAGE}    RemovePullMessage_
${HEADER_X_AIS_ORDERREF_REMOVEPULLMESSAGE_FAIL}    RemovePullMessagefail_
${HEADER_X_AIS_ORDERDESC_REMOVEPULLMESSAGE}    RemovePullMessage

#response description
${VALUE_DESCRIPTION_REMOVEPULLMESSAGE_SUCCESS}    RemovePullMessage is Success

#request name
${REMOVEPULLMESSAGE}    RemovePullMessage
${REMOVEPULLMESSAGE_OTHERROLE}    RemovePullMessageOtherRole

#-------------------------------------------- CreateAThing --------------------------------------------#	
#path url CreateAThing
${URL_CREATEATHING}    /api/v1/Things

#header CreateAThing
${HEADER_X_AIS_ORDERREF_CREATEATHING}    CreateAThing_
${HEADER_X_AIS_ORDERDESC_CREATEATHING}    CreateAThing

#value Create CreateAThing
# ${VALUE_THINGNAME}    Sensor_TestThingName

#response description
${VALUE_DESCRIPTION_CREATEATHING_SUCCESS}    The requested operation was successfully.

#request name
${CREATEATHING}    CreateAThing

#request name
${VALUE_ATHINGNAME}    ThingName
${VALUE_SUPPLIERID}    SupplierId
${VALUE_SUPPLIERNAME}    SupplierName 

${VALUE_THINGSTATE_IDLE}    Idle
${VALUE_THINGSTATE_PENDING}    Pending
${VALUE_THINGSTATE_MENUFACTURING}    Menufacturing
${VALUE_THINGSTATE_ACTIVATED}    Activated
${VALUE_CONNECTIVITYTYPE_NBIOT}    NBIOT
${VALUE_CONNECTIVITYTYPE_SIM3G}    SIM3G
${VALUE_CONNECTIVITYTYPE_SIM4G}    SIM4G
${VALUE_CONNECTIVITYTYPE_SIM5G}    SIM5G
${VALUE_CONNECTIVITYTYPE_WIFIOrWIMAX}    "WIFI or WIMAX
${VALUE_CONNECTIVITYTYPE_WIMAX}    WIMAX
${VALUE_CONNECTIVITYTYPE_WIFI}    WIFI
#-------------------------------------------- RemoveAThing --------------------------------------------#	
#path url remove
${URL_REMOVEATHING}    /api/v1/Things/

#header RemoveThing
${HEADER_X_AIS_ORDERREF_REMOVEATHING}    RemoveAThing_
${HEADER_X_AIS_ORDERDESC_REMOVEATHING}    RemoveAThing 

#request name
${REMOVEATHING}    RemoveAThing

#response description
${VALUE_DESCRIPTION_REMOVEATHING_SUCCESS}    The requested operation was successfully.
#-------------------------------------------- Import Thing --------------------------------------------#	
#path url ImportThing
${URL_IMPORTTHING}    /api/v1/Things/Import

#header ImportThing
${HEADER_X_AIS_ORDERREF_IMPORTTHING}    ImportThing_
${HEADER_X_AIS_ORDERDESC_IMPORTTHING}    ImportThing

#response description
${VALUE_DESCRIPTION_IMPORTTHING_SUCCESS}    The requested operation was successfully.

#request name
${IMPORTTHING}    ImportThing

#-------------------------------------------- Mapping IMEI --------------------------------------------#	
#path url MappingIMEI
${URL_MAPPINGIMEI}    /api/v1/Things/Mapping/IMEI

#header MappingIMEI
${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}    MappingIMEI_
${HEADER_X_AIS_ORDERDESC_MAPPINGIMEI}    MappingIMEI

#response description
${VALUE_DESCRIPTION_MAPPINGIMEI_SUCCESS}    The requested operation was successfully.

#request name
${MAPPINGIMEI}    MappingIMEI

#-------------------------------------------- ActivateThings Centric --------------------------------------------#	
#path url ActivateThings Centric
${URL_ACTIVATETHINGS_CENTRIC}    /api/v1/Capability/Worker/{WorkerId}/Thing/Activates

#header ActivateThings
${HEADER_X_AIS_ORDERREF_ACTIVATETHINGS_CENTRIC}    ActivateThings_
${HEADER_X_AIS_ORDERDESC_ACTIVATETHINGS_CENTRIC}    ActivateThings

#response description
${VALUE_DESCRIPTION_ACTIVATETHINGS_CENTRIC_SUCCESS}    The requested operation was successfully.

#request name
${ACTIVATETHINGS_CENTRIC}    ActivateThingsCentric

#-------------------------------------------- Other --------------------------------------------#	
#Other field
${FIELD_OPERATIONSTATUS}    OperationStatus
${FIELD_CODE}    Code
${FIELD_DESCRIPTION}    Description
${FIELD_ACCESSTOKEN}    AccessToken    
${FIELD_PARTNERINFO}    PartnerInfo
${FIELD_PARTNERINFO_LOWWERCASE}    partnerInfo   
${FIELD_PARTNERID}    PartnerId  
${FIELD_PARTNERNAME}    PartnerName
${FIELD_ACCOUNTINFO}    AccountInfo  
${FIELD_ACCOUNTNAME}    AccountName  
${FIELD_ACCOUNTID}    AccountId  
${FIELD_ACCOUNTCODE}    AccountCode 
${FIELD_THINGINFO}    ThingInfo  
${FIELD_THINGID}    ThingId 
${FIELD_THINGNNAME}    ThingName 
${FIELD_THINGIDENTIFIER}    ThingIdentifier  
${FIELD_THINGSECRET}    ThingSecret  
${FIELD_IMSI}    IMSI  
${FIELD_IMEI}    IMEI
${FIELD_THINGTOKEN}    ThingToken   
${FIELD_CONFIGGROUPINFO}    ConfigGroupInfo   
${FIELD_CONFIGGROUPID}    ConfigGroupId   
${FIELD_WORKERSINFO}    WorkersInfo 
${FIELD_WORKERID}    WorkerId
${FIELD_ACTIVATETHING}    ActivateThing
${FIELD_GROUPINFO}    GroupInfo  
${FIELD_GROUPID}    GroupId 
${FIELD_BACKUPDATAINFO}    BackupDataInfo 
${FIELD_PULLMESSAGEID}    PullMessageId 
${FIELD_PULLMESSAGEKEY}    PullMessageKey
${FIELD_ROUTEINFO}    RouteInfo
${FIELD_ROUTEID}    RouteId 
${FIELD_ROUTENAME}    RouteName
${FIELD_PURCHASEINFO}    PurchaseInfo 
${FIELD_CUSTOMERID}    CustomerId
${FIELD_SYSTEMUSERINFO}    SystemUserInfo
${FIELD_ICCID}    ICCID
${FIELD_SENSOR}    Sensor
${FIELD_ICCIDPRE}    896603
${ACCOUNTID_NULL}    Null
${ACCOUNTKEY_INVALID}    xx

#used flow ActivateThing and TransferThings for Crate WhiteList
${TYPE_CUSTOMER}    Customer 
${TYPE_TENANT}    Tenant 
${TYPE_ACCOUNT}    Account 

#used for Remove
${PARTNERACCOUNTTHINGARRCORE}    PartnerAccountThingArrCore
${PARTNERACCOUNTTHINGCORE}    PartnerAccountThingCore
${PARTNERACCOUNTTHINGARRCORE_OTHERROLE}    PartnerAccountThingArrCore_OtherRole
${PARTNERACCOUNTTHINGARRCORE_ACTIVATETHING}    PartnerAccountThingArrCore_ActivateThing
${PARTNERACCOUNTTHINGARRCORE_ACTIVATETHING_OTHERROLE}    PartnerAccountThingArrCore_Activatething_OtherRole
${PARTNERACCOUNTTHINGARRCORE_ACTIVATETHING_WHITELIST}    PartnerAccountThingArrCore_ActivateThing_WhiteList
${PARTNERACCOUNTTHINGARRCORE_ACTIVATETHING_WHITELIST_OTHERROLE}    PartnerAccountThingArrCore_ActivateThing_WhiteList_OtherRole
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS}    PartnerAccountThingArrCore_TransferThings
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_ACCOUNTCODE}    PartnerAccountThingArrCore_TransferThings_AccountCode
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_OTHERROLE}    PartnerAccountThingArrCore_TransferThings_OtherRole
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_ACCOUNTCODE_OTHERROLE}    PartnerAccountThingArrCore_TransferThings_AccountCode_OtherRole
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_WHITELIST}    PartnerAccountThingArrCore_TransferThings_WhiteList
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_ACCOUNTCODE_WHITELIST}    PartnerAccountThingArrCore_TransferThings_AccountCode_WhiteList
${PARTNERACCOUNTACCOUNT2}    PartnerAccountAccount2
${PARTNERACCOUNTACCOUNT2_OTHERROLE}    PartnerAccountAccount2_OtherRole
${PARTNERACCOUNTACCOUNT2_WHITELIST}    PartnerAccountAccount2_WhiteList

${PARTNERACCOUNT}    PartnerAccount
${PARTNERFORACCOUNT}    PartnerForAccount
${PARTNERACCOUNT_OTHERROLE}    PartnerAccountOtherRole
${PARTNERACCOUNT_WHITELIST_TRANSFERTHINHS}    PartnerAccount_WhiteList_TransferThings
${PARTNERACCOUNT_WHITELIST_ACTIVATETHING_CORE}    PartnerAccount_WhiteList_ActivateThing
${GENERATEPULLMESSAGE_REMOVETHINGSTATEINFO}    GeneratePullMessage_RemoveThingStateInfo
${UPDATEPULLMESSAGE_REMOVETHINGSTATEINFO}    UpdatePullMessage_RemoveThingStateInfo
${REMOVEPULLMESSAGE_REMOVETHINGSTATEINFO}    RemovePullMessage_RemoveThingStateInfo
${REMOVEPULLMESSAGE_REMOVETHINGSTATEINFO_OTHERROLE}    RemovePullMessage_RemoveThingStateInfo_OtherRole

