module ProcessSelectionManager
  class Create < Base

    def process
      return false if has_stared_process?

      @process_selection = ProcessSelection.create(owner: @owner, company: @company)

      transfer_candidates()
    end

    private
    def has_stared_process?
      @owner.process_selections.where(state: [:started, :setting]).present?
    end

    def transfer_candidates
      historic_process = @owner.process_selections.where(state: :historic).order(created_at: :desc).first

      historic_process.candidate_process_selections.update_all(process_selection_id: @process_selection.id) if historic_process.present?
    end
  end
end
