# PDFs with Wicked PDF

This is example application that uses wicked pdf to:
* Attach a styled pdf to an email
* Allow users to down a pdf version of a web page

To use wicked pdf:
```ruby
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
```

Then create the initializer with

    rails generate wicked_pdf

In my case, I had to update the config/initializers/wicked_pdf.rb and comment out the following:

```ruby
#:exe_path => '/usr/local/bin/wkhtmltopdf'
```

In order to add styling to the pdf, you will need to add a layout for the pdf file and specify the layout in the pdf render:

In this example, I added one under 'views/layouts/pdf.html.erb' and specified the layout in the render with:
```ruby
:layout => 'pdf.html.erb'
```

Options:

In order to view the pdf html in the browser, add ?debug=true to the end of the url:

```ruby
http://0.0.0.0:3000/invoices/1.pdf?debug=true
```

and add the following to the pdf render:

```ruby
:show_as_html => params[:debug].present?
````

This sample application uses letter_opener to generate the sample emails.