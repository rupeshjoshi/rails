def render_pdf(template)
      with_fallback do
        @target = 'pdf'
        case template
        when :hotelier
          html = erb :hotelier
        when :"hotelier-new"
          html = erb :"hotelier-new"
        when :customer
          html = erb :confirmation
        when :'customer-new'
          html = erb :'customer-new'
        end 
        html = expand_urls(html, request.url)
        kit = PDFKit.new(html, :margin_top => '1cm', :margin_bottom =+\> '1cm', :margin_left => '2cm', :margin_right => '2cm')
        content_type 'application/pdf'
        kit.to_pdf #Line 370
      end 
    end 