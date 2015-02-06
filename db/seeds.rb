# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Person.create!(id: '000000000000000000000001', first_name: 'Tony', last_name: 'Donnaldsen', gender: 'Male', address: '14 Greentree Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW', housing_status: 'has_house', tfn: 'ABCD1234')
Person.create!(id: '000000000000000000000002', first_name: 'Liz', last_name: 'Donnaldsen', gender: 'Female', address: '14 Greentree Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW', housing_status: 'has_house', tfn: '1231123')
Person.create!(id: '000000000000000000000003', first_name: 'Jackie', last_name: 'Ferus', gender: 'Female', address: '23 Yelbon Avenue', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW', housing_status: 'has_house', tfn: '098723')
Person.create!(id: '000000000000000000000004', first_name: 'Bill Sigismund', last_name: 'Geyar', gender: 'Male', address: '48 Leafie Parade', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW', housing_status: 'needs_housing_tonight')
Person.create!(id: '000000000000000000000005', first_name: 'Wendy', last_name: 'Geyar', gender: 'Female', address: '48 Leafie Parade', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW', housing_status: 'has_house')
Person.create!(id: '000000000000000000000006', first_name: 'Dom', last_name: 'Knight', gender: 'Male', address: '11 Barnstorm Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW', tfn: 'DEGK123')
Person.create!(id: '000000000000000000000007', first_name: 'Leena', last_name: 'Lancasta', gender: 'Female', address: '44 Yelbon Avenue', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000008', first_name: 'Richard James', last_name: 'Ledgend', gender: 'Male', address: '15 Timberland Close', suburb: 'Springwood', postcode: '2777', state: 'NSW', housing_status: 'needs_housing_tonight', tfn: 'unkown')
Person.create!(id: '000000000000000000000009', first_name: 'Beth', last_name: 'Ledgend', gender: 'Female', address: '15 Timberland Close', suburb: 'Springwood', postcode: '2777', state: 'NSW', housing_status: 'needs_housing_tonight', tfn: '92132123')
Person.create!(id: '000000000000000000000010', first_name: 'Gordon Princheps', last_name: 'Murphay', gender: 'Male', address: '8 Raglin Street', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW', housing_status: 'needs_housing_this_week')
Person.create!(id: '000000000000000000000011', first_name: 'John', last_name: 'Pearl', gender: 'Male', address: '42 Puncher Avenue', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW', housing_status: 'has_house')
Person.create!(id: '000000000000000000000012', first_name: 'Carlita', last_name: 'Pearl', gender: 'Female', address: '16 Munrow Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000013', first_name: 'Tim Fanshaw', last_name: 'Pulver', gender: 'Male', address: '18 Munrow Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000014', first_name: 'Wayne Ian', last_name: 'Smith', gender: 'Female', address: '20 Munrow Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW', housing_status: 'has_house')
Person.create!(id: '000000000000000000000015', first_name: 'Rose', last_name: 'Vine', gender: 'Female', address: '12 Raglin Street', suburb: 'Yellow Rock', postcode: '2777', state: 'NSW', housing_status: 'needs_housing_this_week')
Person.create!(id: '000000000000000000000016', first_name: 'Andrew George', last_name: 'Waita', gender: 'Male', address: '31 Linklater Avenue', suburb: 'Springwood', postcode: '2777', state: 'NSW', housing_status: 'needs_housing_this_week')
Person.create!(id: '000000000000000000000017', first_name: 'Jill', last_name: 'Waita', gender: 'Female', address: '31 Linklater Avenue', suburb: 'Springwood', postcode: '2777', state: 'NSW', housing_status: 'needs_housing_this_week')
Person.create!(id: '000000000000000000000018', first_name: 'Seth', last_name: 'Walkin', gender: 'Male', address: '39 Albury Street', suburb: 'Springwood', postcode: '2777', state: 'NSW')
Person.create!(id: '000000000000000000000019', first_name: 'Jane', last_name: 'Wilsun', gender: 'Female', address: '44 Redgum Close', suburb: 'Winmalee', postcode: '2777', state: 'NSW', housing_status: 'has_house')
Person.create!(id: '000000000000000000000020', first_name: 'Irene', last_name: 'Yung', gender: 'Female', address: '85 Filmore Street', suburb: 'Winmalee', postcode: '2777', state: 'NSW')


token_layout = Wizard::Wizard.new(content: [
                                   Wizard::WizardNode.new(name: 'wizard.basic_information', content: [
                                                          Wizard::Qr.new(
                                                                         layout: PrintLayout::Layout.new(
                                                                                                         width: 0.30, height:0.90, left: 0.05, top:0.95)),
                                                          Wizard::Input.new(attribute: "first_name", label: 'First name', placeholder: '',
                                                                            layout: PrintLayout::Layout.new(
                                                                                                            width: 0.30, height:0.20, left: 0.35, top:0.95)),
                                                          Wizard::Input.new(attribute: "last_name", label: 'Last name', placeholder: '',
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
registration_wizard = Wizard::Wizard.new(content: [
                                             Wizard::WizardNode.new(name: 'wizard.welcome', content: [
                                                                                              Wizard::Headline.new(text: "Hello, nice to meet you."),
                                                                                              Wizard::NextButton.new(target: 'wizard.basic_information', label: 'Start my registration')
                                                                                          ]),

                                             Wizard::WizardNode.new(name: 'wizard.basic_information', content: [
                                                                                                        Wizard::Headline.new(text: "Who are you?"),
                                                                                                        Wizard::Split.new(content: [
                                                                                                                              Wizard::Input.new(attribute: "first_name", label: 'First name', placeholder: ''),
                                                                                                                              Wizard::Input.new(attribute: "last_name", label: 'Last name', placeholder: '')
                                                                                                                          ]),
                                                                                                        Wizard::SubmitButton.new(target: 'wizard.register', label: 'Register')
                                                                                                    ]),

                                             Wizard::WizardNode.new(name: 'wizard.register', content: [
                                                                                               Wizard::Headline.new(text: "Thank you for your registration"),
                                                                                               Wizard::Paragraph.new(text: "Please collect your name badge from the printing station."),
                                                                                               Wizard::Qr.new(),
                                                                                               Wizard::Link.new(target: '/people/new', label: 'Start over')
                                                                                           ]),
                                         ])
ServiceProvider.create!(name: 'FirstStop', wizard: registration_wizard, token_layout: token_layout, workbench: nil, special_role: :registration, person: Person.all)


tax_wizard = Wizard::Wizard.new(content: [
                                    Wizard::WizardNode.new(name: 'wizard.ato', content: [
                                                                                 Wizard::Headline.new(text: "ATO"),
                                                                                 Wizard::Split.new(content: [
                                                                                                       Wizard::Input.new(attribute: "first_name", label: 'First name', placeholder: '', additional_container_class: 'disabled'),
                                                                                                       Wizard::Input.new(attribute: "last_name", label: 'Last name', placeholder: '', additional_container_class: 'disabled')
                                                                                                   ]),

                                                                                 Wizard::Input.new(attribute: "tfn", label: 'Tax file number', placeholder: ''),
                                                                                 Wizard::SubmitButton.new(target: 'wizard.register', label: 'Register')
                                                                             ]),
                                ])
tax_workbench = Workbench::Workbench.new(
    table_attributes: {'first_name' => 'First name', 'last_name' => 'Last name', 'tfn' => 'Tax file number'},
    status_attribute: '',
    statuses: {})
ServiceProvider.create!(name: 'Australian Taxation Office', wizard: tax_wizard, workbench: tax_workbench, person: Person.all[1..10])


housing_workbench = Workbench::Workbench.new(
    table_attributes: {'first_name' => 'First name', 'last_name' => 'Last name', 'housing_status' => 'Housing status'},
    status_attribute: 'housing_status',
    statuses: {
        has_house: {css_class: 'positive', label: 'has housing'},
        needs_housing_tonight: {css_class: 'negative', label: 'no housing'},
        needs_housing_this_week: {css_class: 'warning', label: 'needs housing within next week'}
    })


housing_wizard = Wizard::Wizard.new(content: [
                                        Wizard::WizardNode.new(name: 'wizard.housing', content: [
                                                                                         Wizard::Headline.new(text: "Housing"),
                                                                                         Wizard::Split.new(content: [
                                                                                                               Wizard::Input.new(attribute: "first_name", label: 'First name', placeholder: '', additional_container_class: 'disabled'),
                                                                                                               Wizard::Input.new(attribute: "last_name", label: 'Last name', placeholder: '', additional_container_class: 'disabled')
                                                                                                           ]),
                                                                                         Wizard::Dropdown.new(attribute: "housing_status", label: 'Housing status', options: {has_house: 'has housing',
                                                                                                                                                                              needs_housing_tonight: 'no housing',
                                                                                                                                                                              needs_housing_this_week: 'needs housing within next week'}),
                                                                                         Wizard::SubmitButton.new(target: 'wizard.register', label: 'Register')
                                                                                     ]) ])
ServiceProvider.create!(name: 'Housing', wizard: housing_wizard, workbench: housing_workbench, person: Person.all[5..15])
