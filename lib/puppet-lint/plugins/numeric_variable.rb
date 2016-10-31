PuppetLint.new_check(:numeric_variable) do
  NUMERIC_VAR_TYPES = Set[:VARIABLE, :UNENC_VARIABLE]
  def check
    tokens.select { |r|
      NUMERIC_VAR_TYPES.include? r.type
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
