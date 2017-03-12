from django.forms import ModelForm
from .models import Payee


class SameBankAddPayeeForm(ModelForm):
    class Meta:
        #fields = '__all__'
        exclude = ['customer', 'bank_code', 'bank_name', 'bank_city', 'bank_branch', 'created_on', 'updated_on']
        model = Payee


class OtherBankAddPayeeForm(ModelForm):
    class Meta:
        #fields = '__all__'
        exclude = ['customer', 'created_on', 'updated_on']
        model = Payee
