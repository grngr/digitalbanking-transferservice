from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from .models import Payee, Customer, CustomerAccount, FundTransfer
from .forms import SameBankAddPayeeForm, OtherBankAddPayeeForm
from django.conf import settings


# Create your views here.
poc_bank_config = settings.POC_BANK_CONFIG
BANK_CODE = poc_bank_config['bank_code']
BANK_NAME = poc_bank_config['bank_name']
BANK_CITY = poc_bank_config['bank_city']
BANK_BRANCH = poc_bank_config['bank_branch']


@login_required
def same_bank_add_payee_form(request):
    # return HttpResponse("same_bank_add_payee_form")
    # return render(request, 'fund_transfer/same_bank_add_payee_form.html')
    if request.method == 'POST':
        form = SameBankAddPayeeForm(data=request.POST)
        if form.is_valid():
            # form.save()
            payee = form.save(commit=False)
            # payee.customer = Customer.objects.filter(user=request.user)[0]
            payee.set_customer_and_bank(request.user, BANK_CODE, BANK_NAME, BANK_CITY, BANK_BRANCH)
            payee.save()
            return redirect('same_bank_fund_transfer_list')
    else:
        form = SameBankAddPayeeForm()
    return render(request, 'fund_transfer/same_bank_add_payee_form.html', {'form': form})


@login_required
def same_bank_fund_transfer_list(request):
    # return HttpResponse("same_bank_fund_transfer_list")
    # payee_list = Payee.objects.filter(bank_code=BANK_CODE).filter(customer__user=request.user)
    payee_list = Payee.objects.fetch_payees_for_customer(request.user, BANK_CODE, True)
    return render(request, 'fund_transfer/same_bank_fund_transfer_list.html', {'payee_list': payee_list})


@login_required
def same_bank_fund_transfer(request):
    # return HttpResponse("same_bank_fund_transfer_form")
    return render(request, 'fund_transfer/same_bank_fund_transfer_form.html')


@login_required
def other_bank_add_payee_form(request):
    # return HttpResponse("other_bank_add_payee_form")
    # return render(request, 'fund_transfer/other_bank_add_payee_form.html')
    if request.method == 'POST':
        form = OtherBankAddPayeeForm(data=request.POST)
        if form.is_valid():
            # form.save()
            payee = form.save(commit=False)
            # payee.customer = Customer.objects.filter(user=request.user)[0]
            payee.set_customer(request.user)
            payee.save()
            return redirect('other_bank_fund_transfer_list')
    else:
        form = OtherBankAddPayeeForm()
    return render(request, 'fund_transfer/other_bank_add_payee_form.html', {'form': form})


@login_required
def other_bank_fund_transfer(request):
    # return HttpResponse("other_bank_fund_transfer_form")
    return render(request, 'fund_transfer/other_bank_fund_transfer_form.html')


@login_required
def other_bank_fund_transfer_list(request):
    # return HttpResponse("other_bank_fund_transfer_list")
    # payee_list = Payee.objects.filter(customer__user=request.user).exclude(bank_code=BANK_CODE)
    payee_list = Payee.objects.fetch_payees_for_customer(request.user, BANK_CODE, False)
    return render(request, 'fund_transfer/other_bank_fund_transfer_list.html', {'payee_list': payee_list})
