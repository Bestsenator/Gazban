from .models import *
from rest_framework import serializers


class GasEmployeeSer(serializers.ModelSerializer):
    class Meta:
        model = GasEmployee
        fields = ['Name', 'Family', 'NationalCode', 'ListOfPhone', 'AreaCode', 'CityCode', 'RepresentativeCode',
                  'ListOfVillage', 'ListOfMGasEmployee', 'RegisterTime', 'Session']


class ListGasEmployeeSer(serializers.ModelSerializer):
    class Meta:
        model = GasEmployee
        fields = ['Name', 'Family', 'NationalCode', 'ListOfPhone', 'AreaCode', 'CityCode', 'RepresentativeCode',
                  'ListOfVillages', 'ListOfMGasEmployee', 'RegisterTime']


class GetMListSer(serializers.ModelSerializer):
    class Meta:
        model = GasEmployee
        fields = ['Name', 'Family', 'ListOfPhone']


class RepresentativeSer(serializers.ModelSerializer):
    class Meta:
        model = Representative
        fields = '__all__'


class ListRepresentativeSer(serializers.ModelSerializer):
    class Meta:
        model = Representative
        fields = ['PeCode', 'Name', 'Family', 'NationalCode', 'ListOfPhone', 'Username', 'AgreementNumber', 'RegisterTime']


class RescuerSer(serializers.ModelSerializer):
    class Meta:
        model = Rescuer
        fields = '__all__'


class HeadCitySer(serializers.ModelSerializer):
    class Meta:
        model = HeadCity
        fields = '__all__'


class ListHeadCitySer(serializers.ModelSerializer):
    class Meta:
        model = HeadCity
        fields = ['PeCode', 'Name', 'Family', 'NationalCode', 'ListOfPhone', 'Username', 'CityCode', 'RegisterTime']


class HeadReliefSer(serializers.ModelSerializer):
    class Meta:
        model = HeadRelief
        fields = '__all__'


class ListHeadReliefSer(serializers.ModelSerializer):
    class Meta:
        model = HeadRelief
        fields = ['PeCode', 'Name', 'Family', 'NationalCode', 'ListOfPhone', 'Username', 'CityCode', 'RegisterTime']


class HeadAreaSer(serializers.ModelSerializer):
    class Meta:
        model = HeadArea
        fields = '__all__'
