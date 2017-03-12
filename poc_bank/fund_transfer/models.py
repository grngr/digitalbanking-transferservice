from django.db import models
from django.contrib.auth.models import User

# Create your models here.


ACCOUNT_TYPE_CHOICES = (
    ('sa', 'Savings'),
    ('ca', 'Current'),
    ('cc', 'Credit Card')
)


class Customer(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    phone = models.CharField(max_length=15)
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)

    def __str__(self):
        return '{} | {} | {} | {} | {} | {}'.format(self.user.id, self.user.username, self.user.first_name,
                                                    self.user.last_name, self.phone, self.user.email)


class PayeeManager(models.Manager):
    def fetch_payees_for_customer(self, user, bank_code, is_same_bank):
        qs = super(PayeeManager, self).get_queryset().filter(customer__user=user)
        differentiate_by = qs.filter if is_same_bank else qs.exclude
        qs = differentiate_by(bank_code=bank_code)
        return qs.order_by('nickname')


class Payee(models.Model):
    customer = models.ForeignKey(Customer)
    name = models.CharField(max_length=50)
    nickname = models.CharField(max_length=30)
    account_number = models.CharField(max_length=35)
    account_type = models.CharField(max_length=2, default='sa', choices=ACCOUNT_TYPE_CHOICES,
                                    verbose_name='Account / Card type',
                                    help_text='Please choose the account / card type')
    bank_code = models.CharField(max_length=50)
    bank_name = models.CharField(max_length=50)
    bank_city = models.CharField(max_length=50)
    bank_branch = models.CharField(max_length=50)
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    objects = PayeeManager()

    def set_customer(self, user):
        self.customer = Customer.objects.filter(user=user)[0]

    def set_customer_and_bank(self, user, bank_code, bank_name, bank_city, bank_branch):
        self.set_customer(user)
        self.bank_code = bank_code
        self.bank_name = bank_name
        self.bank_city = bank_city
        self.bank_branch = bank_branch

    def __str__(self):
        return '{} | {} | {} | {} | {} | {} | {} | {} | {} | {} | {} | {}'.format(
            self.customer.user.username, self.id, self.name, self.nickname, self.account_number, self.account_type,
            self.bank_code, self.bank_name, self.bank_city, self.bank_branch, self.created_on, self.updated_on)


class CustomerAccountManager(models.Manager):
    def customer_account_for_customer(self, user):
        return super(CustomerAccountManager, self).get_queryset().filter(customer__user=user)


class CustomerAccount(models.Model):
    customer = models.ForeignKey(Customer)
    account_number = models.CharField(max_length=35)
    account_type = models.CharField(max_length=2, default='sa', choices=ACCOUNT_TYPE_CHOICES)
    balance = models.DecimalField(max_digits=14, decimal_places=2)  # 999,999,999,999.99
    created_on = models.DateTimeField(auto_now_add=True)
    updated_on = models.DateTimeField(auto_now=True)
    objects = CustomerAccountManager()

    def __str__(self):
        return '{} | {} | {} | {} | {} | {}'.format(self.customer.user.username, self.account_number, self.account_type,
                                                    self.balance, self.created_on, self.updated_on)


class FundTransferManager(models.Manager):
    def fund_transfer_for_customer_account(self, from_account):
        return super(FundTransferManager, self).get_queryset().filter(customer_account=from_account)


class FundTransfer(models.Model):
    customer_account = models.ForeignKey(CustomerAccount)
    payee = models.ForeignKey(Payee)
    narration = models.CharField(max_length=100)
    amount = models.DecimalField(max_digits=14, decimal_places=2)  # 999,999,999,999.99
    balance = models.DecimalField(max_digits=14, decimal_places=2)  # 999,999,999,999.99
    created_on = models.DateTimeField(auto_now_add=True)
    objects = FundTransferManager()

    def __str__(self):
        return '{} | {} | {} | {} | {} | {}'.format(self.customer_account.account_number, self.payee.name,
                                                    self.narration, self.amount, self.balance, self.created_on)
