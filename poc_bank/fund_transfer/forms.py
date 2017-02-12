from django.forms import ModelForm
from .models import Payee


class SameBankAddPayeeForm(ModelForm):
    class Meta:
        #fields = '__all__'
        # exclude = ['customer', 'name', 'account_type', 'bank_code', 'bank_name', 'bank_branch',
        #            'created_on', 'updated_on']
        exclude = ['bank_name', 'bank_branch', 'created_on', 'updated_on']
        model = Payee


class OtherBankAddPayeeForm(ModelForm):
    class Meta:
        #fields = '__all__'
        # exclude = ['customer', 'bank_branch', 'created_on', 'updated_on']
        exclude = ['created_on', 'updated_on']
        model = Payee
