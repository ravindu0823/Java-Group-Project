package com.pusl2024.Model;

public class Order {
    private String productName;
    private float subtotal;
    private float shipping;
    private float tax;
    private float total;

    public Order(String productName, String subtotal, String shipping, String tax, String total) {
        this.productName = productName;
        this.subtotal = Float.parseFloat(subtotal);
        this.shipping = Float.parseFloat(shipping);
        this.tax = Float.parseFloat(tax);
        this.total = Float.parseFloat(total);
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = Float.parseFloat(subtotal);
    }

    public String getShipping() {
        return String.format("%.2f", shipping);
    }

    public void setShipping(String shipping) {
        this.shipping = Float.parseFloat(shipping);
    }

    public String getTax() {
        return String.format("%.2f", tax);
    }

    public void setTax(String tax) {
        this.tax = Float.parseFloat(tax);
    }

    public String getTotal() {
        return String.format("%.2f", total);
    }

    public void setTotal(String total) {
        this.total = Float.parseFloat(total);
    }
}
