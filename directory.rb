@students = [] 


def enter_cohort
    puts "Please enter the cohort"
    @cohort = STDIN.gets.chomp.capitalize
    while @cohort != "January" && @cohort != "February" && @cohort != "March" && @cohort != "April" && @cohort != "May" && @cohort != "June" && @cohort != "July" && @cohort != "August" && @cohort != "September" && @cohort != "October" && @cohort != "November" && @cohort != "December" && @cohort != ""
        puts "Please enter January, February, March, April, May, June, July, August, September, October, November or December."
        @cohort = STDIN.gets.chomp
    end
    if @cohort.empty?
        @cohort = :November
    else
        @cohort = @cohort.to_sym
    end
end

def input_to_array(name, cohort)
    @students << {name: name, cohort: @cohort.to_sym}
end

def input_students
    puts "Please enter the names of the students. To finish, just hit return twice"
    #create an empty array
    #get the first name
    name = STDIN.gets.delete!("\n")
    #while the name is not empty, repeat this code
    while !name.empty? do
        enter_cohort
        #puts "Please enter the student's hobbies"
        #hobby = STDIN.gets.chomp
        #puts "Please enter student's country of birth"
        #birth_country = STDIN.gets.chomp
        #puts "Please enter students height in feet and inches"
        #height = STDIN.gets.chomp
        #add the student hash to the array
        input_to_array(name, @cohort)
        if @students.length == 1
            puts "Now we have 1 student"
            puts "Please add another student or press enter twice to exit"
        else
            puts "You have successfully input this student. Now we have #{@students.count} students"
            puts "Please add another student or press enter twice to exit"
        end
        #get another name from the user
        name = STDIN.gets.chomp
    end
end

def interactive_menu
    loop do
        #1. print the menu and ask the user what to do
        print_menu
        #2. read the input and save it into a variable
        process(STDIN.gets.chomp)
        #3. do what the user has asked
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to file"
    puts "4. Load the list from file"
    puts "9. Exit"
end

def show_students
    print_header
    print_student_list
    print_footer
end

def process (selection)
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            save_students
            puts "Student(s) saved"
        when "4"
            puts "Which file would you like to load?"
            filename = gets.chomp
            load_students(filename) 
        when "9"
            puts "You are exiting the program"
            exit # this will cause the program to terminate
        else
            puts "I don't know what you meant, try again"
    end
end

def print_header
    puts "The students of Villains Academy".center(20)
    puts "_______________".center(20)
end

def print_student_list 
    cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
    if @students.count >= 1 # this is throwing an error - investigate later
        counter = 0
        cohorts.each do |cohort|
            @students.each do |student|
                if cohort == student[:cohort]  
                    counter += 1
                    puts"#{counter}. #{student[:name]} (#{student[:cohort]} cohort)"
                end
            end
        end
    end
end


def print_footer
    if @students.count == 1
        puts "Overall, we have 1 great student".center(20)
    else
        puts "Overall, we have #{@students.count} great students".center(20)
    end
end

def save_students
    #open the file for writing
    puts "Which file would you like to save these students to?"
    filename = gets.chomp
    file = File.open(filename, "w")
    #iterate over the array of students
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_students(filename="")
    if filename.nil?
        puts "Which file would you like to load?"
        filename = gets.chomp
    end
    file = File.open(filename, "r"){|file|
    file.readlines.each do |line|
        name, @cohort = line.chomp.split(',')
            input_to_array(name, @cohort)
    end
    puts "Loaded #{@students.count} from #{filename}"
    }
end

def load_students_from_command
    filename = ARGV.first # first argument from the command line
    if filename.nil?
        load_students(filename)
    elsif File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else #if it doesn't exist
        puts "Sorry, #{filename} doesn't exist"
        exit #quit the program
    end
end
#nothing happens until we call the methods
load_students_from_command
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