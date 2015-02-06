module Services
    class PDFLayoutEngine
        def layout(object, component, document, width, height, left, top)
            if !document then
                document = Prawn::Document.new(:page_size => [height, width],
                                      :page_layout => :landscape,
                                      :margin => 0)
                documentfont_size = 18
            end
            
            
            # Calculate actual sizes from proportional sizes
            if component.layout then
                w = width * component.layout.width
                h = height * component.layout.height
                l = left + component.layout.left * width
                t = (top - height)  +  component.layout.top * height
            else
                # if not layout use containing layout
                w = width
                h = height
                l = left
                t = top
            end
            if component.respond_to?(:content) && component.content &&
                    !component.content.empty? then
                component.content.each do |inner_component|
                    layout(object, inner_component, document, w, h, l, t )
                end
            else
                if component.template_name == 'wizard/components/qr' then
                    document.image StringIO.new(
                            Services::Token.qr_code(object, 8).to_img.resize(h.to_i, h.to_i).to_blob),
                            :at => [l, t], :fit => [[h,w].min, [h,w].min]
               else
                    document.text_box "#{object[component[:attribute]]}",
                            :at => [l, t], :width => w, :height => h,
                            :overflow => :shrink_to_fit
                end
            end
            return document
        end
    end
end
