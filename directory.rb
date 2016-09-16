#let's put all students into an array
=begin students = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}   
    ]
=end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name
    name = gets.chomp
    #while the name is not empty, repeat this code
    while !name.empty? do
        #add the student hash to the array
        students << {name: name, cohort: :november}
        if students.length == 1
            puts "Now we have 1 student"
        else
            puts "Now we have #{students.count} students"
        end
        
        #get another name from the user
        name = gets.chomp
    end
    #return the array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "_______________"
end

def print(students)
    c12_students = students.select {|student|student[:name].length < 12}
    c12_students.each_with_index do |student, index|
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(names)
    if names.count == 1
        puts "Overall, we have 1 great student"
    else
        puts "Overall, we have #{names.count} great students"
    end
end
#nothing happens until we call the methods
students = input_students   
print_header
print(students)
print_footer(students)


