class InvoiceMailer < ActionMailer::Base
  default from: 'you@example.com'
  
  def invoice_created(invoice_id)
    @invoice = Invoice.find(invoice_id)
    attachments['invoice.pdf'] = WickedPdf.new.pdf_from_string(
      render_to_string(:pdf => 'file_name', :template => 'invoices/show.pdf.erb', :layout => 'pdf.html.erb'))
    mail(to: 'you@example.com', subject: "Your Invoice is Ready")
  end
    
end