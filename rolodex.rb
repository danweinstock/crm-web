class Rolodex
	attr_reader :contacts

	def initialize
		@contacts = []
		@id = 1000
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end
end

def modify_contact(id)
		modified_contact = display_contact(id)
		
		puts '[1] Modify First Name' 
		puts '[2] Modify Last Name' 
		puts '[3] Modify Email'
		puts '[4] Modify Notes'
		puts 'Enter a number: '
		
		modify_number = gets.chomp.to_i

		case modify_number
			when 1
				print "New First Name: "
				new_first_name = gets.chomp
				# puts "You have changed first name to: #{new_first_name}"
				modified_contact.first_name = new_first_name
			when 2 
				print "New Last Name: "
				new_last_name = gets.chomp
				# puts "You have changed last name to: #{new_last_name}"
				modified_contact.last_name = new_last_name
			when 3
				print "New Email: "
				new_email = gets.chomp
				# puts "You have changed email to: #{new_email}"
				modified_contact.email = new_email
			when 4
				print "New Note: "
				new_note = gets.chomp
				# puts "You have changed note to: #{new_note}"
				modified_contact.note = new_note
			else 
				puts "That is not a valid response"
		end 
	end	
