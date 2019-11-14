class TodoListsController < ApplicationController
    before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

    # GET /todo_lists
    # GET /todo_lists.json
    def index
        if user_signed_in?
            @todo_lists = TodoList.where(:user_id => current_user.id).order("created_at DESC")
            @others_lists = TodoList.where.not(:user_id => current_user.id).where(:private => false).order("created_at DESC")
            @types = ["star_border", "star"]

            @favorites = current_user.favorites
            @ids = []

            @favorites.each do |fav|
                @ids << fav.id
            end
        end    
    end

    # GET /todo_lists/1
    # GET /todo_lists/1.json
    def show
    end

    # GET /todo_lists/new
    def new
        @todo_list = current_user.todo_lists.build
        @todo_list.tasks.build
        # @todo_list = TodoList.new
        # @todo_list.build_tasks
    end

    # GET /todo_lists/1/edit
    def edit
    end

    # POST /todo_lists
    # POST /todo_lists.json
    def create
        @todo_list = current_user.todo_lists.build(todo_list_params)
        @todo_list.unique_id = Time.now.to_f

        respond_to do |format|
            if @todo_list.save
                format.html { redirect_to root_path, notice: 'Lista criada com sucesso.' }
                format.json { render :show, status: :created, location: @todo_list }
            else
                format.html { render :new }
                format.json { render json: @todo_list.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /todo_lists/1
    # PATCH/PUT /todo_lists/1.json
    def update
        respond_to do |format|
            if @todo_list.update(todo_list_params)
                format.html { redirect_to root_path, notice: 'Todo list was successfully updated.' }
                format.json { render :show, status: :ok, location: @todo_list }
            else
                format.html { render :edit }
                format.json { render json: @todo_list.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /todo_lists/1
    # DELETE /todo_lists/1.json
    def destroy
        @todo_list.destroy
        respond_to do |format|
            format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def favorite
        id = params[:id]
        type = params[:type]
        list = TodoList.where(:id => id)

        if type == "favorite"
            current_user.favorites << list
            redirect_to root_url
            # redirect_to root_url, notice: "You favorited #{list.description}"
        elsif type == "unfavorite"
            current_user.favorites.delete(list)
            redirect_to root_url
            # redirect_to root_url, notice: "Removing #{list.description}"
        else
            redirect_to root_url, notice: 'Nothing happened.'
        end
    end

    def favorites
        @todo_lists = TodoList.where(:user_id => current_user.id).order("created_at DESC")
        @others_lists = TodoList.where.not(:user_id => current_user.id).where(:private => false).order("created_at DESC")
        @favorites = current_user.favorites
        @ids = []

        @favorites.each do |fav|
            @ids << fav.id
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
        @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
        params.require(:todo_list).permit(:description, :completed, :private, 
            tasks_attributes: [:title, :description, :completed, :_destroy])
    end
end
