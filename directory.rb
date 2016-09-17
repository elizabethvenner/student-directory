@students = []  

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name
    name = gets.delete!("\n")
    #while the name is not empty, repeat this code
    while !name.empty? do
        puts "Please enter the cohort"
        cohort = gets.chomp.capitalize
        while cohort != "January" && cohort != "February" && cohort != "March" && cohort != "April" && cohort != "May" && cohort != "June" && cohort != "July" && cohort != "August" && cohort != "September" && cohort != "October" && cohort != "November" && cohort != "December" && cohort != ""
            puts "Please enter January, February, March, April, May, June, July, August, September, October, November or December."
            cohort = gets.chomp
        end
        if cohort.empty?
            cohort = :November
        else
            cohort = cohort.to_sym
        end
        puts "Please enter the student's hobbies"
        hobby = gets.chomp
        puts "Please enter student's country of birth"
        birth_country = gets.chomp
        puts "Please enter students height in feet and inches"
        height = gets.chomp
        #add the student hash to the array
        students << {name: name, cohort: cohort, hobby: hobby, birth_country: birth_country, height: height}
        if students.length == 1
            puts "Now we have 1 student"
            puts "Please add another student or press enter twice to exit"
        else
            puts "Now we have #{students.count} students"
            puts "Please add another student or press enter twice to exit"
        end
        #get another name from the user
        name = gets.chomp
    end
end

def interactive_menu
    loop do
        #1. print the menu and ask the user what to do
        print_menu
        #2. read the input and save it into a variable
        process(gets.chomp)
        #3. do what the user has asked
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list(@students)
    print_footer(@students)
end

def process (selection)
    case selection
        when "1"
            @students = input_students
        when "2"
            show_students
        when "9"
            exit # this will cause the program to terminate
        else
            puts "I don't know what you meant, try again"
    end
end

def print_header
    puts "The students of Villains Academy".center(20)
    puts "_______________".center(20)
end

def print_students_list(students)
    cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
    if students.count >= 1 # this is throwing an error - investigate later
        counter = 0
        cohorts.each do |cohort|
            students.each do |student|
                if cohort == student[:cohort] 
                    counter += 1
                    puts"#{counter}. #{student[:name]} (#{student[:cohort]} cohort) is from #{student[:birth_country]}, measures #{student[:height]} and likes #{student[:hobby]}."
                end
            end
        end
    end
end

def print_footer(names)
    if names.count == 1
        puts "Overall, we have 1 great student".center(20)
    else
        puts "Overall, we have #{names.count} great students".center(20)
    end
end
#nothing happens until we call the methods
interactive_menu


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