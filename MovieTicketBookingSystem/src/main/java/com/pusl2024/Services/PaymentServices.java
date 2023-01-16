package com.pusl2024.Services;


import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.pusl2024.Model.Order;

import java.util.ArrayList;
import java.util.List;

public class PaymentServices {
    // public static final String CLIENT_ID = "AVQ_uzbiau1ZG1cwr-ejjz6G5v5fa2CS9eqWk4wtw-BZGU0TVH3BTDds41DHeC4UX_EIHIdfR6OFKShC";
    public static final String CLIENT_ID = "AfhWeehel_PF_Kqt_awyg2TcuWG-NtAwgq0vKOHrMPdGwOnSLjV0e3Gcc3fMMHhFnt-ehHDfI1OU8twx";
    // public static final String CLIENT_SECRET = "EEFYFV0uoQX1Ja8E1pRN4bvS70I_CrzmqZ3KYWzGv8lbewrQ1W8zllqwkUFYLu0WU3NP9YjxGFI0ZpYY";
    public static final String CLIENT_SECRET = "EMmucQosu1Z-cFSfhClD0pOQ1TpuygkSrpjFMX97kWWeuwKQoW1sJ4E5PUc-tlfdJYWUwa5rPYoLwXeR";
    public static final String MODE = "sandbox";

    public String authorizePayment(Order orderDetail) throws PayPalRESTException {
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> transactionList = getTransactionInformation(orderDetail);

        Payment payment = new Payment();
        payment.setTransactions(transactionList).setRedirectUrls(redirectUrls).setPayer(payer).setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        Payment approvedPayment = payment.create(apiContext);

        System.out.println(approvedPayment);

        return getApprovalLink(approvedPayment);
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
            }
        }

        return approvalLink;
    }

    private List<Transaction> getTransactionInformation(Order orderDetail) {
        Details details = new Details();
        details.setShipping(orderDetail.getShipping());
        details.setSubtotal(orderDetail.getSubtotal());
        details.setTax(orderDetail.getTax());

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getTotal());
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getProductName());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<Item>();

        Item item = new Item();
        item.setCurrency("USD").setName(orderDetail.getProductName()).setPrice(orderDetail.getSubtotal()).setTax(orderDetail.getTax()).setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> transactionList = new ArrayList<Transaction>();
        transactionList.add(transaction);

        return transactionList;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/MovieTicketBookingSystem_war_exploded/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/MovieTicketBookingSystem_war_exploded/ReviewPaymentServlet");

        return redirectUrls;
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }

    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return payment.execute(apiContext, paymentExecution);
    }

    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Ravindu").setLastName("Dhanushka").setEmail("assshka@gmail.com");

        payer.setPayerInfo(payerInfo);

        return payer;
    }


}
