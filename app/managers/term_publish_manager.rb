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
    published_term = Term.with_for(@term.for).published.first

    @term.update_attribute(:parent_id, published_term.id) if published_term.present?

    Term.with_for(@term.for).where.not(id: @term.id).published.each do |term|
      term.archive!
    end
  end

  def archive_terms_drafts
    Term.with_for(@term.for).where.not(id: @term.id).draft.each do |term|
      term.archive!
    end
  end
end
