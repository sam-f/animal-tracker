# frozen_string_literal: true

module Dashboard
  class AnimalGroupsController < DashboardController
    before_action :set_animal_group, only: %i[edit update destroy].freeze

    def index
      @animal_groups = AnimalGroup.order(:name)
    end

    def new
      @animal_group = AnimalGroup.new
    end

    def create
      @animal_group = AnimalGroup.new(animal_group_params)
      @animal_group.user = current_user

      if @animal_group.save
        redirect_to dashboard_animal_groups_path, notice: "Saved."
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @animal_group.update(animal_group_params)
        redirect_to dashboard_animal_groups_path, notice: "Updated."
      else
        render :edit
      end
    end

    def destroy
      @animal_group.destroy
      redirect_to dashboard_animal_groups_path, notice: "Deleted."
    rescue ActiveRecord::DeleteRestrictionError, ActiveRecord::InvalidForeignKey
      redirect_to dashboard_animal_groups_path, alert: "This animal group contains animals, please delete those first before deleting this group."
    end

    private

    def animal_group_params
      params.require(:animal_group).permit(:name, :description)
    end

    def set_animal_group
      @animal_group = AnimalGroup.find_by(id: params[:id])
      not_found unless @animal_group.present?
    end
  end
end
