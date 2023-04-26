from .models import *
from rest_framework import serializers


class GasEmployeeSer(serializers.ModelSerializer):
    class Meta:
        model = GasEmployee
        fields = ['Name', 'Family', 'NationalCode', 'ListOfPhone', 'AreaCode', 'CityCode', 'RepresentativeCode',
                  'ListOfVillage', 'ListOfMGasEmployee', 'RegisterTime', 'Session']


class GetMListSer(serializers.ModelSerializer):
    class Meta:
        model = GasEmployee
        fields = ['Name', 'Family', 'ListOfPhone']


class RepresentativeSer(serializers.ModelSerializer):
    class Meta:
        model = Representative
        fields = '__all__'


class RescuerSer(serializers.ModelSerializer):
    class Meta:
        model = Rescuer
        fields = '__all__'


class HeadCitySer(serializers.ModelSerializer):
    class Meta:
        model = HeadCity
        fields = '__all__'


class HeadReliefSer(serializers.ModelSerializer):
    class Meta:
        model = HeadRelief
        fields = '__all__'


class HeadAreaSer(serializers.ModelSerializer):
    class Meta:
        model = HeadArea
        fields = '__all__'
