PuppetLint.new_check(:numeric_variable) do
  def check
    tokens.select { |r|
      VARIABLE_TYPES.include? r.type
    }.each do |token|
      if token.value.match(/^[0-9]+$/)
        notify :warning, {
          :message => 'variable is solely numeric',
          :line    => token.line,
          :column  => token.column,
        }
      end
    end
  end
end
