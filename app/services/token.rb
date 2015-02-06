require 'rqrcode_png'
require 'stringio'
require 'prawn'
require 'prawn/measurement_extensions'

module Services
    class Token
        
    def self.qr_code(person, size)
        data = Rails.configuration.qr_code_generator.content(person)
        # Loop increasing "modules" until QR code renders
        begin
            img = RQRCode::QRCode.new( data, :size => size, :level => :l)
            return img
        rescue
            size += 1
            retry unless size > 40
        end
    
    end
    
    def self.generate_token_pdf(person, media, layout)

        media_parameters = {
            'DC03' =>  { :width => 90, :height =>29, :leftMargin => 2, :rightMargin => 5 , :spacing => 3 },
            'DC04' =>  { :width => 90, :height =>38, :leftMargin => 1, :rightMargin => 5 , :spacing => 3 },
           'A4' =>  { :width => 90, :height =>29, :leftMargin => 2, :rightMargin => 3 , :spacing => 3 } }
        
        parameters = media_parameters[media]
        Rails.logger.info "Parameters #{parameters}"
        width = parameters[:width].send(:mm)
        height = parameters[:height].send(:mm)

        layout_engine = PDFLayoutEngine.new()

        pdf = layout_engine.layout(person,
                             layout, nil,
                             width, height, 0.0, height)
        return pdf
    end
    
end
    
end
