class Step
  attr_reader :file, :line, :regexp
  def initialize(regexp, file, line)
    @file, @line = file, line
    self.regexp = regexp
  end

  def regexp=(value)
    @regexp =
      case value
      when String
        pieces, regexp = [], value.dup
        regexp.gsub!(/\$\w+/) { |match| pieces << match; "TOKEN" }
        regexp = Regexp.escape(regexp)
        regexp.gsub!(/TOKEN/) { |match| "(.*)" }
        Regexp.new("^#{regexp}$")
      when Regexp
        value
      else
        STDERR.puts "Warning: invalid parameter to Given/When/Then on #{file}:#{line}.  Expected Regexp or String, got #{value.class} #{value.inspect}"
        Regexp.new(/^INVALID PARAM$/)
      end
  end

  def match?(text)
    @regexp.match(text)
  end
end


class StepParser
  STEP_REGEXP = /^(Given|When|Then|And)\s*(?:\/|(?:%r[\[\(\{]))(.*)(?:\/|[\]\)\}]).*$/

  def self.parse(file)
    steps_file = File.new(file).readlines
    steps = []

    steps_file.each_with_index do |line, i|
      step_definition = line.match(STEP_REGEXP)
      if step_definition
        regexp = Regexp.new(step_definition[2], true)
        steps << Step.new(regexp, file, i+1)
      end
    end

    return steps
  end
end


input_text = ARGV[0].strip.gsub(/(When|Then|Given|And)\s*/, "")

files = Dir["features/**/*steps.rb"]
steps = []
files.each do |file|
  steps.concat(StepParser.parse(file))
end

steps.each do |step|
  if step.match?(input_text)
    puts "#{step.file}:#{step.line}"
  end
end
