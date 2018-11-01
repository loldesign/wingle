module ProcessSelectionManager
  class Create < Base

    def process
      ProcessSelection.create(
        owner: @owner,
        company: @company
      ) unless has_stared_process?
    end

    private
    def has_stared_process?
      @owner.process_selections.where(state: [:started, :setting]).present?
    end
  end
end
