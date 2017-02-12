from rest_framework import serializers
from .models import Payee, Customer, CustomerAccount, FundTransfer


class PayeeSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Payee


class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Customer


class CustomerAccountSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = CustomerAccount


class FundTransferSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = FundTransfer