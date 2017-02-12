from rest_framework import viewsets
from .serializers import PayeeSerializer, CustomerSerializer, CustomerAccountSerializer, FundTransferSerializer
from .models import Payee, Customer, CustomerAccount, FundTransfer


class SamePayeeViewSet(viewsets.ModelViewSet):
    queryset = Payee.objects.filter(bank_code='1234')
    serializer_class = PayeeSerializer

    def get(self, request):
        self.queryset.filter(customer__user=request.user)


class OtherPayeeViewSet(viewsets.ModelViewSet):
    queryset = Payee.objects.exclude(bank_code='1234')
    serializer_class = PayeeSerializer

    def get(self, request):
        self.queryset.exclude(customer__user=request.user)


class CustomerViewSet(viewsets.ModelViewSet):
    queryset = Customer.objects.all()
    serializer_class = CustomerSerializer


class CustomerAccountViewSet(viewsets.ModelViewSet):
    queryset = CustomerAccount.objects.all()
    serializer_class = CustomerAccountSerializer


class FundTransferViewSet(viewsets.ModelViewSet):
    queryset = FundTransfer.objects.all()
    serializer_class = FundTransferSerializer
