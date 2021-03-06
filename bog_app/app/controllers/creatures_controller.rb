class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all

  end



    def new
      @creature = Creature.new
    end

    def show

      creature_id = params[:id]

      @creature = Creature.find_by_id(creature_id)

    end

    def edit
      creature_id = params[:id]

      @creature = Creature.find_by_id(creature_id)

    end

    def update
      creature_id = params[:id]

      creature = Creature.find_by_id(creature_id)

      creature.update_attributes(creature_params)

      redirect_to creature_path(creature)

    end

    def destroy

      creature_id = params[:id]

      creature = Creature.find_by_id(creature_id)

      creature.destroy

      redirect_to creatures_path

    end

    def create

      creature = Creature.new(creature_params)

      if creature.save
        redirect_to creature_path(creature)

      end
    end

    private

    def creature_params
      params.require(:creature).permit(:name, :description)
    end


  end
