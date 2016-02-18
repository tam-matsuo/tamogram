class MarkdownRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    formatter = Rouge::Formatters::HTML.new(wrap: false)
    if language and language.include?('html')
      lexer = Rouge::Lexer.find('html')
      '<div class="styleguide_preview">' + code + '</div>' + '<div class="styleguide_codeblock"><pre>' + formatter.format(lexer.lex(code)) + '</pre></div>'
    end
  end
end
