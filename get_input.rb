module GetInput
  def get_input(prompt, obligatory: true)
    input = ""
    while input.empty?
      puts prompt
      print "> "
      input = gets.chomp
      (!obligatory && input.empty?) && (return input)
    end
    input
  end

  def get_with_options(prompt, options)
    input = ""
    until options.include?(input.downcase)
      puts prompt
      print_options(options)
      print "> "
      input = gets.chomp
    end

    input.capitalize
  end

  def print_options(options)
    options.each.with_index do |option, index|
      print "#{index + 1}. #{option.capitalize}\t\t"
    end
    print "\n"
  end
end
