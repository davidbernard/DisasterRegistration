module PrintLayout
    class Layout
        include ActiveModel::Model
        include MongoMapper::EmbeddedDocument
    
        key :height, Float
        key :width, Float
        key :top, Float
        key :left, Float
    end
end