import json

from rest_framework.response import Response
from rest_framework.decorators import api_view
from funcs import auth
from .models import *
from .serializers import *

# Create your views here.


@api_view(["POST"])
def checkSession(request):
    print('checkSession Called...')
    resAuth = auth.authAPI(request)
    if type(resAuth) == dict:
        return Response(resAuth)
    listInput = ['Session', 'VersionApp', 'IpAddress', 'PhoneStatusKey']
    resCheckInp = auth.checkInput(request, listInput)
    if resCheckInp != 1:
        return Response(resCheckInp)
    session = request.data.get('Session')
    versionApp = request.data.get('VersionApp')  # do nothing version
    phoneModel = request.data.get('PhoneModel')  # do nothing phoneModel
    ipAddressPhone = request.data.get('IpAddress')  # do nothing ipAddress
    phoneStatusKey = request.data.get('PhoneStatusKey')  # do nothing phoneStatusKey
    isGasEmp = GasEmployee.objects.filter(Session=session).first()
    if isGasEmp:
        context = {
            'Info': GasEmployeeSer(isGasEmp).data,
            'Status': 200,  # is Gas Employee
        }
        return Response(context)
    isRepresentative = Representative.objects.filter(Session=session).first()
    if isRepresentative:
        context = {
            'Info': RepresentativeSer(isRepresentative).data,
            'Status': 201,  # is Representative
        }
        return Response(context)
    isRescuer = Rescuer.objects.filter(Session=session).first()
    if isRescuer:
        context = {
            'Info': RescuerSer(isRescuer).data,
            'Status': 202  # is Rescuer
        }
        return Response(context)
    isHeadCity = HeadCity.objects.filter(Session=session).first()
    if isHeadCity:
        context = {
            'Info': HeadCitySer(isHeadCity).data,
            'Status': 203  # is HeadCity
        }
        return Response(context)
    isHeadRelief = HeadRelief.objects.filter(Session=session).first()
    if isHeadRelief:
        context = {
            'Info': HeadReliefSer(isHeadRelief).data,
            'Status': 204  # is HeadRelief
        }
        return Response(context)
    isHeadArea = HeadArea.objects.filter(Session=session).first()
    if isHeadArea:
        context = {
            'Info': HeadAreaSer(isHeadArea).data,
            'Status': 205  # is HeadArea
        }
        return Response(context)
    #  for check Update Do nothing
    context = {
        'Status': 400,
        'Message': 'Information is Wrong'
    }
    return Response(context)


@api_view(['POST'])
def login(request):
    print('login Called...')
    resAuth = auth.authAPI(request)
    if type(resAuth) == dict:
        return Response(resAuth)
    listInput = ['Username', 'Password']
    resCheckInp = auth.checkInput(request, listInput)
    if resCheckInp != 1:
        return Response(resCheckInp)
    username = request.data.get('Username')
    password = request.data.get('Password')
    isGasEmployee = GasEmployee.objects.filter(Username=username, Password=password).first()
    if isGasEmployee:
        context = {
            'Info': GasEmployeeSer(isGasEmployee).data,
            'Status': 200  # is GasEmployee
        }
        return Response(context)
    isRepresentative = Representative.objects.filter(Username=username, Password=password).first()
    if isRepresentative:
        context = {
            'Info': RepresentativeSer(isRepresentative).data,
            'Status': 201,  # is Representative
        }
        return Response(context)
    isRescuer = Rescuer.objects.filter(Username=username, Password=password).first()
    if isRescuer:
        context = {
            'Info': RescuerSer(isRescuer).data,
            'Status': 202  # is Rescuer
        }
        return Response(context)
    isHeadCity = HeadCity.objects.filter(Username=username, Password=password).first()
    if isHeadCity:
        context = {
            'Info': HeadCitySer(isHeadCity).data,
            'Status': 203  # is HeadCity
        }
        return Response(context)
    isHeadRelief = HeadRelief.objects.filter(Username=username, Password=password).first()
    if isHeadRelief:
        context = {
            'Info': HeadReliefSer(isHeadRelief).data,
            'Status': 204  # is HeadRelief
        }
        return Response(context)
    isHeadArea = HeadArea.objects.filter(Username=username, Password=password).first()
    if isHeadArea:
        context = {
            'Info': HeadAreaSer(isHeadArea).data,
            'Status': 205  # is HeadArea
        }
        return Response(context)
    context = {
        'Status': 400,
        'Message': 'Information is Wrong'
    }
    return Response(context)


@api_view(['POST'])
def addRequest(request):
    print('addRequest Called...')
    resAuth = auth.authAPI(request)
    if type(resAuth) == dict:
        return Response(resAuth)
    listInput = ['PeCode', 'MCode', 'TypeRequest']
    resCheckInp = auth.checkInput(request, listInput)
    if resCheckInp != 1:
        return Response(resCheckInp)
    peCode = request.data.get('PeCode')  # Personally Code
    mCode = request.data.get('MCode')  # Moeen Code
    typeRequest = request.data.get('TypeRequest')
    duration = request.data.get('Duration')
    listTypeReq = ['Hourly', 'Daily']
    if typeRequest in listTypeReq:
        if typeRequest == listTypeReq[0]:
            if duration:
                if duration <= 0:
                    context = {
                        'Status': 400,
                        'Message': 'Information is Wrong'
                    }
                    return Response(context)
            else:
                context = {
                    'Status': 400,
                    'Message': 'Information is Wrong'
                }
                return Response(context)
    else:
        context = {
            'Status': 400,
            'Message': 'Information is Wrong'
        }
        return Response(context)
    gasEmpInfo = GasEmployee.objects.filter(PeCode=peCode).first()
    if gasEmpInfo:
        if mCode in gasEmpInfo.ListOfMGasEmployee.get('List'):
            if typeRequest == listTypeReq[0]:
                HourlyRequest.objects.create(PeCode=peCode, MCode=mCode, Duration=duration)
            else:
                DailyRequest.objects.create(PeCode=peCode, MCode=mCode)
            context = {
                'Status': 200,
            }
            return Response(context)
        else:
            context = {
                'Status': 400,
                'Message': 'Information is Wrong'
            }
            return Response(context)
    else:
        context = {
            'Status': 400,
            'Message': 'Information is Wrong'
        }
        return Response(context)


@api_view(['POST'])
def acceptRequest(request):
    print('acceptRequest Called...')
    resAuth = auth.authAPI(request)
    if type(resAuth) == dict:
        return Response(resAuth)
    listInput = ['PeCode', 'RequestCode']
    resCheckInp = auth.checkInput(request, listInput)
    if resCheckInp != 1:
        return Response(resCheckInp)
    peCode = request.data.get('PeCode')
    requestCode = request.data.get('RequestCode')
    gasEmpInfo = GasEmployee.objects.filter(PeCode=peCode).first()
    representativeInfo = Representative.objects.filter(PeCode=peCode).first()
    headCityInfo = HeadCity.objects.filter(PeCode=peCode).first()
    headReliefInfo = HeadRelief.objects.filter(PeCode=peCode).first()
    if gasEmpInfo:
        print('--GasEmployee')
        dReqInfo = DailyRequest.objects.filter(Code=requestCode, MCode=peCode,
                                               FConf=False, Status='WaitAccept').first()
        hReqInfo = HourlyRequest.objects.filter(Code=requestCode, MCode=peCode,
                                                FConf=False, Status='WaitAccept').first()
        if dReqInfo:
            print('---Daily')
            dReqInfo.FConf = True
            dReqInfo.save()
            context = {
                'Status': 200
            }
            return Response(context)
        elif hReqInfo:
            print('---Hourly')
            hReqInfo.FConf = True
            hReqInfo.save()
            context = {
                'Status': 200
            }
            return Response(context)
        else:
            context = {
                'Status': 400,
                'Message': 'Information is Wrong'
            }
            return Response(context)
    elif representativeInfo:
        print('--Representative')
        dReqInfo = DailyRequest.objects.filter(Code=requestCode, SConf=False, FConf=True, Status='WaitAccept').first()
        hReqInfo = HourlyRequest.objects.filter(Code=requestCode, SConf=False, FConf=True, Status='WaitAccept').first()
        if dReqInfo:
            print('---Daily')
            dReqInfo.SConf = True
            dReqInfo.save()
            context = {
                'Status': 200
            }
            return Response(context)
        elif hReqInfo:
            print('---Hourly')
            hReqInfo.SConf = True
            hReqInfo.save()
            context = {
                'Status': 200
            }
            return Response(context)
        else:
            context = {
                'Status': 400,
                'Message': 'Information is Wrong'
            }
            return Response(context)
    elif headCityInfo or headReliefInfo:
        print('--HeadCity or HeadRelief')
        dReqInfo = DailyRequest.objects.filter(Code=requestCode, TConf=False, FConf=True,
                                               SConf=True, Status='WaitAccept').first()
        if dReqInfo:
            print('---Daily')
            dReqInfo.TConf = True
            dReqInfo.Status = 'Accepted'
            dReqInfo.save()
            context = {
                'Status': 200
            }
            return Response(context)
        else:
            context = {
                'Status': 400,
                'Message': 'Information is Wrong'
            }
            return Response(context)
    else:
        context = {
            'Status': 400,
            'Message': 'Information is Wrong'
        }
        return Response(context)


@api_view(['POST'])
def getMList(request):
    print('getMList Called...')
    resAuth = auth.authAPI(request)
    if type(resAuth) == dict:
        return Response(resAuth)
    listInput = ['PeCode']
    resCheckInp = auth.checkInput(request, listInput)
    if resCheckInp != 1:
        return Response(resCheckInp)
    peCode = request.data.get('PeCode')
    gasEmpInfo = GasEmployee.objects.filter(PeCode=peCode).first()
    if gasEmpInfo:
        mGasEmpInfo = GasEmployee.objects.filter(PeCode__in=gasEmpInfo.ListOfMGasEmployee.get('List'))
        if mGasEmpInfo:
            for item in mGasEmpInfo:
                # item.ListOfVillage = item.ListOfVillage.get('List')
                # item.ListOfMGasEmployee = item.ListOfMGasEmployee.get('List')
                item.ListOfPhone = item.ListOfPhone.get('List')
            context = {
                'Info': GetMListSer(mGasEmpInfo, many=True).data,
                'Status': 200
            }
            return Response(context)
        else:
            context = {
                'Status': 201,  # Empty List
                'Message': 'MList is Empty'
            }
            return Response(context)
    else:
        context = {
            'Status': 400,
            'Message': 'Information is Wrong'
        }
        return Response(context)


@api_view(['POST'])
def getReportRequest(request):
    print('getReportRequest Called...')
    resAuth = auth.authAPI(request)
    if type(resAuth) == dict:
        return Response(resAuth)
    listInput = ['PeCode']
    resCheckInp = auth.checkInput(request, listInput)
    if resCheckInp != 1:
        return Response(resCheckInp)
    peCode = request.data.get('PeCode')
    fromD = request.data.get('From')
    toD = request.data.get('To')
    typeRequest = request.data.get('')
    if fromD == '0' and toD == '0':
        fromDate = jdatetime.datetime.today().date()
        toDate = jdatetime.datetime.today().date()
    else:
        try:
            fromD = fromD.split('/')
            fromDate = jdatetime.datetime(year=int(fromD[0]), month=int(fromD[1]), day=int(fromD[2])).date()
            toD = toD.split('/')
            toDate = jdatetime.datetime(year=int(toD[0]), month=int(toD[1]), day=int(toD[2])).date()
        except Exception as e:
            print(e.__class__.__name__)
            context = {
                'Status': 400,
                'Message': 'From or To is Wrong'
            }
            return Response(context)
    gasEmpInfo = GasEmployee.objects.filter(PeCode=peCode).first()
    if gasEmpInfo:
        pass

