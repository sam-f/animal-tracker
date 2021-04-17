# frozen_string_literal: true

module Dashboard
  class AnimalsController < DashboardController
    before_action :set_animal, only: %i[edit show update destroy].freeze
    before_action :set_scientific_names, only: %i[new edit create update].freeze
    before_action :set_common_names, only: %i[new edit create update].freeze
    before_action :set_animal_groups, only: %i[new edit create update].freeze
    before_action :set_suppliers, only: %i[new edit create update].freeze
    before_action :try_set_animal_group

    def index
      @animals = Animal
        .includes(:animal_group)
        .with_attached_photo

      if @animal_group.present?
        @animals = @animals.where(animal_group: @animal_group)
      end

      @animals.order(:name)
    end

    def new
      @animal = Animal.new
    end

    def show
    end

    def create
      @animal = Animal.new(animal_params)

      if @animal.save
        redirect_to dashboard_animals_path, notice: "Saved."
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @animal.update(animal_params)
        redirect_to dashboard_animals_path, notice: "Updated."
      else
        render :edit
      end
    end

    def destroy
      @animal.destroy
      redirect_to dashboard_animals_path, notice: "Deleted."
    end

    private

    def animal_params
      params
        .require(:animal)
        .permit(
          :animal_group_id, :age, :common_name,
          :date_acquired, :description,
          :name, :sex, :source, :supplier_id, :scientific_name
        )
    end

    def set_animal
      @animal = current_user.animals.find_by(id: params[:id])
      not_found unless @animal.present?
    end

    def try_set_animal_group
      return unless params[:animal_group_id].present?
      @animal_group = AnimalGroup.find_by(id: params[:animal_group_id])
    end

    def set_animal_groups
      @animal_groups = current_user.animal_groups
    end

    def set_suppliers
      @suppliers = current_user.suppliers
    end

    def set_scientific_names
      @scientific_names = current_user
        .animals
        .pluck(:scientific_name)
        .uniq
        .compact
        .freeze
    end

    def set_common_names
      @common_names = current_user
        .animals
        .pluck(:common_name)
        .uniq
        .compact
        .freeze
    end
  end
end
