
Then(/^I can generate and see a token$/) do
    page.visit '/people/1.pdf'
end


And(/^I am registered in the database using$/) do |table|
    assert_equal(0, Person.count)
    
    person = Person.first
    person_data_extract = {}
    table.rows_hash.each do |key, value|
        person_data_extract[key] = value unless key == 'Attribute'
    end
    person = Person.new(person_data_extract)
    person.save()
end


Given(/^a basic token layout is defined$/) do
    token_layout = Wizard::Wizard.new(content: [
                                      Wizard::WizardNode.new(name: 'wizard.basic_information', content: [
                                                             Wizard::Qr.new(
                                                                            layout: PrintLayout::Layout.new(
                                                                                                            width: 0.30, height:0.90, left: 0.05, top:0.95)),
                                                             Wizard::Input.new(attribute: "input2-1", label: 'First name', placeholder: '',
                                                                               layout: PrintLayout::Layout.new(
                                                                                                               width: 0.30, height:0.20, left: 0.35, top:0.95)),
                                                             Wizard::Input.new(attribute: "inpur2-2", label: 'Last name', placeholder: '',
                                                                               layout: PrintLayout::Layout.new({
                                                                                                               width: 0.30, height: 0.20, left: 0.70, top: 0.95 }))
                                                             
                                                             
                                                             ],
                                                             layout: PrintLayout::Layout.new(                                                                                                 {
                                                                                             width: 1.0, height: 1.0,
                                                                                             left: 0.0, top: 1.0
                                                                                             }                                                                                                ) )
                                      
                                      
                                      
                                      ],
                                      layout: PrintLayout::Layout.new(                                                                                                 {                                                                                                 :width => 1.0, :height => 1.0,
                                                                      :left => 0.0, :top => 1.0
                                                                      }                                                                                                )
                                      )
                                             ServiceProvider.create!(name: 'FirstStop', token_layout: token_layout, special_role: :registration)
end