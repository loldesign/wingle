class TermPublishManager
  attr_accessor :new_term

  def initialize(options={})
    @term = options[:term]
  end

  def process
    archive_terms if @term.publish!

    @new_term        = Term.new(@term.attributes.slice('title', 'term', 'for'))
    @new_term.parent = @term

    @new_term.save
  end

  def archive_terms
    Term.with_for(@term.for).where.not(id: @term.id).published.each do |term|
      term.archive!
    end
  end
end
