def read_source_code
    file = File.open(__FILE__, "r")
    file.readlines.each do |line|
        puts line
    end
end

read_source_code
