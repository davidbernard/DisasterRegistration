require 'test_helper'

class TokenTests < ActiveSupport::TestCase
    def setup
        @person = Person.new( {first_name: "FirstName", last_name: "LastName which is very long", nickname: "FirstLast", speciality: "Frog Sitting" } )
        
        @token_layout = Wizard::Wizard.new(content: [
                                          Wizard::WizardNode.new(name: 'wizard.basic_information', content: [
                                                                 Wizard::Qr.new(
                                                                                   layout: PrintLayout::Layout.new(
                                                                                                                   width: 0.30, height:0.90, left: 0.05, top:0.95)),
                                                                 Wizard::Input.new(attribute: "first_name", label: 'First name', placeholder: '',
                                                                                   layout: PrintLayout::Layout.new(
                                                                                                                  width: 0.30, height:0.20, left: 0.35, top:0.95)),
                                                                 Wizard::Input.new(attribute: "last_name", label: 'Last name', placeholder: '',
                                                                                   layout: PrintLayout::Layout.new({
                                                                                                                   :width => 0.30, :height => 0.20, :left => 0.70, :top => 0.95 }))
                                                                 
                                                                 
                                                                 ],
                                                                 layout: PrintLayout::Layout.new(                                                                                                 {                                                                                                 :width => 1.0, :height => 1.0,
                                                                                                 :left => 0.0, :top => 1.0
                                                    }                                                                                                ) )
                                          
                                          
                                          
                                          ],
                                           layout: PrintLayout::Layout.new(                                                                                                 {                                                                                                 :width => 1.0, :height => 1.0,
                                                                           :left => 0.0, :top => 1.0
                                                                           }                                                                                                )
                                           )

    end

    test "Can generate QR code" do
        qr_code = Services::Token.qr_code(@person, 8)
        assert(qr_code.module_count > 0, "Non zero QR code contents")
    end

    test "Can generate DC03 PDF" do
        pdf = Services::Token.generate_token_pdf(@person, 'DC03', @token_layout)
        # pdf.render_file "test_token_DC03.pdf"
        assert(pdf.page_count == 1, "Non zero PDF  contents")
    end

    test "Can generate DC04 PDF" do
        pdf = Services::Token.generate_token_pdf(@person, 'DC04', @token_layout)
        # pdf.render_file "test_token_DC04.pdf"
        assert(pdf.page_count == 1, "Non zero PDF  contents")
    end

end
