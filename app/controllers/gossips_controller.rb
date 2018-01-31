class GossipsController < ApplicationController

  def index #index de base
    @gossips = Gossip.all
  end

def new #nouveau formulaire
	@gossip = Gossip.new
end


def create #créé un nouveaux "gossip" basé sur la classe
 
@gossip = Gossip.new(gossip_params)

@gossip.save
redirect_to @gossip

end

def edit
  end

 def show # affiche le gossip ciblé
        @gossip = Gossip.find(params[:id])
    end

 def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to gossips_path
    end


def update
    respond_to do |format|
      if @gossip.update(gossip_params)
        format.html { redirect_to @gossip, notice: 'Gossip was successfully updated.' }
        format.json { render :show, status: :ok, location: @gossip }
      else
        format.html { render :edit }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end


=begin
def update
        @gossip = Gossip.find(params[:id])
        if @gossip.update(gossip_params)
            redirect_to @gossip
        else 
            render 'EDITEEEEEEDDDD'
        end
    end
=end

     private

     def set_gossip
      @gossip = Gossip.find(params[:id])
    end

    def gossip_params
      params.require(:gossip).permit(:anonymous_author, :content)
    end

    end
