class WizardController < ApplicationController
  def index

    @model = [
        Wizard::WizardNode.new(id: 'wizard.welcome', content: [
            Wizard::Headline.new(text: "Hello, nice to meet you."),
            Wizard::Paragraph.new(text: "Welcome to RHoK. We are team First Stop and we came together to start making a difference at the June 2014 RHoK. We have made some great progress and would like to use what we have built to help RHoK participants register. This will help us with our testing solution, and iron out any issues prior to using it in the wild."),
            Wizard::Paragraph.new(text: "So, before you start doing something good for the world @ RHoK, please register your details with us. We will print your very own name tag for this weekend! If you want to connect with others, simply scan the QR code on their name tag and add them to your contacts."),
            Wizard::NextButton.new(target: 'wizard.basic_information', text: 'Start my registration')
        ]),

        Wizard::WizardNode.new(id: 'wizard.basic_information', content: [
            Wizard::Headline.new(text: "Who are you?"),
            Wizard::Split.new(content: [
                Wizard::Input.new(id: "first_name", text: 'First name', placeholder: ''),
                Wizard::Input.new(id: "last_name", text: 'Last name', placeholder: '')
            ]),
            Wizard::Input.new(id: "nickname", text: 'How would you like to be called this weekend? (on badge)', placeholder: ''),
            Wizard::Input.new(id: "speciality", text: 'What\'s your speciality? (on badge)', placeholder: ''),
            Wizard::NextButton.new(target: 'wizard.contact_details', text: 'Next')
        ]),

        Wizard::WizardNode.new(id: 'wizard.contact_details', content: [
            Wizard::Headline.new(text: "What information would you like to share?"),
            Wizard::Paragraph.new(text: "Note: Everybody who scans the QR code on your badge will be able to see these details, so please only enter details that you are happy to share."),
            Wizard::Input.new(id: "email", text: 'E-Mail', placeholder: ''),
            Wizard::Input.new(id: "current_contact_phone", text: 'Phone number', placeholder: ''),
            Wizard::NextButton.new(target: 'wizard.fun_fact', text: 'Next')
        ]),

        Wizard::WizardNode.new(id: 'wizard.fun_fact', content: [
           Wizard::Headline.new(text: "To break the ice..."),
           Wizard::Input.new(id: "super_power", text: 'Whats your super-power?  (on badge)', placeholder: ''),
           Wizard::Input.new(id: "fun_fact", text: 'Tell us something funny about you?', placeholder: ''),
           Wizard::NextButton.new(target: 'wizard.avatar', text: 'Next')
       ]),

        Wizard::WizardNode.new(id: 'wizard.avatar', content: [
            Wizard::Headline.new(text: "Select an avatar"),
            Wizard::ImageSelector.new(id: "avatar", images: ['superheros/adamstrange256.png', 'superheros/aquaman256.png', 'superheros/atom256.png', 'superheros/batman256.png', 'superheros/boostergold256.png', 'superheros/captainmarvel256.png', 'superheros/catwoman256.png', 'superheros/flash256.png', 'superheros/greenarrow256.png', 'superheros/greenlantern256.png', 'superheros/kittypryde256.png',  'superheros/robin256.png', 'superheros/rorschach256.png', 'superheros/spiderman256.png', 'superheros/superman256.png', 'superheros/wolverine256.png']),
            Wizard::SubmitButton.new(target: 'wizard.register', text: 'Register')
        ]),

        Wizard::WizardNode.new(id: 'wizard.register', content: [
            Wizard::Headline.new(text: "Thank you for your registration"),
            Wizard::Paragraph.new(text: "Please collect your name badge from the printing station and start networking with your fellow hackers."),
            Wizard::Qr.new(),
            Wizard::Link.new(target: '/wizard', text: 'Start over')
        ]),
    ]
  end
end
