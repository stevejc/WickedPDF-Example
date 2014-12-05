class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end
  
  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        :template => 'invoices/show.pdf.erb',
        :layout => 'pdf.html.erb',
        :show_as_html => params[:debug].present?
      end
    end
  end
  
  def new
    @invoice = Invoice.new
  end
  
  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to @invoice, notice: "Successfully added an invoice"
    else
      render 'new'
    end
  end
  
  def email_invoice
    @invoice = Invoice.find(params[:id])
    InvoiceMailer.invoice_created(@invoice).deliver
    redirect_to @invoice
  end
  
private

  def invoice_params
    params.require(:invoice).permit(:name, :amount, :invoice_date)
  end
end