# PDFs with Wicked PDF

This is example application that uses wicked pdf to:
1) Attach a styled pdf to an email
2) Allow uses to down a pdf version of a web page

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

This sample application using letter_opener to generate the sample emails.